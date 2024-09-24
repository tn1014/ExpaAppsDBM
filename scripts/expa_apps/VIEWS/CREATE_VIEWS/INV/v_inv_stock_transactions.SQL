-- VIEW: v_inv_stock_transactions;

DROP VIEW IF EXISTS v_inv_stock_transactions;

CREATE VIEW	v_inv_stock_transactions AS 
SELECT		inv_stock_transactions.id
,			inv_stock_transactions.location_code
,			inv_stock_transactions.product_code
,			inv_stock_transactions.inventory_seq
,			inv_stock_transactions.traded_at
,			inv_stock_transactions.inout_div
,			inv_stock_transactions.transaction_div
,			inv_stock_transactions.transaction_employee_code
,			inv_stock_transactions.is_corrected
,			inv_stock_transactions.description
,			CASE inv_stock_transactions.inout_div
				WHEN 'IN' 
					THEN inv_stock_transaction_quantities.transaction_quantity
				WHEN 'OUT'
					THEN -1 * inv_stock_transaction_quantities.transaction_quantity
				ELSE 0
			END					AS	transaction_quantity
,			CASE inv_stock_transactions.inout_div
				WHEN 'IN' 
					THEN inv_stock_transaction_quantities.purchase_unit_price
				WHEN 'OUT'
					THEN -1 * inv_stock_transaction_quantities.purchase_unit_price
				ELSE 0
			END					AS	transaction_purchase_price
,			inv_stock_transactions.closing_on
FROM		inv_stock_transactions
INNER JOIN	(
				SELECT		stock_transaction_id
				,			SUM(transaction_quantity)	AS	transaction_quantity
				,			SUM(purchase_unit_price * transaction_quantity)	AS	purchase_unit_price
				FROM		inv_stock_transaction_quantities
				GROUP BY		stock_transaction_id
			)	inv_stock_transaction_quantities
ON			inv_stock_transactions.id			=	inv_stock_transaction_quantities.stock_transaction_id
ORDER BY		inv_stock_transactions.location_code
,			inv_stock_transactions.product_code
,			inv_stock_transactions.inventory_seq
,			inv_stock_transactions.traded_at
;
ALTER VIEW IF EXISTS v_inv_stock_transactions OWNER to expa_apps;

COMMENT ON VIEW v_inv_stock_transactions
	IS '【VIEW】在庫受払テーブル';
COMMENT ON COLUMN v_inv_stock_transactions.id IS '在庫受払ID';
COMMENT ON COLUMN v_inv_stock_transactions.location_code IS '在庫場所コード';
COMMENT ON COLUMN v_inv_stock_transactions.product_code IS '製品コード';
COMMENT ON COLUMN v_inv_stock_transactions.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN v_inv_stock_transactions.traded_at IS '受払日時';
COMMENT ON COLUMN v_inv_stock_transactions.inout_div IS '入出庫区分';
COMMENT ON COLUMN v_inv_stock_transactions.transaction_div IS '在庫受払区分';
COMMENT ON COLUMN v_inv_stock_transactions.transaction_employee_code IS '受払社員コード';
COMMENT ON COLUMN v_inv_stock_transactions.is_corrected IS '訂正フラグ';
COMMENT ON COLUMN v_inv_stock_transactions.description IS '備考';
COMMENT ON COLUMN v_inv_stock_transactions.transaction_quantity IS '受払数';
COMMENT ON COLUMN v_inv_stock_transactions.transaction_purchase_price IS '受払在庫金額';
COMMENT ON COLUMN v_inv_stock_transactions.closing_on IS '在庫締日';