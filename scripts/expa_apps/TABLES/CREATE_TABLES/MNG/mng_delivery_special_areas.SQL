-- Table: mng_delivery_special_areas;

DROP TABLE IF EXISTS mng_delivery_special_areas;

CREATE TABLE IF NOT EXISTS mng_delivery_special_areas
(
		id BIGSERIAL
	,	pref_code TEXT NOT NULL
	,	zip_code TEXT NOT NULL
	,	delivery_method_code TEXT NOT NULL
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
	,	CONSTRAINT mng_delivery_special_areas_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_delivery_special_areas OWNER to expa_apps;

COMMENT ON TABLE mng_delivery_special_areas
	IS '通期配達特別地域・離島マスタ';
COMMENT ON COLUMN mng_delivery_special_areas.id IS '配達特別地域ID';
COMMENT ON COLUMN mng_delivery_special_areas.pref_code IS '都道府県コード';
COMMENT ON COLUMN mng_delivery_special_areas.zip_code IS '郵便番号';
COMMENT ON COLUMN mng_delivery_special_areas.delivery_method_code IS '配達方法コード';
COMMENT ON COLUMN mng_delivery_special_areas.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mng_delivery_special_areas.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_delivery_special_areas.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_delivery_special_areas.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_delivery_special_areas.created_at IS '作成日時';
COMMENT ON COLUMN mng_delivery_special_areas.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_delivery_special_areas.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_delivery_special_areas.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_delivery_special_areas.updated_at IS '更新日時';
COMMENT ON COLUMN mng_delivery_special_areas.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_delivery_special_areas.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_delivery_special_areas.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_delivery_special_areas.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_delivery_special_areas.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_delivery_special_areas.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_delivery_special_areas FOR EACH ROW EXECUTE FUNCTION set_updated_at();