-- Table: mng_regular_holidays;

DROP TABLE IF EXISTS mng_regular_holidays;

CREATE TABLE IF NOT EXISTS mng_regular_holidays
(
		id BIGSERIAL
	,	start_on DATE NOT NULL
	,	weekdays TEXT NOT NULL
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
	,	CONSTRAINT mng_regular_holidays_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_regular_holidays OWNER to expa_apps;

COMMENT ON TABLE mng_regular_holidays
	IS '定休日マスタ';
COMMENT ON COLUMN mng_regular_holidays.id IS '定休日ID';
COMMENT ON COLUMN mng_regular_holidays.start_on IS '適用日';
COMMENT ON COLUMN mng_regular_holidays.weekdays IS '定休曜日';
COMMENT ON COLUMN mng_regular_holidays.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_regular_holidays.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_regular_holidays.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_regular_holidays.created_at IS '作成日時';
COMMENT ON COLUMN mng_regular_holidays.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_regular_holidays.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_regular_holidays.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_regular_holidays.updated_at IS '更新日時';
COMMENT ON COLUMN mng_regular_holidays.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_regular_holidays.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_regular_holidays.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_regular_holidays.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_regular_holidays.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_regular_holidays.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_regular_holidays FOR EACH ROW EXECUTE FUNCTION set_updated_at();