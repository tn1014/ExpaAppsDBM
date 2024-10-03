-- Table: mng_delivery_special_area_periods;

DROP TABLE IF EXISTS mng_delivery_special_area_periods;

CREATE TABLE IF NOT EXISTS mng_delivery_special_area_periods
(
		id BIGSERIAL
	,	caption TEXT NOT NULL
	,	start_month TEXT NOT NULL
	,	start_day TEXT NOT NULL
	,	end_month TEXT NOT NULL
	,	end_day TEXT NOT NULL
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
	,	CONSTRAINT mng_delivery_special_area_periods_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_delivery_special_area_periods OWNER to expa_apps;

COMMENT ON TABLE mng_delivery_special_area_periods
	IS '期間別配達特別地域・離島マスタ';
COMMENT ON COLUMN mng_delivery_special_area_periods.id IS '期間別配達特別地域ID';
COMMENT ON COLUMN mng_delivery_special_area_periods.caption IS '期間名称';
COMMENT ON COLUMN mng_delivery_special_area_periods.start_month IS '開始月';
COMMENT ON COLUMN mng_delivery_special_area_periods.start_day IS '開始日';
COMMENT ON COLUMN mng_delivery_special_area_periods.end_month IS '終了月';
COMMENT ON COLUMN mng_delivery_special_area_periods.end_day IS '終了日';
COMMENT ON COLUMN mng_delivery_special_area_periods.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mng_delivery_special_area_periods.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_delivery_special_area_periods.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_delivery_special_area_periods.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_delivery_special_area_periods.created_at IS '作成日時';
COMMENT ON COLUMN mng_delivery_special_area_periods.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_delivery_special_area_periods.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_delivery_special_area_periods.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_delivery_special_area_periods.updated_at IS '更新日時';
COMMENT ON COLUMN mng_delivery_special_area_periods.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_delivery_special_area_periods.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_delivery_special_area_periods.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_delivery_special_area_periods.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_delivery_special_area_periods.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_delivery_special_area_periods.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_delivery_special_area_periods FOR EACH ROW EXECUTE FUNCTION set_updated_at();