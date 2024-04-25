-- Table: prd_yahoo_product_categories

DROP TABLE IF EXISTS prd_yahoo_product_categories;

CREATE TABLE IF NOT EXISTS prd_yahoo_product_categories
(
		id BIGSERIAL
	,	product_category_id INTEGER NOT NULL
	,	product_category_path TEXT NOT NULL
	,	rank INT
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT prd_yahoo_product_categories_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_yahoo_product_categories OWNER to expa_apps;

COMMENT ON TABLE prd_yahoo_product_categories
	IS 'Yahoo!プロダクトカテゴリマスタ';
COMMENT ON COLUMN prd_yahoo_product_categories.id IS 'カテゴリID';
COMMENT ON COLUMN prd_yahoo_product_categories.product_category_id IS 'Yahoo!ショッピングプロダクトカテゴリID';
COMMENT ON COLUMN prd_yahoo_product_categories.product_category_path IS 'Yahoo!ショッピングプロダクトカテゴリパス';
COMMENT ON COLUMN prd_yahoo_product_categories.rank IS '表示順';
COMMENT ON COLUMN prd_yahoo_product_categories.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_yahoo_product_categories.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_yahoo_product_categories.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_yahoo_product_categories.created_at IS '作成日時';
COMMENT ON COLUMN prd_yahoo_product_categories.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_yahoo_product_categories.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_yahoo_product_categories.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_yahoo_product_categories.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_yahoo_product_categories FOR EACH ROW EXECUTE FUNCTION set_updated_at();