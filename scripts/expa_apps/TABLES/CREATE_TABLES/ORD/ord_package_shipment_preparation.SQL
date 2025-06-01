-- Table: ord_package_shipment_preparations

DROP TABLE IF EXISTS ord_package_shipment_preparations;

CREATE TABLE IF NOT EXISTS ord_package_shipment_preparations
(
		id BIGSERIAL
	,	package_shipment_product_id BIGINT
	,	stock_transaction_temporary_id BIGINT
	,	is_directly_shipping BOOLEAN NOT NULL DEFAULT FALSE
	,	is_packed BOOLEAN NOT NULL DEFAULT FALSE
	,	is_picked BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipment_preparations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipment_preparations OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipment_preparations
	IS '送付先出荷製品準備テーブル';
COMMENT ON COLUMN ord_package_shipment_preparations.id IS '送付先出荷製品準備ID';
COMMENT ON COLUMN ord_package_shipment_preparations.package_shipment_product_id IS '送付先出荷製品ID';
COMMENT ON COLUMN ord_package_shipment_preparations.stock_transaction_temporary_id IS '在庫仮受払ID';
COMMENT ON COLUMN ord_package_shipment_preparations.is_directly_shipping IS 'メーカー直送フラグ';
COMMENT ON COLUMN ord_package_shipment_preparations.is_packed IS '梱包済フラグ';
COMMENT ON COLUMN ord_package_shipment_preparations.is_picked IS 'ピッキング済フラグ';
COMMENT ON COLUMN ord_package_shipment_preparations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipment_preparations.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipment_preparations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipment_preparations.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipment_preparations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipment_preparations.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipment_preparations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipment_preparations.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_shipment_preparations FOR EACH ROW EXECUTE FUNCTION set_updated_at();
