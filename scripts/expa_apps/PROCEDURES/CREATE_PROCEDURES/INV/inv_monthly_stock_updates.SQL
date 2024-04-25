/* *******************************************
 * 月末在庫締め処理プロシージャ
 * *******************************************/
CREATE OR REPLACE PROCEDURE inv_monthly_stock_updates(inUserCode IN TEXT, inFunctionCode IN TEXT, inTerminal IN TEXT) AS $$ 
DECLARE
	--受払実績カーソル
	transactionCursor	CURSOR
	IS
	SELECT		inv_stock_transactions.id				AS	transaction_id
	,			inv_stock_transactions.location_code
	,			inv_stock_transactions.product_code
	,			inv_stock_transactions.inventory_seq
	,			inv_stock_transactions.traded_at
	,			inv_stock_transactions.inout_div
	,			inv_stock_transactions.transaction_div
	,			inv_stock_transactions.transaction_user_code
	,			inv_stock_transactions.is_corrected
	,			inv_stock_transactions.description
	,			inv_stock_transaction_quantities.purchase_unit_price
	,			inv_stock_transaction_quantities.transaction_quantity
	,			inv_transaction_summary.total_transaction_quantity
	,			inv_current_stock.current_stock_quantity
	FROM		inv_stock_transactions
	INNER JOIN	inv_stock_transaction_quantities
	ON			inv_stock_transactions.id			=	inv_stock_transaction_quantities.transaction_id
	INNER JOIN	(
					SELECT		transaction_id
					,			SUM(transaction_quantity)	AS	total_transaction_quantity
					FROM		inv_stock_transaction_quantities
					GROUP BY		transaction_id
				) inv_transaction_summary
	ON			inv_stock_transactions.id			=	inv_transaction_summary.transaction_id
	LEFT JOIN		(
					SELECT		inv_stocks.id
					,			inv_stocks.location_code
					,			inv_stocks.product_code
					,			inv_stocks.inventory_seq
					,			inv_stock_summary.current_stock_quantity
					FROM		inv_stocks
					INNER JOIN	(
									SELECT		stock_id
									,			SUM(stock_quantity)		AS	current_stock_quantity
									FROM		inv_stock_quantities
									GROUP BY		stock_id
								)	inv_stock_summary
					ON			inv_stocks.id		=	inv_stock_summary.stock_id
				) inv_current_stock
	ON			inv_stock_transactions.location_code		=	inv_current_stock.location_code
	AND			inv_stock_transactions.product_code		=	inv_current_stock.product_code
	AND			inv_stock_transactions.inventory_seq		=	inv_current_stock.inventory_seq
	ORDER BY		inv_stock_transactions.location_code
	,			inv_stock_transactions.product_code
	,			inv_stock_transactions.inventory_seq
	,			inv_stock_transactions.traded_at
	,			transaction_id
	;
	transactionRecord			RECORD;
	
	currentStockCurSor			CURSOR
	IS
	SELECT		*
	FROM		tmp_stock_summary
	ORDER BY		location_code
	,			product_code
	,			inventory_seq
	,			purchase_unit_price
	;
	currentStockRecord			RECORD;
	
	--前行保持変数
	prevTransactionId		BIGINT := 0;
	prevLocationCode		TEXT := '';
	prevProductCode			TEXT := '';
	prevInventorySeq		INTEGER := 0;
	
	--現在庫数
	currentStock		NUMERIC := NULL;
	transactionHistoryId	BIGINT := 0;
	monthlyStockId		BIGINT := 0;
	stockId			BIGINT := 0;
	
	--前月
	closingDate			DATE := NULL;
	--当年月
	targetYm			TEXT := '';
