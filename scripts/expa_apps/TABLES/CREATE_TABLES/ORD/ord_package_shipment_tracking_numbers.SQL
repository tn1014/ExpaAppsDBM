-- Table: ord_package_shipment_tracking_numbers

DROP TABLE IF EXISTS ord_package_shipment_tracking_numbers;

CREATE TABLE IF NOT EXISTS ord_package_shipment_tracking_numbers
(
		id BIGSERIAL
	,	package_shipment_id BIGINT
	,	delivery_company_code TEXT NOT NULL
	,	delivery_company_name TEXT NOT NULL
	,	tracking_number TEXT NOT NULL
	,	is_directly_shipping BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipment_tracking_numbers_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipment_tracking_numbers OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipment_tracking_numbers
	IS '送付先出荷追跡番号テーブル';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.id IS '送付先出荷追跡番号ID';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.package_shipment_id IS '送付先出荷ID';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.delivery_company_code IS '配送業者コード';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.delivery_company_name IS '配送業者名';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.tracking_number IS '追跡番号';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.is_directly_shipping IS '直送フラグ';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipment_tracking_numbers.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_shipment_tracking_numbers FOR EACH ROW EXECUTE FUNCTION set_updated_at();
