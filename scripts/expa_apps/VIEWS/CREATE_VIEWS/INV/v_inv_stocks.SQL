-- VIEW: v_inv_stocks;

DROP VIEW IF EXISTS v_inv_stocks;

CREATE VIEW	v_inv_stocks AS 
SELECT		inv_stocks.location_code
,			inv_stocks.product_code
,			inv_stocks.inventory_seq
,			SUM(inv_stocks.stock_quantity)		AS	stock_quantity
,			SUM(inv_stocks.purchase_unit_price)	AS	purchase_price
FROM		(
				SELECT		inv_stocks.location_code
				,			inv_stocks.product_code
				,			inv_stocks.inventory_seq
				,			inv_stock_quantities.stock_quantity
				,			inv_stock_quantities.purchase_unit_price
				FROM		inv_stocks
				INNER JOIN	(
								SELECT		stock_id
								,			SUM(stock_quantity * purchase_unit_price)	AS	purchase_unit_price
								,			SUM(stock_quantity)	AS	stock_quantity
								FROM		inv_stock_quantities
								GROUP BY		stock_id
							)	inv_stock_quantities
				ON			inv_stocks.id			=	inv_stock_quantities.stock_id
				UNION ALL
				SELECT		inv_stock_transactions.location_code
				,			inv_stock_transactions.product_code
				,			inv_stock_transactions.inventory_seq
				,			inv_stock_transaction_quantities.transaction_quantity
				,			inv_stock_transaction_quantities.purchase_unit_price
				FROM		inv_stock_transactions
				INNER JOIN	(
								SELECT		transaction_id
								,			SUM(transaction_quantity * purchase_unit_price)	AS	purchase_unit_price
								,			SUM(transaction_quantity)					AS	transaction_quantity
								FROM		inv_stock_transaction_quantities
								GROUP BY		transaction_id
							) inv_stock_transaction_quantities
				ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.transaction_id
				WHERE		inv_stock_transactions.inout_div	=	'IN'
				UNION ALL
				SELECT		inv_stock_transactions.location_code
				,			inv_stock_transactions.product_code
				,			inv_stock_transactions.inventory_seq
				,			(-1 * inv_stock_transaction_quantities.transaction_quantity)
				,			(-1 * inv_stock_transaction_quantities.purchase_unit_price)
				FROM		inv_stock_transactions
				INNER JOIN	(
								SELECT		transaction_id
								,			SUM(transaction_quantity * purchase_unit_price)	AS	purchase_unit_price
								,			SUM(transaction_quantity)					AS	transaction_quantity
								FROM		inv_stock_transaction_quantities
								GROUP BY		transaction_id
							) inv_stock_transaction_quantities
				ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.transaction_id
				WHERE		inv_stock_transactions.inout_div	=	'OUT'
			)	inv_stocks
GROUP BY		inv_stocks.location_code
,			inv_stocks.product_code
,			inv_stocks.inventory_seq
ORDER BY		inv_stocks.location_code
,			inv_stocks.product_code
,			inv_stocks.inventory_seq
;
ALTER VIEW IF EXISTS v_inv_stocks OWNER to expa_apps;

COMMENT ON VIEW v_inv_stocks
	IS '【VIEW】現在庫テーブル';
COMMENT ON COLUMN v_inv_stocks.location_code IS '在庫場所コード';
COMMENT ON COLUMN v_inv_stocks.product_code IS '製品コード';
COMMENT ON COLUMN v_inv_stocks.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN v_inv_stocks.stock_quantity IS '現在庫';
COMMENT ON COLUMN v_inv_stocks.purchase_price IS '現在庫金額';