-- Table: prd_subcategories

DROP TABLE IF EXISTS prd_subcategories;

CREATE TABLE IF NOT EXISTS prd_subcategories
(
		id BIGSERIAL
	,	maincategory_id BIGINT NOT NULL
	,	subcategory_name TEXT NOT NULL
	,	subcategory_code TEXT NOT NULL
	,	rakuten_genre_id TEXT NOT NULL
	,	yahoo_product_category_id INTEGER
	,	rakuten_shop_category_name TEXT NOT NULL
	,	yahoo_shop_category_name TEXT NOT NULL
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
	,	CONSTRAINT prd_subcategories_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_subcategories OWNER to expa_apps;

COMMENT ON TABLE prd_subcategories
	IS '商品サブカテゴリマスタ';
COMMENT ON COLUMN prd_subcategories.id IS '商品サブカテゴリID';
COMMENT ON COLUMN prd_subcategories.maincategory_id IS '商品メインカテゴリID';
COMMENT ON COLUMN prd_subcategories.subcategory_name IS 'サブカテゴリ名';
COMMENT ON COLUMN prd_subcategories.subcategory_code IS 'サブカテゴリコード';
COMMENT ON COLUMN prd_subcategories.rakuten_genre_id IS '楽天市場ジャンルID';
COMMENT ON COLUMN prd_subcategories.yahoo_product_category_id IS 'Yahoo!ショッピングカテゴリID';
COMMENT ON COLUMN prd_subcategories.yahoo_product_category_id IS 'Yahoo!ショッピングカテゴリID';
COMMENT ON COLUMN prd_subcategories.rakuten_shop_category_name IS '楽天市場店舗固有カテゴリ名';
COMMENT ON COLUMN prd_subcategories.yahoo_shop_category_name IS 'Yahoo!ショッピング店舗固有カテゴリ名';
COMMENT ON COLUMN prd_subcategories.rank IS '表示順';
COMMENT ON COLUMN prd_subcategories.is_enabled IS '使用可能区分';
COMMENT ON COLUMN prd_subcategories.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_subcategories.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_subcategories.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_subcategories.created_at IS '作成日時';
COMMENT ON COLUMN prd_subcategories.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_subcategories.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_subcategories.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_subcategories.updated_at IS '更新日時';
COMMENT ON COLUMN prd_subcategories.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_subcategories.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_subcategories.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_subcategories.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_subcategories.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_subcategories.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_subcategories FOR EACH ROW EXECUTE FUNCTION set_updated_at();