-- VIEW: v_inv_monthly_stocks;

DROP VIEW IF EXISTS v_inv_monthly_stocks;

CREATE VIEW	v_inv_monthly_stocks AS 
SELECT		inv_monthly_stocks.id
,			inv_monthly_stocks.target_on
,			inv_monthly_stocks.location_code
,			inv_monthly_stocks.product_code
,			inv_monthly_stocks.inventory_seq
,			inv_monthly_stock_quantities.stock_quantity
,			inv_monthly_stock_quantities.purchase_price
FROM		inv_monthly_stocks
INNER JOIN	(
				SELECT		monthly_stock_id
				,			SUM(stock_quantity * purchase_unit_price)	AS	purchase_price
				,			SUM(stock_quantity)					AS	stock_quantity
				FROM		inv_monthly_stock_quantities
				GROUP BY		monthly_stock_id
			)	inv_monthly_stock_quantities
ON			inv_monthly_stocks.id			=	inv_monthly_stock_quantities.monthly_stock_id
ORDER BY		inv_monthly_stocks.target_on
,			inv_monthly_stocks.location_code
,			inv_monthly_stocks.product_code
,			inv_monthly_stocks.inventory_seq
;
ALTER VIEW IF EXISTS v_inv_monthly_stocks OWNER to expa_apps;

COMMENT ON VIEW v_inv_monthly_stocks
	IS '【VIEW】月末在庫テーブル';
COMMENT ON COLUMN v_inv_monthly_stocks.id IS '月末在庫ID';
COMMENT ON COLUMN v_inv_monthly_stocks.target_on IS '対象年月日';
COMMENT ON COLUMN v_inv_monthly_stocks.location_code IS '在庫場所コード';
COMMENT ON COLUMN v_inv_monthly_stocks.product_code IS '製品コード';
COMMENT ON COLUMN v_inv_monthly_stocks.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN v_inv_monthly_stocks.stock_quantity IS '月末在庫数';
COMMENT ON COLUMN v_inv_monthly_stocks.purchase_price IS '月末在庫金額';