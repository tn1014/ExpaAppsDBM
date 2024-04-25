-- VIEW: v_inv_stock_prices;

DROP VIEW IF EXISTS v_inv_stock_prices;

CREATE VIEW	v_inv_stock_prices AS 
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
				ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.transaction_id
				WHERE		inv_stock_transactions.inout_div	=	'IN'
				UNION ALL
				SELECT		inv_stock_transactions.location_code
				,			inv_stock_transactions.product_code
				,			inv_stock_transactions.inventory_seq
				,			inv_stock_transaction_quantities.purchase_unit_price
				,			(-1 * inv_stock_transaction_quantities.transaction_quantity)
				FROM		inv_stock_transactions
				INNER JOIN	inv_stock_transaction_quantities
				ON			inv_stock_transactions.id		=	inv_stock_transaction_quantities.transaction_id
				WHERE		inv_stock_transactions.inout_div	=	'OUT'
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
ALTER VIEW IF EXISTS v_inv_stock_prices OWNER to expa_apps;

COMMENT ON VIEW v_inv_stock_prices
	IS '【VIEW】仕入単価別現在庫テーブル';
COMMENT ON COLUMN v_inv_stock_prices.location_code IS '在庫場所コード';
COMMENT ON COLUMN v_inv_stock_prices.product_code IS '製品コード';
COMMENT ON COLUMN v_inv_stock_prices.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN v_inv_stock_prices.purchase_unit_price IS '仕入単価';
COMMENT ON COLUMN v_inv_stock_prices.stock_quantity IS '現在庫';