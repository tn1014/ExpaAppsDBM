-- Table: mng_postage_deliveries

DROP TABLE IF EXISTS mng_postage_deliveries;

CREATE TABLE IF NOT EXISTS mng_postage_deliveries
(
		id BIGSERIAL
	,	delivery_method_code TEXT NOT NULL
	,	postage_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	is_deleted BOOLEAN NOT NULL DEFAULT FALSE
	,	deleted_user_code TEXT
	,	deleted_terminal TEXT
	,	deleted_function_code TEXT
	,	deleted_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	deleted_description TEXT
	,	CONSTRAINT mng_postage_deliveries_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_postage_deliveries OWNER to expa_apps;

COMMENT ON TABLE mng_postage_deliveries
	IS '配送方法別送料マスタ';
COMMENT ON COLUMN mng_postage_deliveries.id IS '配送方法別送料ID';
COMMENT ON COLUMN mng_postage_deliveries.delivery_method_code IS '配送方法コード';
COMMENT ON COLUMN mng_postage_deliveries.postage_tax_rate IS '送料消費税率';
COMMENT ON COLUMN mng_postage_deliveries.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_postage_deliveries.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_postage_deliveries.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_postage_deliveries.created_at IS '作成日時';
COMMENT ON COLUMN mng_postage_deliveries.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_postage_deliveries.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_postage_deliveries.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_postage_deliveries.updated_at IS '更新日時';
COMMENT ON COLUMN mng_postage_deliveries.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_postage_deliveries.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_postage_deliveries.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_postage_deliveries.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_postage_deliveries.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_postage_deliveries.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_postage_deliveries FOR EACH ROW EXECUTE FUNCTION set_updated_at();