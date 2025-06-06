-- Table: pur_direct_order_supplier_delivery_destinations

DROP TABLE IF EXISTS pur_direct_order_supplier_delivery_destinations;

CREATE TABLE IF NOT EXISTS pur_direct_order_supplier_delivery_destinations
(
		id BIGSERIAL
	,	delivery_destination_code TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	first_used_on DATE
	,	latest_used_on DATE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_direct_order_supplier_delivery_destinations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_direct_order_supplier_delivery_destinations OWNER to expa_apps;

COMMENT ON TABLE pur_direct_order_supplier_delivery_destinations
	IS '仕入先別メーカー直送納品先テーブル';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.id IS '仕入先別メーカー直送納品先ID';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.delivery_destination_code IS 'メーカー直送納品先コード';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.first_used_on IS '初回使用日';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.latest_used_on IS '最新使用日';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.created_at IS '作成日時';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_direct_order_supplier_delivery_destinations.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_direct_order_supplier_delivery_destinations FOR EACH ROW EXECUTE FUNCTION set_updated_at();