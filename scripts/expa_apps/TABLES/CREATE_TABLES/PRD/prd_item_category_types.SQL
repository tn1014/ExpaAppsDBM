-- Table: prd_item_category_types

DROP TABLE IF EXISTS prd_item_category_types;

CREATE TABLE IF NOT EXISTS prd_item_category_types
(
		id BIGSERIAL
	,	item_category_type TEXT NOT NULL
	,	is_selected BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT prd_item_category_types_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_item_category_types OWNER to expa_apps;

COMMENT ON TABLE prd_item_category_types
	IS '商品カテゴリ分類';
COMMENT ON COLUMN prd_item_category_types.id IS 'カテゴリ分類ID';
COMMENT ON COLUMN prd_item_category_types.item_category_type IS '商品カテゴリ分類';
COMMENT ON COLUMN prd_item_category_types.is_selected IS '主要分類区分';
COMMENT ON COLUMN prd_item_category_types.rank IS '表示順';
COMMENT ON COLUMN prd_item_category_types.is_enabled IS '使用可能区分';
COMMENT ON COLUMN prd_item_category_types.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_item_category_types.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_item_category_types.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_item_category_types.created_at IS '作成日時';
COMMENT ON COLUMN prd_item_category_types.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_item_category_types.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_item_category_types.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_item_category_types.updated_at IS '更新日時';
COMMENT ON COLUMN prd_item_category_types.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_item_category_types.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_item_category_types.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_item_category_types.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_item_category_types.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_item_category_types.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_item_category_types FOR EACH ROW EXECUTE FUNCTION set_updated_at();