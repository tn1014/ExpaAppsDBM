-- Table: prd_maincategories

DROP TABLE IF EXISTS prd_maincategories;

CREATE TABLE IF NOT EXISTS prd_maincategories
(
		id BIGSERIAL
	,	item_category_type_id BIGINT NOT NULL
	,	maincategory_name TEXT NOT NULL
	,	rakuten_shop_category_name TEXT NOT NULL
	,	yahoo_shop_category_name TEXT NOT NULL
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
	,	CONSTRAINT prd_maincategories_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_maincategories OWNER to expa_apps;

COMMENT ON TABLE prd_maincategories
	IS '商品メインカテゴリマスタ';
COMMENT ON COLUMN prd_maincategories.id IS '商品メインカテゴリID';
COMMENT ON COLUMN prd_maincategories.item_category_type_id IS '商品カテゴリ分類ID';
COMMENT ON COLUMN prd_maincategories.maincategory_name IS 'メインカテゴリ名';
COMMENT ON COLUMN prd_maincategories.rakuten_shop_category_name IS '楽天市場店舗固有カテゴリ名';
COMMENT ON COLUMN prd_maincategories.yahoo_shop_category_name IS 'Yahoo!ショッピング店舗固有カテゴリ名';
COMMENT ON COLUMN prd_maincategories.is_enabled IS '使用可能区分';
COMMENT ON COLUMN prd_maincategories.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_maincategories.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_maincategories.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_maincategories.created_at IS '作成日時';
COMMENT ON COLUMN prd_maincategories.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_maincategories.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_maincategories.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_maincategories.updated_at IS '更新日時';
COMMENT ON COLUMN prd_maincategories.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_maincategories.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_maincategories.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_maincategories.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_maincategories.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_maincategories.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_maincategories FOR EACH ROW EXECUTE FUNCTION set_updated_at();