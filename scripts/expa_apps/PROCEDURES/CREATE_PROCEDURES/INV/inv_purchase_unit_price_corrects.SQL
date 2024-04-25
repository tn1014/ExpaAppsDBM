/* *******************************************
 * 在庫仕入単価訂正プロシージャ
 * *******************************************/
CREATE OR REPLACE PROCEDURE inv_purchase_unit_price_corrects(
	  inLocationCode IN TEXT
	, inProductCode IN TEXT
	, inInventorySeq IN INTEGER
	, inTradedAt IN TIMESTAMP(3) WITHOUT TIME ZONE
	, inTransactionUserCode IN TEXT
	, inTransactionQuantity IN NUMERIC
	, inPrevPurchaseUnitPrice IN NUMERIC
	, inNewPurchaseUnitPrice IN NUMERIC
	, inUserCode IN TEXT
	, inFunctionCode IN TEXT
	, inTerminal IN TEXT) AS $$ 
DECLARE
	stockQuantity		NUMERIC := NULL;
	transactionQuantity	NUMERIC := NULL;
	
	transactionId		BIGINT := 0;
	targetYm			TEXT := '';
	
BEGIN
	RAISE INFO '在庫仕入単価訂正処理開始';
	
	-- テーブルロック
	LOCK inv_stock_transactions IN EXCLUSIVE MODE NOWAIT;
	LOCK inv_stock_transaction_quantities IN EXCLUSIVE MODE NOWAIT;
	LOCK inv_stocks IN EXCLUSIVE MODE NOWAIT;
	LOCK inv_stock_quantities IN EXCLUSIVE MODE NOWAIT;
	
	-- 当年月を取得
	SELECT TO_CHAR(now(), 'YYYYMM') INTO targetYm;
	
	-- 修正前単価の現在庫数取得
	SELECT	stock_quantity INTO stockQuantity
	FROM	v_inv_stock_prices
	WHERE	location_code		=	inLocationCode
	AND		product_code		=	inProductCode
	AND		inventory_seq		=	inInventorySeq
	AND		purchase_unit_price	=	inPrevPurchaseUnitPrice
	;
	
	IF stockQuantity IS NOT NULL AND stockQuantity > 0 THEN
		-- 訂正数が現在庫数より少ない場合
		IF inTransactionQuantity <= stockQuantity THEN
			-- 訂正数をそのまま在庫受払テーブルに追加
			transactionQuantity := inTransactionQuantity;
		-- 訂正数が現在庫を超える場合
		ELSE
			-- 現在庫数分を在庫受け払いテーブルに追加
			transactionQuantity := stockQuantity;
		END IF;
		
		-- 在庫受払データ作成
		-- 元値から減算
		INSERT INTO inv_stock_transactions (
			location_code
		,	product_code
		,	inventory_seq
		,	traded_at
		,	inout_div
		,	transaction_div
		,	transaction_user_code
		,	is_corrected
		,	description
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		) VALUES (
			inLocationCode
		,	inProductCode
		,	inInventorySeq
		,	inTradedAt
		,	'OUT'
		,	''
		,	inTransactionUserCode
		,	TRUE
		,	'仕入単価訂正(元値)'
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		);
		
		-- 在庫受払ID(元値)の取得
		SELECT CURRVAL('inv_stock_transactions_id_seq') INTO transactionId;
		
		-- 明細データ作成(元値)
		INSERT INTO inv_stock_transaction_quantities (
			transaction_id
		,	purchase_unit_price
		,	transaction_quantity
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		) VALUES (
			transactionId
		,	inPrevPurchaseUnitPrice
		,	transactionQuantity
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		);
		
		
		-- 新値に加算
		INSERT INTO inv_stock_transactions (
			location_code
		,	product_code
		,	inventory_seq
		,	traded_at
		,	inout_div
		,	transaction_div
		,	transaction_user_code
		,	is_corrected
		,	description
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		) VALUES (
			inLocationCode
		,	inProductCode
		,	inInventorySeq
		,	inTradedAt
		,	'IN'
		,	''
		,	inTransactionUserCode
		,	TRUE
		,	'仕入単価訂正(新値)'
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		);
		
		-- 受払IDの取得(新値)
		SELECT CURRVAL('inv_stock_transactions_id_seq') INTO transactionId;
		
		-- 明細データ作成(新値)
		INSERT INTO inv_stock_transaction_quantities (
			transaction_id
		,	purchase_unit_price
		,	transaction_quantity
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		) VALUES (
			transactionId
		,	inNewPurchaseUnitPrice
		,	transactionQuantity
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		,	inUserCode
		,	inTerminal
		,	inFunctionCode
		);
	END IF;
	
	--終了
	RAISE INFO '在庫仕入単価訂正処理終了';
	
EXCEPTION
	WHEN OTHERS THEN
		RAISE INFO 'SQLSTATE = %', SQLSTATE;
		RAISE INFO 'SQLERRM = %', SQLERRM;
		RETURN;
END;	
$$ LANGUAGE plpgsql;
ALTER PROCEDURE inv_purchase_unit_price_corrects(
	  inLocationCode IN TEXT
	, inProductCode IN TEXT
	, inInventorySeq IN INTEGER
	, inTradedAt IN TIMESTAMP(3) WITHOUT TIME ZONE
	, inTransactionUserCode IN TEXT
	, inTransactionQuantity IN NUMERIC
	, inPrevPurchaseUnitPrice IN NUMERIC
	, inNewPurchaseUnitPrice IN NUMERIC
	, inUserCode IN TEXT
	, inFunctionCode IN TEXT
	, inTerminal IN TEXT
) OWNER to expa_apps;