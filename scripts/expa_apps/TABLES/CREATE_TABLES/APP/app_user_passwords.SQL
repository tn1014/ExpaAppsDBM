-- Table: app_user_passwords

DROP TABLE IF EXISTS app_user_passwords;

CREATE TABLE IF NOT EXISTS app_user_passwords
(
		id BIGSERIAL
	,	user_code TEXT NOT NULL
	,	password TEXT NOT NULL
	,	expired_on DATE
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
	,	CONSTRAINT app_user_passwords_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_user_passwords OWNER to expa_apps;

COMMENT ON TABLE app_user_passwords
	IS 'アプリケーションユーザパスワード設定';
COMMENT ON COLUMN app_user_passwords.id IS 'パスワードID';
COMMENT ON COLUMN app_user_passwords.user_code IS 'ユーザコード';
COMMENT ON COLUMN app_user_passwords.password IS 'パスワード';
COMMENT ON COLUMN app_user_passwords.expired_on IS '利用停止日';
COMMENT ON COLUMN app_user_passwords.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_user_passwords.created_terminal IS '作成端末';
COMMENT ON COLUMN app_user_passwords.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_user_passwords.created_at IS '作成日時';
COMMENT ON COLUMN app_user_passwords.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_user_passwords.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_user_passwords.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_user_passwords.updated_at IS '更新日時';
COMMENT ON COLUMN app_user_passwords.is_deleted IS '削除区分';
COMMENT ON COLUMN app_user_passwords.deleted_description IS '削除備考';
COMMENT ON COLUMN app_user_passwords.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_user_passwords.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_user_passwords.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_user_passwords.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_user_passwords FOR EACH ROW EXECUTE FUNCTION set_updated_at();