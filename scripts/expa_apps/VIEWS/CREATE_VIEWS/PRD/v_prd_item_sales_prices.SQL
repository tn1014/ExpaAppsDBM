-- VIEW: v_prd_item_sales_prices;

DROP VIEW IF EXISTS v_prd_item_sales_prices;

CREATE VIEW v_prd_item_sales_prices AS 
SELECT		*
FROM		get_item_sales_price_table(CURRENT_DATE)
ORDER BY		item_code;

ALTER VIEW IF EXISTS v_prd_item_sales_prices OWNER to expa_apps;

COMMENT ON VIEW v_prd_item_sales_prices
	IS '【VIEW】商品販売単価マスタ';
COMMENT ON COLUMN v_prd_item_sales_prices.item_code IS '商品コード';
COMMENT ON COLUMN v_prd_item_sales_prices.start_on IS '適用日';
COMMENT ON COLUMN v_prd_item_sales_prices.tax_div IS '消費税区分';
COMMENT ON COLUMN v_prd_item_sales_prices.tax_rate IS '消費税率';
COMMENT ON COLUMN v_prd_item_sales_prices.included_tax_div IS '内税外税区分';
COMMENT ON COLUMN v_prd_item_sales_prices.min_sales_price IS '最安販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.max_sales_price IS '最高販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.min_sales_price_intax IS '最安税込販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.max_sales_price_intax IS '最高税込販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.honten_sales_price IS '本店販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.honten_sales_price_intax IS '本店税込販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.rakuten_sales_price IS '楽天市場販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.rakuten_sales_price_intax IS '楽天市場税込販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.yahoo_sales_price IS 'Yahoo!ショッピング販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.yahoo_sales_price_intax IS 'Yahoo!ショッピング税込販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.fax_sales_price IS 'FAX販売単価';
COMMENT ON COLUMN v_prd_item_sales_prices.fax_sales_price_intax IS 'FAX税込販売単価';