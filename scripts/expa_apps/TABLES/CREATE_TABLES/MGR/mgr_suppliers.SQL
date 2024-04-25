-- Table: mgr_suppliers;

DROP TABLE IF EXISTS mgr_suppliers;

CREATE TABLE IF NOT EXISTS mgr_suppliers
(
		maker_id BIGINT
	,	supplier_name TEXT
	,	short_name TEXT
	,	supplier_code TEXT
	,	exp_supply_flg SMALLINT
	,	receive_date_type SMALLINT
	,	large_size_confirm_flg SMALLINT
	,	option_type TEXT
	,	rank INT
	,	CONSTRAINT mgr_suppliers_pkey PRIMARY KEY (maker_id)
);

ALTER TABLE IF EXISTS mgr_suppliers OWNER to expa_apps;

COMMENT ON TABLE mgr_suppliers
	IS '【データ移行用】旧仕入先マスタ';
COMMENT ON COLUMN mgr_suppliers.maker_id IS 'メーカーID';
COMMENT ON COLUMN mgr_suppliers.supplier_name IS '仕入先名';
COMMENT ON COLUMN mgr_suppliers.short_name IS '略称名';
COMMENT ON COLUMN mgr_suppliers.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mgr_suppliers.exp_supply_flg IS 'エクスパッケージ直契約フラグ';
COMMENT ON COLUMN mgr_suppliers.receive_date_type IS '入荷日';
COMMENT ON COLUMN mgr_suppliers.large_size_confirm_flg IS '大型商品確認不要フラグ';
COMMENT ON COLUMN mgr_suppliers.option_type IS '新規顧客伝票発行区分';
COMMENT ON COLUMN mgr_suppliers.rank IS '表示順';