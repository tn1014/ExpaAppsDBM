-- Table: num_order_slips

DROP TABLE IF EXISTS num_order_slips;

CREATE TABLE IF NOT EXISTS num_order_slips
(
	ordered_year_month TEXT NOT NULL
,	store_code TEXT NOT NULL
,	no INTEGER NOT NULL
);

ALTER TABLE IF EXISTS num_order_slips OWNER to expa_apps;

COMMENT ON TABLE num_order_slips
	IS '受注番号採番テーブル';
COMMENT ON COLUMN num_order_slips.ordered_year_month IS '受注年月';
COMMENT ON COLUMN num_order_slips.store_code IS '店舗コード';
COMMENT ON COLUMN num_order_slips.no IS '受注番号';
