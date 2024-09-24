/* *******************************************
 * 月末在庫締め処理プロシージャ
 * *******************************************/
CREATE OR REPLACE PROCEDURE inv_monthly_stock_closing(inClosingOn IN DATE, inUserCode IN TEXT, inFunctionCode IN TEXT, inTerminal IN TEXT) AS $$ 
DECLARE
	-- 一時テーブルカーソル
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

BEGIN
	RAISE INFO '在庫締め処理ジョブ開始';
	
	-- テーブルロック
	LOCK inv_stock_transactions IN EXCLUSIVE MODE;
	LOCK inv_stock_transaction_quantities IN EXCLUSIVE MODE;
	LOCK inv_stocks IN EXCLUSIVE MODE;
	LOCK inv_stock_quantities IN EXCLUSIVE MODE;
	
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
					SELECT		NULL										AS	stock_transaction_id
					,			NULL										AS	traded_at
					,			inv_stocks.location_code
					,			inv_stocks.product_code
					,			inv_stocks.inventory_seq
					,			inv_stock_quantities.purchase_unit_price
					,			inv_stock_quantities.stock_quantity				
					,			inv_stock_quantities.first_stocked_on
					,			NULL										AS	transaction_employee_code
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
					,			inv_stock_transactions.transaction_employee_code
					FROM		inv_stock_transactions
					INNER JOIN	inv_stock_transaction_quantities
					ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.stock_transaction_id
					WHERE		inv_stock_transactions.inout_div	=	'IN'
					AND			inv_stock_transactions.closing_on	IS	NULL
					AND			TO_DATE(TO_CHAR(inv_stock_transactions.traded_at, 'YYYY-MM-DD'), 'YYYY-MM-DD') <=	inClosingOn
					UNION ALL
					SELECT		inv_stock_transactions.id
					,			inv_stock_transactions.traded_at
					,			inv_stock_transactions.location_code
					,			inv_stock_transactions.product_code
					,			inv_stock_transactions.inventory_seq
					,			inv_stock_transaction_quantities.purchase_unit_price
					,			-1 * inv_stock_transaction_quantities.transaction_quantity
					,			NULL
					,			inv_stock_transactions.transaction_employee_code
					FROM		inv_stock_transactions
					INNER JOIN	inv_stock_transaction_quantities
					ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.stock_transaction_id
					WHERE		inv_stock_transactions.inout_div	=	'OUT'
					AND			inv_stock_transactions.closing_on	IS	NULL
					AND			TO_DATE(TO_CHAR(inv_stock_transactions.traded_at, 'YYYY-MM-DD'), 'YYYY-MM-DD') <=	inClosingOn
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
					closing_on
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
					inClosingOn
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
					closing_on
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
					inClosingOn
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
	
	--締日設定
	UPDATE	inv_stock_transactions
	SET		closing_on					=	inClosingOn
	WHERE	inv_stock_transactions.closing_on	IS	NULL
	AND		TO_DATE(TO_CHAR(inv_stock_transactions.traded_at, 'YYYY-MM-DD'), 'YYYY-MM-DD') <=	inClosingOn
	;
	
	--終了
	RAISE INFO '在庫締め処理終了';
	
EXCEPTION
	WHEN OTHERS THEN
		RAISE INFO 'SQLSTATE = %', SQLSTATE;
		RAISE INFO 'SQLERRM = %', SQLERRM;
		RETURN;
END;	
$$ LANGUAGE plpgsql;
ALTER PROCEDURE inv_monthly_stock_closing(inClosingOn IN DATE, inUserCode IN TEXT, inFunctionCode IN TEXT, inTerminal IN TEXT) OWNER to expa_apps;