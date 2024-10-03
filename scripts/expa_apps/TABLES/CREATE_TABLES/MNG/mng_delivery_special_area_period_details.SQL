-- Table: mng_delivery_special_area_period_details;

DROP TABLE IF EXISTS mng_delivery_special_area_period_details;

CREATE TABLE IF NOT EXISTS mng_delivery_special_area_period_details
(
		id BIGSERIAL
	,	special_area_period_id BIGINT NOT NULL
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
	,	CONSTRAINT mng_delivery_special_area_period_details_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_delivery_special_area_period_details OWNER to expa_apps;

COMMENT ON TABLE mng_delivery_special_area_period_details
	IS '期間別配達特別地域・離島マスタ明細';
COMMENT ON COLUMN mng_delivery_special_area_period_details.id IS '期間別配達特別地域明細ID';
COMMENT ON COLUMN mng_delivery_special_area_period_details.special_area_period_id IS '期間別配達特別地域期間ID';
COMMENT ON COLUMN mng_delivery_special_area_period_details.pref_code IS '都道府県コード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.zip_code IS '郵便番号';
COMMENT ON COLUMN mng_delivery_special_area_period_details.delivery_method_code IS '配達方法コード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mng_delivery_special_area_period_details.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_delivery_special_area_period_details.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.created_at IS '作成日時';
COMMENT ON COLUMN mng_delivery_special_area_period_details.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_delivery_special_area_period_details.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.updated_at IS '更新日時';
COMMENT ON COLUMN mng_delivery_special_area_period_details.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_delivery_special_area_period_details.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_delivery_special_area_period_details.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_delivery_special_area_period_details.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_delivery_special_area_period_details.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_delivery_special_area_period_details FOR EACH ROW EXECUTE FUNCTION set_updated_at();