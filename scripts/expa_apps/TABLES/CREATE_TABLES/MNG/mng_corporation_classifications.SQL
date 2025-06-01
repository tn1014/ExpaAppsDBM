-- Table: mng_corporation_classifications;

DROP TABLE IF EXISTS mng_corporation_classifications;

CREATE TABLE IF NOT EXISTS mng_corporation_classifications
(
		target_string TEXT NOT NULL
	,	rank INT
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
);

ALTER TABLE IF EXISTS mng_corporation_classifications OWNER to expa_apps;

COMMENT ON TABLE mng_corporation_classifications
	IS '法人識別文字列情報';
COMMENT ON COLUMN mng_corporation_classifications.target_string IS '対象文字列';
COMMENT ON COLUMN mng_corporation_classifications.rank IS '表示順';
COMMENT ON COLUMN mng_corporation_classifications.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_corporation_classifications.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_corporation_classifications.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_corporation_classifications.created_at IS '作成日時';
COMMENT ON COLUMN mng_corporation_classifications.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_corporation_classifications.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_corporation_classifications.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_corporation_classifications.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_corporation_classifications FOR EACH ROW EXECUTE FUNCTION set_updated_at();