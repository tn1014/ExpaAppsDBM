-- Table: app_function_menu_relations

DROP TABLE IF EXISTS app_function_menu_relations;

CREATE TABLE IF NOT EXISTS app_function_menu_relations
(
		id BIGSERIAL
	,	authority_code TEXT NOT NULL
	,	function_category_code TEXT NOT NULL
	,	function_subcategory_code TEXT NOT NULL
	,	function_code TEXT NOT NULL
	,	rank INT
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
	,	CONSTRAINT app_function_menu_relations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_function_menu_relations OWNER to expa_apps;

COMMENT ON TABLE app_function_menu_relations
	IS 'アプリケーションメニューリレーション設定';
COMMENT ON COLUMN app_function_menu_relations.id IS 'アプリケーションメニューリレーションID';
COMMENT ON COLUMN app_function_menu_relations.authority_code IS '権限コード';
COMMENT ON COLUMN app_function_menu_relations.function_category_code IS '機能分類コード';
COMMENT ON COLUMN app_function_menu_relations.function_subcategory_code IS '機能小分類コード';
COMMENT ON COLUMN app_function_menu_relations.function_code IS '機能コード';
COMMENT ON COLUMN app_function_menu_relations.rank IS '表示順';
COMMENT ON COLUMN app_function_menu_relations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_function_menu_relations.created_terminal IS '作成端末';
COMMENT ON COLUMN app_function_menu_relations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_function_menu_relations.created_at IS '作成日時';
COMMENT ON COLUMN app_function_menu_relations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_function_menu_relations.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_function_menu_relations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_function_menu_relations.updated_at IS '更新日時';
COMMENT ON COLUMN app_function_menu_relations.is_deleted IS '削除区分';
COMMENT ON COLUMN app_function_menu_relations.deleted_description IS '削除備考';
COMMENT ON COLUMN app_function_menu_relations.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_function_menu_relations.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_function_menu_relations.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_function_menu_relations.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_function_menu_relations FOR EACH ROW EXECUTE FUNCTION set_updated_at();