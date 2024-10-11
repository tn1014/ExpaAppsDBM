-- Table: mng_delivery_methods

DROP TABLE IF EXISTS mng_delivery_methods;

CREATE TABLE IF NOT EXISTS mng_delivery_methods
(
		id BIGSERIAL
	,	deliv_company_code TEXT NOT NULL
	,	delivery_method_code TEXT NOT NULL
	,	delivery_method TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	delivery_service_div TEXT NOT NULL
	,	honten_relation_code TEXT NOT NULL
	,	rakuten_relation_code TEXT NOT NULL
	,	yahoo_relation_code TEXT NOT NULL
	,	deliv_company_relation_code TEXT NOT NULL
	,	rank INT
	,	is_enabled BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT mng_delivery_methods_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_delivery_methods OWNER to expa_apps;

COMMENT ON TABLE mng_delivery_methods
	IS '配送方法マスタ';
COMMENT ON COLUMN mng_delivery_methods.id IS '配送方法ID';
COMMENT ON COLUMN mng_delivery_methods.deliv_company_code IS '配送業者コード';
COMMENT ON COLUMN mng_delivery_methods.delivery_method_code IS '配送方法';
COMMENT ON COLUMN mng_delivery_methods.delivery_method IS '配送方法';
COMMENT ON COLUMN mng_delivery_methods.short_name IS '略称';
COMMENT ON COLUMN mng_delivery_methods.delivery_service_div IS '配送便区分';
COMMENT ON COLUMN mng_delivery_methods.honten_relation_code IS '本店連携コード';
COMMENT ON COLUMN mng_delivery_methods.rakuten_relation_code IS '楽天市場連携コード';
COMMENT ON COLUMN mng_delivery_methods.yahoo_relation_code IS 'Yahoo!ショッピング連携コード';
COMMENT ON COLUMN mng_delivery_methods.deliv_company_relation_code IS '配送業者連携コード';
COMMENT ON COLUMN mng_delivery_methods.rank IS '表示順';
COMMENT ON COLUMN mng_delivery_methods.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mng_delivery_methods.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_delivery_methods.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_delivery_methods.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_delivery_methods.created_at IS '作成日時';
COMMENT ON COLUMN mng_delivery_methods.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_delivery_methods.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_delivery_methods.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_delivery_methods.updated_at IS '更新日時';
COMMENT ON COLUMN mng_delivery_methods.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_delivery_methods.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_delivery_methods.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_delivery_methods.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_delivery_methods.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_delivery_methods.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_delivery_methods FOR EACH ROW EXECUTE FUNCTION set_updated_at();