BEGIN
	RAISE INFO '在庫締め処理ジョブ開始';
	
	-- 前月末の日付を取得
	SELECT DATE_TRUNC('month', now()) +'-1 Day' INTO closingDate;
	RAISE INFO '%', closingDate; 
	
	-- 当年月を取得
	SELECT TO_CHAR(now(), 'YYYYMM') INTO targetYm;
	
	-- テーブルロック
	LOCK inv_stock_transactions IN EXCLUSIVE MODE;
	LOCK inv_stock_transaction_quantities IN EXCLUSIVE MODE;
	LOCK inv_stocks IN EXCLUSIVE MODE;
	LOCK inv_stock_quantities IN EXCLUSIVE MODE;
	
	--受払実績テーブルからデータ取得
	OPEN transactionCursor;
		LOOP 
			FETCH transactionCursor INTO transactionRecord;
			--データが存在しない場合は終了
			IF NOT FOUND THEN
				EXIT;
			END IF;
			
			--前行と現在行が同在庫場所、同商品、同在庫管理番号かどうかチェック
			IF prevLocationCode = transactionRecord.location_code 
				AND prevProductCode = transactionRecord.product_code 
					AND prevInventorySeq = transactionRecord.inventory_seq THEN
			ELSE
				--前行と商品が異なる場合は、当月在庫数を取得して現在庫とする
				currentStock := transactionRecord.current_stock_quantity;
			END IF;
						
			--受払履歴データ作成
			IF prevTransactionId != transactionRecord.transaction_id THEN
				INSERT INTO inv_stock_transaction_histories (
					location_code
				,	product_code
				,	inventory_seq
				,	traded_at
				,	inout_div
				,	transaction_div
				,	transaction_user_code
				,	is_corrected
				,	description
				,	prev_stock_quantity
				,	created_user_code
				,	created_terminal
				,	created_function_code
				,	updated_user_code
				,	updated_terminal
				,	updated_function_code
				) VALUES (
					transactionRecord.location_code
				,	transactionRecord.product_code
				,	transactionRecord.inventory_seq
				,	transactionRecord.traded_at
				,	transactionRecord.inout_div
				,	transactionRecord.transaction_div
				,	transactionRecord.transaction_user_code
				,	transactionRecord.is_corrected
				,	transactionRecord.description
				,	currentStock
				,	inUserCode
				,	inTerminal
				,	inFunctionCode
				,	inUserCode
				,	inTerminal
				,	inFunctionCode
				);
				
				--履歴IDの取得
				SELECT CURRVAL('inv_stock_transaction_histories_id_seq') INTO transactionHistoryId;
			END IF;
			
			--明細データ作成
			INSERT INTO inv_stock_transaction_quantity_histories (
				transaction_history_id
			,	purchase_unit_price
			,	transaction_quantity
			,	created_user_code
			,	created_terminal
			,	created_function_code
			,	updated_user_code
			,	updated_terminal
			,	updated_function_code
			) VALUES (
				transactionHistoryId
			,	transactionRecord.purchase_unit_price
			,	transactionRecord.transaction_quantity
			,	inUserCode
			,	inTerminal
			,	inFunctionCode
			,	inUserCode
			,	inTerminal
			,	inFunctionCode
			);
			
			--同じ受払データでない場合は現在庫の計算を行う
			IF prevTransactionId != transactionRecord.transaction_id THEN
				
				IF transactionRecord.inout_div = 'IN' THEN
					--入庫
					currentStock := currentStock + transactionRecord.total_transaction_quantity;
				ELSE
					--出庫
					currentStock := currentStock - transactionRecord.total_transaction_quantity;
				END IF;
			END IF;
			
			prevTransactionId := transactionRecord.transaction_id;
			prevLocationCode := transactionRecord.location_code;
			prevProductCode := transactionRecord.product_code;
			prevInventorySeq := transactionRecord.inventory_seq;
			
		END LOOP;
	CLOSE transactionCursor;
	
		
	--一時テーブル(当月在庫集計)作成
	CREATE TEMPORARY TABLE tmp_stock_summary (
		location_code			TEXT
	,	product_code			TEXT
	,	inventory_seq			INTEGER
	,	purchase_unit_price		NUMERIC
	,	stock_quantity			NUMERIC
	,	first_stocked_on			DATE
	) ON COMMIT DROP;
	
	--一時テーブルに現在庫データを退避
	INSERT INTO	tmp_stock_summary
	SELECT		location_code
	,			product_code
	,			inventory_seq
	,			purchase_unit_price
	,			SUM(stock_quantity)		AS	stock_quantity
	,			MIN(first_stocked_on)		AS	first_stocked_on
	FROM		(
					SELECT		NULL										AS	transaction_id
					,			NULL										AS	traded_at
					,			inv_stocks.location_code
					,			inv_stocks.product_code
					,			inv_stocks.inventory_seq
					,			inv_stock_quantities.purchase_unit_price
					,			inv_stock_quantities.stock_quantity				
					,			inv_stock_quantities.first_stocked_on
					,			NULL										AS	transaction_user_code
					FROM		inv_stocks
					INNER JOIN	inv_stock_quantities
					ON			inv_stocks.id	=	inv_stock_quantities.stock_id
					UNION ALL
					SELECT		inv_stock_transactions.id
					,			inv_stock_transactions.traded_at
					,			inv_stock_transactions.location_code
					,			inv_stock_transactions.product_code
					,			inv_stock_transactions.inventory_seq
					,			inv_stock_transaction_quantities.purchase_unit_price
					,			inv_stock_transaction_quantities.transaction_quantity
					,			TO_DATE(TO_CHAR(inv_stock_transactions.traded_at, 'YYYY-MM-DD'), 'YYYY-MM-DD')
					,			inv_stock_transactions.transaction_user_code
					FROM		inv_stock_transactions
					INNER JOIN	inv_stock_transaction_quantities
					ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.transaction_id
					WHERE		inv_stock_transactions.inout_div	=	'IN'
					UNION ALL
					SELECT		inv_stock_transactions.id
					,			inv_stock_transactions.traded_at
					,			inv_stock_transactions.location_code
					,			inv_stock_transactions.product_code
					,			inv_stock_transactions.inventory_seq
					,			inv_stock_transaction_quantities.purchase_unit_price
					,			-1 * inv_stock_transaction_quantities.transaction_quantity
					,			NULL
					,			inv_stock_transactions.transaction_user_code
					FROM		inv_stock_transactions
					INNER JOIN	inv_stock_transaction_quantities
					ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.transaction_id
					WHERE		inv_stock_transactions.inout_div	=	'OUT'
				)	inv_stock_summary
	GROUP BY		location_code
	,			product_code
	,			inventory_seq
	,			purchase_unit_price
	HAVING		SUM(stock_quantity)	!=	0
	ORDER BY		location_code
	,			product_code
	,			inventory_seq
	,			purchase_unit_price
	;
	
	--受払テーブルデータ削除
	DELETE FROM inv_stock_transactions;
	DELETE FROM inv_stock_transaction_quantities;
	
	--当月在庫テーブルデータ削除
	DELETE FROM inv_stocks;
	DELETE FROM inv_stock_quantities;
	
	prevLocationCode := '';
	prevProductCode	:= '';
	prevInventorySeq := 0;
	--当月在庫取得
	OPEN currentStockCurSor;
		LOOP
			FETCH currentStockCurSor INTO currentStockRecord;
			--データが存在しない場合は終了
			IF NOT FOUND THEN
				EXIT;
			END IF;
		
			
			IF prevLocationCode != currentStockRecord.location_code
				OR prevProductCode != currentStockRecord.product_code
					OR prevInventorySeq != currentStockRecord.inventory_seq THEN
					
				--前行の商品と異なる場合は月末在庫ヘッダー作成
				INSERT INTO inv_monthly_stocks (
					target_on
				,	location_code
				,	product_code
				,	inventory_seq
				,	created_user_code
				,	created_terminal
				,	created_function_code
				,	updated_user_code
				,	updated_terminal
				,	updated_function_code
				) VALUES (
					closingDate
				,	currentStockRecord.location_code
				,	currentStockRecord.product_code
				,	currentStockRecord.inventory_seq
				,	inUserCode
				,	inTerminal
				,	inFunctionCode
				,	inUserCode
				,	inTerminal
				,	inFunctionCode
				);
				
				--履歴IDの取得
				SELECT CURRVAL('inv_monthly_stocks_id_seq') INTO monthlyStockId;
				
				
				--前行の商品と異なる場合は当月在庫ヘッダー作成
				INSERT INTO inv_stocks (
					current_ym
				,	location_code
				,	product_code
				,	inventory_seq
				,	created_user_code
				,	created_terminal
				,	created_function_code
				,	updated_user_code
				,	updated_terminal
				,	updated_function_code
				) VALUES (
					targetYm
				,	currentStockRecord.location_code
				,	currentStockRecord.product_code
				,	currentStockRecord.inventory_seq
				,	inUserCode
				,	inTerminal
				,	inFunctionCode
				,	inUserCode
				,	inTerminal
				,	inFunctionCode
				);
				
				--当月在庫IDの取得
				SELECT CURRVAL('inv_stocks_id_seq') INTO stockId;
			END IF;
			
			--月末在庫明細データ作成
			INSERT INTO inv_monthly_stock_quantities (
				monthly_stock_id
			,	purchase_unit_price
			,	stock_quantity
			,	created_user_code
			,	created_terminal
			,	created_function_code
			,	updated_user_code
			,	updated_terminal
			,	updated_function_code
			) VALUES (
				monthlyStockId
			,	currentStockRecord.purchase_unit_price
			,	currentStockRecord.stock_quantity
			,	inUserCode
			,	inTerminal
			,	inFunctionCode
			,	inUserCode
			,	inTerminal
			,	inFunctionCode
			);
			
			--当月在庫明細データ作成
			INSERT INTO inv_stock_quantities (
				stock_id
			,	purchase_unit_price
			,	stock_quantity
			,	first_stocked_on
			,	created_user_code
			,	created_terminal
			,	created_function_code
			,	updated_user_code
			,	updated_terminal
			,	updated_function_code
			) VALUES (
				stockId
			,	currentStockRecord.purchase_unit_price
			,	currentStockRecord.stock_quantity
			,	currentStockRecord.first_stocked_on
			,	inUserCode
			,	inTerminal
			,	inFunctionCode
			,	inUserCode
			,	inTerminal
			,	inFunctionCode
			);
			
			prevLocationCode := currentStockRecord.location_code;
			prevProductCode := currentStockRecord.product_code;
			prevInventorySeq := currentStockRecord.inventory_seq;
		END LOOP;
	CLOSE currentStockCurSor;
	
	--終了
	RAISE INFO '在庫締め処理終了';
	
EXCEPTION
	WHEN OTHERS THEN
		RAISE INFO 'SQLSTATE = %', SQLSTATE;
		RAISE INFO 'SQLERRM = %', SQLERRM;
		RETURN;
END;	
$$ LANGUAGE plpgsql;
ALTER PROCEDURE inv_monthly_stock_updates(inUserCode IN TEXT, inFunctionCode IN TEXT, inTerminal IN TEXT) OWNER to expa_apps;