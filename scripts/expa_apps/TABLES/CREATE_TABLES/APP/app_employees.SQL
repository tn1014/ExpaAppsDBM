-- Table: app_employees

DROP TABLE IF EXISTS app_employees;

CREATE TABLE IF NOT EXISTS app_employees
(
		id BIGSERIAL
	,	employee_code TEXT NOT NULL
	,	employment_type TEXT NOT NULL
	,	first_name TEXT NOT NULL
	,	last_name TEXT NOT NULL
	,	email TEXT NOT NULL
	,	tel01 TEXT NOT NULL
	,	tel02 TEXT NOT NULL
	,	tel03 TEXT NOT NULL
	,	hire_on DATE
	,	left_on DATE
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
	,	CONSTRAINT app_employees_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_employees OWNER to expa_apps;

COMMENT ON TABLE app_employees
	IS 'アプリケーション使用社員設定';
COMMENT ON COLUMN app_employees.id IS '社員ID';
COMMENT ON COLUMN app_employees.employee_code IS '社員コード';
COMMENT ON COLUMN app_employees.employment_type IS '雇用形態';
COMMENT ON COLUMN app_employees.first_name IS '社員名(名)';
COMMENT ON COLUMN app_employees.last_name IS '社員名(姓)';
COMMENT ON COLUMN app_employees.email IS 'メールアドレス';
COMMENT ON COLUMN app_employees.tel01 IS '電話番号1';
COMMENT ON COLUMN app_employees.tel02 IS '電話番号2';
COMMENT ON COLUMN app_employees.tel03 IS '電話番号3';
COMMENT ON COLUMN app_employees.hire_on IS '入社日';
COMMENT ON COLUMN app_employees.left_on IS '退社日';
COMMENT ON COLUMN app_employees.rank IS '表示順';
COMMENT ON COLUMN app_employees.is_enabled IS '使用可能区分';
COMMENT ON COLUMN app_employees.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_employees.created_terminal IS '作成端末';
COMMENT ON COLUMN app_employees.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_employees.created_at IS '作成日時';
COMMENT ON COLUMN app_employees.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_employees.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_employees.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_employees.updated_at IS '更新日時';
COMMENT ON COLUMN app_employees.is_deleted IS '削除区分';
COMMENT ON COLUMN app_employees.deleted_description IS '削除備考';
COMMENT ON COLUMN app_employees.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_employees.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_employees.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_employees.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_employees FOR EACH ROW EXECUTE FUNCTION set_updated_at();