-- Table: prd_maincategory_orders

DROP TABLE IF EXISTS prd_maincategory_orders;

CREATE TABLE IF NOT EXISTS prd_maincategory_orders
(
		id BIGSERIAL
	,	item_category_type_id BIGINT NOT NULL
	,	maincategory_id BIGINT NOT NULL
	,	rank INT NOT NULL
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
	,	CONSTRAINT prd_maincategory_orders_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_maincategory_orders OWNER to expa_apps;

COMMENT ON TABLE prd_maincategory_orders
	IS '商品メインカテゴリ表示順マスタ';
COMMENT ON COLUMN prd_maincategory_orders.id IS '表示順ID';
COMMENT ON COLUMN prd_maincategory_orders.item_category_type_id IS '商品分類カテゴリID';
COMMENT ON COLUMN prd_maincategory_orders.maincategory_id IS '商品メインカテゴリID';
COMMENT ON COLUMN prd_maincategory_orders.rank IS '表示順';
COMMENT ON COLUMN prd_maincategory_orders.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_maincategory_orders.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_maincategory_orders.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_maincategory_orders.created_at IS '作成日時';
COMMENT ON COLUMN prd_maincategory_orders.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_maincategory_orders.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_maincategory_orders.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_maincategory_orders.updated_at IS '更新日時';
COMMENT ON COLUMN prd_maincategory_orders.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_maincategory_orders.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_maincategory_orders.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_maincategory_orders.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_maincategory_orders.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_maincategory_orders.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_maincategory_orders FOR EACH ROW EXECUTE FUNCTION set_updated_at();