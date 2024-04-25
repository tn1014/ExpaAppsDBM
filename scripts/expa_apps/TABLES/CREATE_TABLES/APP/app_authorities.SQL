-- Table: app_authorities

DROP TABLE IF EXISTS app_authorities;

CREATE TABLE IF NOT EXISTS app_authorities
(
		id BIGSERIAL
	,	authority_code TEXT NOT NULL
	,	authority_name TEXT NOT NULL
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
	,	CONSTRAINT app_authorities_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_authorities OWNER to expa_apps;

COMMENT ON TABLE app_authorities
	IS 'アプリケーション使用権限設定';
COMMENT ON COLUMN app_authorities.id IS '権限ID';
COMMENT ON COLUMN app_authorities.authority_code IS '権限コード';
COMMENT ON COLUMN app_authorities.authority_name IS '権限名';
COMMENT ON COLUMN app_authorities.rank IS '表示順';
COMMENT ON COLUMN app_authorities.is_enabled IS '使用可能区分';
COMMENT ON COLUMN app_authorities.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_authorities.created_terminal IS '作成端末';
COMMENT ON COLUMN app_authorities.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_authorities.created_at IS '作成日時';
COMMENT ON COLUMN app_authorities.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_authorities.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_authorities.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_authorities.updated_at IS '更新日時';
COMMENT ON COLUMN app_authorities.is_deleted IS '削除区分';
COMMENT ON COLUMN app_authorities.deleted_description IS '削除備考';
COMMENT ON COLUMN app_authorities.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_authorities.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_authorities.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_authorities.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_authorities FOR EACH ROW EXECUTE FUNCTION set_updated_at();