-- Table: mng_delivery_special_prefectures;

DROP TABLE IF EXISTS mng_delivery_special_prefectures;

CREATE TABLE IF NOT EXISTS mng_delivery_special_prefectures
(
		pref_code TEXT NOT NULL
	,	delivery_method_code TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT mng_delivery_special_prefectures_pkey PRIMARY KEY (pref_code)
);

ALTER TABLE IF EXISTS mng_delivery_special_prefectures OWNER to expa_apps;

COMMENT ON TABLE mng_delivery_special_prefectures
	IS '配達特別地域都道府県マスタ';
COMMENT ON COLUMN mng_delivery_special_prefectures.pref_code IS '特別地域都道府県コード';
COMMENT ON COLUMN mng_delivery_special_prefectures.delivery_method_code IS '配送方法コード';
COMMENT ON COLUMN mng_delivery_special_prefectures.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_delivery_special_prefectures.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_delivery_special_prefectures.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_delivery_special_prefectures.created_at IS '作成日時';
COMMENT ON COLUMN mng_delivery_special_prefectures.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_delivery_special_prefectures.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_delivery_special_prefectures.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_delivery_special_prefectures.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_delivery_special_prefectures FOR EACH ROW EXECUTE FUNCTION set_updated_at();