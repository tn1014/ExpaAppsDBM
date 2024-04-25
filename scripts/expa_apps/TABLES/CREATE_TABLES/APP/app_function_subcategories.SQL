-- Table: app_function_subcategories

DROP TABLE IF EXISTS app_function_subcategories;

CREATE TABLE IF NOT EXISTS app_function_subcategories
(
		id BIGSERIAL
	,	function_subcategory_code TEXT NOT NULL
	,	function_subcategory_name TEXT NOT NULL
	,	function_subcategory_icon TEXT NOT NULL
	,	function_category_code TEXT NOT NULL
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
	,	CONSTRAINT app_function_subcategories_pkeys PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_function_subcategories OWNER to expa_apps;

COMMENT ON TABLE app_function_subcategories
	IS 'アプリケーション機能小分類設定';
COMMENT ON COLUMN app_function_subcategories.id IS '機能小分類ID';
COMMENT ON COLUMN app_function_subcategories.function_subcategory_code IS '機能小分類コード';
COMMENT ON COLUMN app_function_subcategories.function_subcategory_name IS '機能小分類名';
COMMENT ON COLUMN app_function_subcategories.function_subcategory_icon IS '機能小分類アイコン';
COMMENT ON COLUMN app_function_subcategories.function_category_code IS '機能分類コード';
COMMENT ON COLUMN app_function_subcategories.rank IS '表示順';
COMMENT ON COLUMN app_function_subcategories.is_enabled IS '使用可能区分';
COMMENT ON COLUMN app_function_subcategories.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_function_subcategories.created_terminal IS '作成端末';
COMMENT ON COLUMN app_function_subcategories.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_function_subcategories.created_at IS '作成日時';
COMMENT ON COLUMN app_function_subcategories.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_function_subcategories.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_function_subcategories.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_function_subcategories.updated_at IS '更新日時';
COMMENT ON COLUMN app_function_subcategories.is_deleted IS '削除区分';
COMMENT ON COLUMN app_function_subcategories.deleted_description IS '削除備考';
COMMENT ON COLUMN app_function_subcategories.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_function_subcategories.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_function_subcategories.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_function_subcategories.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_function_subcategories FOR EACH ROW EXECUTE FUNCTION set_updated_at();