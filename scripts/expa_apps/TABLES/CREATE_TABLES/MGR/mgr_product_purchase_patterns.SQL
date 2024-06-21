-- Table: mgr_product_purchase_patterns;

DROP TABLE IF EXISTS mgr_product_purchase_patterns;

CREATE TABLE IF NOT EXISTS mgr_product_purchase_patterns
(
		product_id			INTEGER
	,	suppliers_id		INTEGER
	,	CONSTRAINT mgr_product_purchase_patterns_pkey PRIMARY KEY (product_id)
);

ALTER TABLE IF EXISTS mgr_product_purchase_patterns OWNER to expa_apps;

COMMENT ON TABLE mgr_product_purchase_patterns
	IS '【データ移行用】商品別発注パターンデータ';
COMMENT ON COLUMN mgr_product_purchase_patterns.product_id IS '商品ID';
COMMENT ON COLUMN mgr_product_purchase_patterns.suppliers_id IS '仕入先ID';