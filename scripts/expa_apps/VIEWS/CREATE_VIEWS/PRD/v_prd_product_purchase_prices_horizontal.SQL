-- VIEW: v_prd_product_purchase_prices_horizontal;

DROP VIEW IF EXISTS v_prd_product_purchase_prices_horizontal;

CREATE VIEW 	v_prd_product_purchase_prices_horizontal AS 
SELECT		*
FROM		get_product_purchase_price_horizontal_table(CURRENT_DATE)
ORDER BY		product_code;

ALTER VIEW IF EXISTS v_prd_product_purchase_prices_horizontal OWNER to expa_apps;

COMMENT ON VIEW v_prd_product_purchase_prices_horizontal
	IS '【VIEW】製品仕入単価マスタ(横持ち)';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.product_code IS '製品コード';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.start_on IS '適用日';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.id IS '仕入単価ID';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_seq01 IS '仕入ロットシークエンス1';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_quantity01 IS '仕入ロット数1';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.kiracs_purchase_unit_price01 IS 'キラックス仕入単価1';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.expa_purchase_unit_price01 IS 'エクスパッケージ仕入単価1';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_seq02 IS '仕入ロットシークエンス2';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_quantity02 IS '仕入ロット数2';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.kiracs_purchase_unit_price02 IS 'キラックス仕入単価2';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.expa_purchase_unit_price02 IS 'エクスパッケージ仕入単価2';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_seq03 IS '仕入ロットシークエンス3';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_quantity03 IS '仕入ロット数3';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.kiracs_purchase_unit_price03 IS 'キラックス仕入単価3';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.expa_purchase_unit_price03 IS 'エクスパッケージ仕入単価3';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_seq04 IS '仕入ロットシークエンス4';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.lot_quantity04 IS '仕入ロット数4';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.kiracs_purchase_unit_price04 IS 'キラックス仕入単価4';
COMMENT ON COLUMN v_prd_product_purchase_prices_horizontal.expa_purchase_unit_price04 IS 'エクスパッケージ仕入単価4';