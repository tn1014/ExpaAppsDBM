-- Table: ord_package_shipment_timestamps

DROP TABLE IF EXISTS ord_package_shipments;

CREATE TABLE IF NOT EXISTS ord_package_shipment_timestamps
(
		package_shipment_id BIGINT
	,	approved_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	shipment_referenced_on DATE
	,	shipment_completed_on DATE
	,	sales_recording_on DATE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipment_timestamps_pkey PRIMARY KEY (package_shipment_id)
);

ALTER TABLE IF EXISTS ord_package_shipment_timestamps OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipment_timestamps
	IS '受注送付先出荷タイムスタンプテーブル';
COMMENT ON COLUMN ord_package_shipment_timestamps.package_shipment_id IS '受注送付先出荷ID';
COMMENT ON COLUMN ord_package_shipment_timestamps.approved_at IS '出荷承認日時';
COMMENT ON COLUMN ord_package_shipment_timestamps.shipment_referenced_on IS '出荷参考日';
COMMENT ON COLUMN ord_package_shipment_timestamps.shipment_completed_on IS '全商品出荷完了日';
COMMENT ON COLUMN ord_package_shipment_timestamps.sales_recording_on IS '売上計上日';
COMMENT ON COLUMN ord_package_shipment_timestamps.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipment_timestamps.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipment_timestamps.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipment_timestamps.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipment_timestamps.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipment_timestamps.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipment_timestamps.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipment_timestamps.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_shipment_timestamps FOR EACH ROW EXECUTE FUNCTION set_updated_at();