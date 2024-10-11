-- Table: mng_postage_stores

DROP TABLE IF EXISTS mng_postage_stores;

CREATE TABLE IF NOT EXISTS mng_postage_stores
(
		id BIGSERIAL
	,	postage_delivery_id BIGINT
	,	store_code TEXT NOT NULL
	,	package_minimum_price NUMERIC NOT NULL DEFAULT 0
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
	,	CONSTRAINT mng_postage_stores_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_postage_stores OWNER to expa_apps;

COMMENT ON TABLE mng_postage_stores
	IS '店舗別送料マスタ';
COMMENT ON COLUMN mng_postage_stores.id IS '店舗別送料ID';
COMMENT ON COLUMN mng_postage_stores.postage_delivery_id IS '配送方法別送料ID';
COMMENT ON COLUMN mng_postage_stores.store_code IS '店舗コード';
COMMENT ON COLUMN mng_postage_stores.package_minimum_price IS '送付先別最低購入金額';
COMMENT ON COLUMN mng_postage_stores.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_postage_stores.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_postage_stores.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_postage_stores.created_at IS '作成日時';
COMMENT ON COLUMN mng_postage_stores.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_postage_stores.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_postage_stores.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_postage_stores.updated_at IS '更新日時';
COMMENT ON COLUMN mng_postage_stores.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_postage_stores.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_postage_stores.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_postage_stores.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_postage_stores.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_postage_stores.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_postage_stores FOR EACH ROW EXECUTE FUNCTION set_updated_at();