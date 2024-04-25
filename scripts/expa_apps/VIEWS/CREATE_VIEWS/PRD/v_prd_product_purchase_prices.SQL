-- VIEW: v_prd_product_purchase_prices;

DROP VIEW IF EXISTS v_prd_product_purchase_prices;

CREATE VIEW 	v_prd_product_purchase_prices AS 
SELECT		*
FROM		get_product_purchase_price_table(CURRENT_DATE)
ORDER BY		product_code;

ALTER VIEW IF EXISTS v_prd_product_purchase_prices OWNER to expa_apps;

COMMENT ON VIEW v_prd_product_purchase_prices
	IS '【VIEW】製品仕入単価マスタ';
COMMENT ON COLUMN v_prd_product_purchase_prices.product_code IS '製品コード';
COMMENT ON COLUMN v_prd_product_purchase_prices.start_on IS '適用日';
COMMENT ON COLUMN v_prd_product_purchase_prices.id IS '仕入単価ID';
COMMENT ON COLUMN v_prd_product_purchase_prices.lot_seq IS '仕入ロットシークエンス';
COMMENT ON COLUMN v_prd_product_purchase_prices.lot_quantity IS '仕入ロット数';
COMMENT ON COLUMN v_prd_product_purchase_prices.kiracs_purchase_unit_price IS 'キラックス仕入単価';
COMMENT ON COLUMN v_prd_product_purchase_prices.expa_purchase_unit_price IS 'エクスパッケージ仕入単価';
COMMENT ON COLUMN v_prd_product_purchase_prices.recommend_unit_price IS '上代単価';