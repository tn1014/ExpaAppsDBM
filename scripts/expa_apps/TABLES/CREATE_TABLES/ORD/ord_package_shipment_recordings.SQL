-- Table: ord_package_shipment_recordings

DROP TABLE IF EXISTS ord_package_shipment_recordings;

CREATE TABLE IF NOT EXISTS ord_package_shipment_recordings
(
		id BIGSERIAL
	,	package_shipment_product_id BIGINT
	,	shipment_completed_on DATE
	,	sales_recording_on DATE
	,	is_sales_unrecording BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipment_recordings_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipment_recordings OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipment_recordings
	IS '送付先出荷製品売上報告テーブル';
COMMENT ON COLUMN ord_package_shipment_recordings.id IS '送付先出荷製品売上報告ID';
COMMENT ON COLUMN ord_package_shipment_recordings.package_shipment_product_id IS '送付先出荷製品ID';
COMMENT ON COLUMN ord_package_shipment_recordings.shipment_completed_on IS '出荷完了日';
COMMENT ON COLUMN ord_package_shipment_recordings.sales_recording_on IS '売上報告日';
COMMENT ON COLUMN ord_package_shipment_recordings.is_sales_unrecording IS '売上報告不要フラグ';
COMMENT ON COLUMN ord_package_shipment_recordings.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipment_recordings.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipment_recordings.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipment_recordings.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipment_recordings.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipment_recordings.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipment_recordings.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipment_recordings.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_shipment_recordings FOR EACH ROW EXECUTE FUNCTION set_updated_at();
