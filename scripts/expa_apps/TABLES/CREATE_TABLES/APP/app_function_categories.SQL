-- Table: app_function_categories

DROP TABLE IF EXISTS app_function_categories;

CREATE TABLE IF NOT EXISTS app_function_categories
(
		id BIGSERIAL
	,	function_category_code TEXT NOT NULL
	,	function_category_name TEXT NOT NULL
	,	function_category_icon TEXT NOT NULL
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
	,	CONSTRAINT app_function_categories_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_function_categories OWNER to expa_apps;

COMMENT ON TABLE app_function_categories
	IS 'アプリケーション機能分類設定';
COMMENT ON COLUMN app_function_categories.id IS '機能分類ID';
COMMENT ON COLUMN app_function_categories.function_category_code IS '機能分類コード';
COMMENT ON COLUMN app_function_categories.function_category_name IS '機能分類名';
COMMENT ON COLUMN app_function_categories.function_category_icon IS '機能分類アイコン';
COMMENT ON COLUMN app_function_categories.rank IS '表示順';
COMMENT ON COLUMN app_function_categories.is_enabled IS '使用可能区分';
COMMENT ON COLUMN app_function_categories.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_function_categories.created_terminal IS '作成端末';
COMMENT ON COLUMN app_function_categories.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_function_categories.created_at IS '作成日時';
COMMENT ON COLUMN app_function_categories.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_function_categories.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_function_categories.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_function_categories.updated_at IS '更新日時';
COMMENT ON COLUMN app_function_categories.is_deleted IS '削除区分';
COMMENT ON COLUMN app_function_categories.deleted_description IS '削除備考';
COMMENT ON COLUMN app_function_categories.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_function_categories.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_function_categories.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_function_categories.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_function_categories FOR EACH ROW EXECUTE FUNCTION set_updated_at();