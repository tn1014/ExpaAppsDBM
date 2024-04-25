-- Table: num_product_codes

DROP TABLE IF EXISTS num_product_codes;

CREATE TABLE IF NOT EXISTS num_product_codes
(
		no BIGINT NOT NULL
);

ALTER TABLE IF EXISTS num_product_codes OWNER to expa_apps;

COMMENT ON TABLE num_product_codes
	IS '製品コード採番テーブル';
COMMENT ON COLUMN num_product_codes.no IS '製品番号';