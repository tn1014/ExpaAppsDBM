-- Table: mng_postage_prefectures

DROP TABLE IF EXISTS mng_postage_prefectures;

CREATE TABLE IF NOT EXISTS mng_postage_prefectures
(
		id BIGSERIAL
	,	postage_delivery_id BIGINT NOT NULL
	,	postage_store_id BIGINT NOT NULL
	,	pref_code TEXT NOT NULL
	,	postage_price NUMERIC NOT NULL DEFAULT 0
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
	,	CONSTRAINT mng_postage_prefectures_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_postage_prefectures OWNER to expa_apps;

COMMENT ON TABLE mng_postage_prefectures
	IS '都道府県別送料マスタ';
COMMENT ON COLUMN mng_postage_prefectures.id IS '都道府県別送料ID';
COMMENT ON COLUMN mng_postage_prefectures.postage_delivery_id IS '配送方法別送料ID';
COMMENT ON COLUMN mng_postage_prefectures.postage_store_id IS '店舗別送料ID';
COMMENT ON COLUMN mng_postage_prefectures.pref_code IS '都道府県コード';
COMMENT ON COLUMN mng_postage_prefectures.postage_price IS '送料';
COMMENT ON COLUMN mng_postage_prefectures.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_postage_prefectures.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_postage_prefectures.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_postage_prefectures.created_at IS '作成日時';
COMMENT ON COLUMN mng_postage_prefectures.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_postage_prefectures.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_postage_prefectures.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_postage_prefectures.updated_at IS '更新日時';
COMMENT ON COLUMN mng_postage_prefectures.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_postage_prefectures.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_postage_prefectures.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_postage_prefectures.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_postage_prefectures.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_postage_prefectures.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_postage_prefectures FOR EACH ROW EXECUTE FUNCTION set_updated_at();