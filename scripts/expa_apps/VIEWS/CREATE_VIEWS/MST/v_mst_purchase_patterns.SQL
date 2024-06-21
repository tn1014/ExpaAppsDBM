-- VIEW: v_mst_purchase_patterns;

DROP VIEW IF EXISTS v_mst_purchase_patterns;

CREATE VIEW 	v_mst_purchase_patterns AS 
SELECT		*
FROM		get_purchase_pattern_table(CURRENT_DATE)
ORDER BY		purchase_pattern_id;

ALTER VIEW IF EXISTS v_mst_purchase_patterns OWNER to expa_apps;

COMMENT ON VIEW v_mst_purchase_patterns
	IS '【VIEW】発注パターンマスタ';
COMMENT ON COLUMN v_mst_purchase_patterns.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN v_mst_purchase_patterns.start_on IS '適用日';
COMMENT ON COLUMN v_mst_purchase_patterns.purchase_pattern_name IS '発注パターン名';
COMMENT ON COLUMN v_mst_purchase_patterns.purchase_method_div IS '発注方法区分';
COMMENT ON COLUMN v_mst_purchase_patterns.last_arrival_location_code IS '最終納品先コード';
COMMENT ON COLUMN v_mst_purchase_patterns.is_enabled IS '有効無効フラグ';
COMMENT ON COLUMN v_mst_purchase_patterns.rank IS '表示順';
COMMENT ON COLUMN v_mst_purchase_patterns.stock_location_code IS '在庫場所コード';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_location_code01 IS '経由場所コード1';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_location_code02 IS '経由場所コード2';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_location_code03 IS '経由場所コード3';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_location_code04 IS '経由場所コード4';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_location_code05 IS '経由場所コード5';
COMMENT ON COLUMN v_mst_purchase_patterns.deliv_weekdays IS '納品曜日';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_lead_time IS '横持ちリードタイム';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_description01 IS '横持ち備考1';
COMMENT ON COLUMN v_mst_purchase_patterns.carry_description02 IS '横持ち備考2';