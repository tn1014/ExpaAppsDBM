-- Table: app_users

DROP TABLE IF EXISTS app_users;

CREATE TABLE IF NOT EXISTS app_users
(
		id BIGSERIAL
	,	user_code TEXT NOT NULL
	,	user_name TEXT NOT NULL
	,	login_id TEXT NOT NULL
	,	employee_code TEXT NOT NULL
	,	authority_code TEXT NOT NULL
	,	last_logined_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	expired_on DATE
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
	,	CONSTRAINT app_users_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_users OWNER to expa_apps;

COMMENT ON TABLE app_users
	IS 'アプリケーションユーザ設定';
COMMENT ON COLUMN app_users.id IS 'ユーザID';
COMMENT ON COLUMN app_users.user_code IS 'ユーザコード';
COMMENT ON COLUMN app_users.user_name IS 'ユーザ名';
COMMENT ON COLUMN app_users.login_id IS 'ログインID';
COMMENT ON COLUMN app_users.employee_code IS '社員コード';
COMMENT ON COLUMN app_users.authority_code IS '権限コード';
COMMENT ON COLUMN app_users.last_logined_at IS '最終ログイン日時';
COMMENT ON COLUMN app_users.expired_on IS '利用停止日';
COMMENT ON COLUMN app_users.rank IS '表示順';
COMMENT ON COLUMN app_users.is_enabled IS '使用可能区分';
COMMENT ON COLUMN app_users.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_users.created_terminal IS '作成端末';
COMMENT ON COLUMN app_users.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_users.created_at IS '作成日時';
COMMENT ON COLUMN app_users.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_users.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_users.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_users.updated_at IS '更新日時';
COMMENT ON COLUMN app_users.is_deleted IS '削除区分';
COMMENT ON COLUMN app_users.deleted_description IS '削除備考';
COMMENT ON COLUMN app_users.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_users.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_users.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_users.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_users FOR EACH ROW EXECUTE FUNCTION set_updated_at();