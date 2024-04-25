-- Table: app_common_items

DROP TABLE IF EXISTS app_common_items;

CREATE TABLE IF NOT EXISTS app_common_items
(
		id BIGSERIAL
	,	common_item_category_code TEXT NOT NULL
	,	common_item_code TEXT NOT NULL
	,	common_item_name TEXT NOT NULL
	,	common_item_value TEXT NOT NULL
	,	common_item_num NUMERIC
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
	,	CONSTRAINT app_common_items_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_common_items OWNER to expa_apps;

COMMENT ON TABLE app_common_items
	IS 'アプリケーション共通項目設定';
COMMENT ON COLUMN app_common_items.id IS '共通項目ID';
COMMENT ON COLUMN app_common_items.common_item_category_code IS '共通項目分類コード';
COMMENT ON COLUMN app_common_items.common_item_code IS '共通項目コード';
COMMENT ON COLUMN app_common_items.common_item_name IS '共通項目名';
COMMENT ON COLUMN app_common_items.common_item_value IS '共通項目文字列値';
COMMENT ON COLUMN app_common_items.common_item_num IS '共通項目数値';
COMMENT ON COLUMN app_common_items.rank IS '表示順';
COMMENT ON COLUMN app_common_items.is_enabled IS '使用可能区分';
COMMENT ON COLUMN app_common_items.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_common_items.created_terminal IS '作成端末';
COMMENT ON COLUMN app_common_items.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_common_items.created_at IS '作成日時';
COMMENT ON COLUMN app_common_items.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_common_items.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_common_items.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_common_items.updated_at IS '更新日時';
COMMENT ON COLUMN app_common_items.is_deleted IS '削除区分';
COMMENT ON COLUMN app_common_items.deleted_description IS '削除備考';
COMMENT ON COLUMN app_common_items.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_common_items.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_common_items.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_common_items.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_common_items FOR EACH ROW EXECUTE FUNCTION set_updated_at();