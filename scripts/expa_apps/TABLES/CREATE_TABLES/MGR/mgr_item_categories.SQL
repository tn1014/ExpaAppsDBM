-- Table: mgr_item_categories;

DROP TABLE IF EXISTS mgr_item_categories;

CREATE TABLE IF NOT EXISTS mgr_item_categories
(
		id BIGSERIAL
	,	parent_category_id INTEGER
	,	parent_category_name TEXT
	,	category_id INTEGER
	,	category_name TEXT
	,	rakuten_genre_id INTEGER
	,	rakuten_shop_category_name TEXT
	,	yahoo_product_category_id INTEGER
	,	yahoo_shop_category_name TEXT
	,	maincategory_id BIGINT
	,	subcategory_id BIGINT
	,	CONSTRAINT mgr_item_categories_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mgr_item_categories OWNER to expa_apps;

COMMENT ON TABLE mgr_item_categories
	IS '【データ移行用】旧商品カテゴリマスタ';
COMMENT ON COLUMN mgr_item_categories.id IS '移行ID';
COMMENT ON COLUMN mgr_item_categories.parent_category_id IS '親カテゴリID';
COMMENT ON COLUMN mgr_item_categories.parent_category_name IS '親カテゴリ名';
COMMENT ON COLUMN mgr_item_categories.category_id IS '子カテゴリID';
COMMENT ON COLUMN mgr_item_categories.category_name IS '子カテゴリ名';
COMMENT ON COLUMN mgr_item_categories.rakuten_genre_id IS '楽天ジャンルID';
COMMENT ON COLUMN mgr_item_categories.rakuten_shop_category_name IS '楽天店舗別カテゴリ名';
COMMENT ON COLUMN mgr_item_categories.yahoo_product_category_id IS 'Yahoo!ショッピングプロダクトカテゴリ';
COMMENT ON COLUMN mgr_item_categories.yahoo_shop_category_name IS 'Yahoo!ショッピング店舗別カテゴリ名';
COMMENT ON COLUMN mgr_item_categories.maincategory_id IS '新システムメインカテゴリID';
COMMENT ON COLUMN mgr_item_categories.subcategory_id IS '新システムサブカテゴリID';