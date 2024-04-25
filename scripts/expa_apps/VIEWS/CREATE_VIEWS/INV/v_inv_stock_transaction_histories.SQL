-- VIEW: v_inv_stock_transaction_histories;

DROP VIEW IF EXISTS v_inv_stock_transaction_histories;

CREATE VIEW	v_inv_stock_transaction_histories AS 
SELECT		inv_stock_transaction_histories.id
,			inv_stock_transaction_histories.location_code
,			inv_stock_transaction_histories.product_code
,			inv_stock_transaction_histories.inventory_seq
,			inv_stock_transaction_histories.traded_at
,			inv_stock_transaction_histories.inout_div
,			inv_stock_transaction_histories.transaction_div
,			inv_stock_transaction_histories.transaction_user_code
,			inv_stock_transaction_histories.is_corrected
,			inv_stock_transaction_histories.description
,			inv_stock_transaction_histories.prev_stock_quantity
,			CASE inv_stock_transaction_histories.inout_div
				WHEN 'IN' 
					THEN inv_stock_transaction_quantity_histories.transaction_quantity
				WHEN 'OUT'
					THEN -1 * inv_stock_transaction_quantity_histories.transaction_quantity
				ELSE 0
			END					AS	transaction_quantity
,			CASE inv_stock_transaction_histories.inout_div
				WHEN 'IN'
					THEN inv_stock_transaction_histories.prev_stock_quantity + inv_stock_transaction_quantity_histories.transaction_quantity
				WHEN 'OUT'
					THEN inv_stock_transaction_histories.prev_stock_quantity - inv_stock_transaction_quantity_histories.transaction_quantity
				ELSE inv_stock_transaction_histories.prev_stock_quantity
			END					AS	after_stock_quantity
,			CASE inv_stock_transaction_histories.inout_div
				WHEN 'IN' 
					THEN inv_stock_transaction_quantity_histories.purchase_price
				WHEN 'OUT'
					THEN -1 * inv_stock_transaction_quantity_histories.purchase_price
				ELSE 0
			END					AS	transaction_purchase_price
FROM		inv_stock_transaction_histories
INNER JOIN	(
				SELECT		transaction_history_id
				,			SUM(transaction_quantity)	AS	transaction_quantity
				,			SUM(transaction_quantity * purchase_unit_price)	AS	purchase_price
				FROM		inv_stock_transaction_quantity_histories
				GROUP BY		transaction_history_id
			)	inv_stock_transaction_quantity_histories
ON			inv_stock_transaction_histories.id			=	inv_stock_transaction_quantity_histories.transaction_history_id
ORDER BY		inv_stock_transaction_histories.location_code
,			inv_stock_transaction_histories.product_code
,			inv_stock_transaction_histories.inventory_seq
,			inv_stock_transaction_histories.traded_at
;
ALTER VIEW IF EXISTS v_inv_stock_transaction_histories OWNER to expa_apps;

COMMENT ON VIEW v_inv_stock_transaction_histories
	IS '【VIEW】在庫更新履歴テーブル';
COMMENT ON COLUMN v_inv_stock_transaction_histories.id IS '在庫更新履歴ID';
COMMENT ON COLUMN v_inv_stock_transaction_histories.location_code IS '在庫場所コード';
COMMENT ON COLUMN v_inv_stock_transaction_histories.product_code IS '製品コード';
COMMENT ON COLUMN v_inv_stock_transaction_histories.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN v_inv_stock_transaction_histories.traded_at IS '受払日時';
COMMENT ON COLUMN v_inv_stock_transaction_histories.inout_div IS '入出庫区分';
COMMENT ON COLUMN v_inv_stock_transaction_histories.transaction_div IS '在庫受払区分';
COMMENT ON COLUMN v_inv_stock_transaction_histories.transaction_user_code IS '受払ユーザコード';
COMMENT ON COLUMN v_inv_stock_transaction_histories.is_corrected IS '訂正フラグ';
COMMENT ON COLUMN v_inv_stock_transaction_histories.description IS '備考';
COMMENT ON COLUMN v_inv_stock_transaction_histories.prev_stock_quantity IS '更新前在庫数';
COMMENT ON COLUMN v_inv_stock_transaction_histories.transaction_quantity IS '受払数';
COMMENT ON COLUMN v_inv_stock_transaction_histories.after_stock_quantity IS '更新後在庫数';
COMMENT ON COLUMN v_inv_stock_transaction_histories.transaction_purchase_price IS '受払在庫金額';