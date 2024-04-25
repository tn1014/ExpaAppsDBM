-- Table: mng_yearly_holidays;

DROP TABLE IF EXISTS mng_yearly_holidays;

CREATE TABLE IF NOT EXISTS mng_yearly_holidays
(
		year TEXT NOT NULL
	,	month TEXT NOT NULL
	,	day TEXT NOT NULL
	,	caption TEXT NOT NULL
	,	is_business_day BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT mng_yearly_holidays_pkey PRIMARY KEY (year, month, day)
);

ALTER TABLE IF EXISTS mng_yearly_holidays OWNER to expa_apps;

COMMENT ON TABLE mng_yearly_holidays
	IS '休日マスタ';
COMMENT ON COLUMN mng_yearly_holidays.year IS '年';
COMMENT ON COLUMN mng_yearly_holidays.month IS '月';
COMMENT ON COLUMN mng_yearly_holidays.day IS '日';
COMMENT ON COLUMN mng_yearly_holidays.caption IS '休日名';
COMMENT ON COLUMN mng_yearly_holidays.is_business_day IS '営業日フラグ';
COMMENT ON COLUMN mng_yearly_holidays.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_yearly_holidays.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_yearly_holidays.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_yearly_holidays.created_at IS '作成日時';
COMMENT ON COLUMN mng_yearly_holidays.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_yearly_holidays.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_yearly_holidays.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_yearly_holidays.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_yearly_holidays FOR EACH ROW EXECUTE FUNCTION set_updated_at();