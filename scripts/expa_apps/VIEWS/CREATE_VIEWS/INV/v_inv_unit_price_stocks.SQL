-- VIEW: v_inv_unit_price_stocks;

DROP VIEW IF EXISTS v_inv_unit_price_stocks;

CREATE VIEW	v_inv_unit_price_stocks AS 
SELECT		inv_stocks.location_code
,			inv_stocks.product_code
,			inv_stocks.inventory_seq
,			inv_stocks.purchase_unit_price
,			SUM(inv_stocks.stock_quantity)		AS	stock_quantity
FROM		(
				SELECT		inv_stocks.location_code
				,			inv_stocks.product_code
				,			inv_stocks.inventory_seq
				,			inv_stock_quantities.purchase_unit_price
				,			inv_stock_quantities.stock_quantity
				FROM		inv_stocks
				INNER JOIN	inv_stock_quantities
				ON			inv_stocks.id			=	inv_stock_quantities.stock_id
				UNION ALL
				SELECT		inv_stock_transactions.location_code
				,			inv_stock_transactions.product_code
				,			inv_stock_transactions.inventory_seq
				,			inv_stock_transaction_quantities.purchase_unit_price
				,			inv_stock_transaction_quantities.transaction_quantity
				FROM		inv_stock_transactions
				INNER JOIN	inv_stock_transaction_quantities
				ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.stock_transaction_id
				WHERE		inv_stock_transactions.inout_div	=	'IN'
				AND			inv_stock_transactions.closing_on	IS 	NULL
				UNION ALL
				SELECT		inv_stock_transactions.location_code
				,			inv_stock_transactions.product_code
				,			inv_stock_transactions.inventory_seq
				,			inv_stock_transaction_quantities.purchase_unit_price
				,			(-1 * inv_stock_transaction_quantities.transaction_quantity)
				FROM		inv_stock_transactions
				INNER JOIN	inv_stock_transaction_quantities
				ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.stock_transaction_id
				WHERE		inv_stock_transactions.inout_div	=	'OUT'
				AND			inv_stock_transactions.closing_on	IS 	NULL
			)	inv_stocks
GROUP BY		inv_stocks.location_code
,			inv_stocks.product_code
,			inv_stocks.inventory_seq
,			inv_stocks.purchase_unit_price
HAVING		SUM(inv_stocks.stock_quantity)		!= 0
ORDER BY		inv_stocks.location_code
,			inv_stocks.product_code
,			inv_stocks.inventory_seq
,			inv_stocks.purchase_unit_price
;
ALTER VIEW IF EXISTS v_inv_unit_price_stocks OWNER to expa_apps;

COMMENT ON VIEW v_inv_unit_price_stocks
	IS '【VIEW】単価別現在庫テーブル';
COMMENT ON COLUMN v_inv_unit_price_stocks.location_code IS '在庫場所コード';
COMMENT ON COLUMN v_inv_unit_price_stocks.product_code IS '製品コード';
COMMENT ON COLUMN v_inv_unit_price_stocks.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN v_inv_unit_price_stocks.purchase_unit_price IS '仕入単価';
COMMENT ON COLUMN v_inv_unit_price_stocks.stock_quantity IS '現在庫';