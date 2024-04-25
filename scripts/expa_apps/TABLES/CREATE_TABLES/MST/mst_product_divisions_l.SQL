-- Table: mst_product_divisions_l

DROP TABLE IF EXISTS mst_product_divisions_l;

CREATE TABLE IF NOT EXISTS mst_product_divisions_l
(
		id BIGSERIAL
	,	division_l_code TEXT NOT NULL
	,	division_l_name TEXT NOT NULL
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
	,	CONSTRAINT mst_product_divisions_l_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_product_divisions_l OWNER to expa_apps;

COMMENT ON TABLE mst_product_divisions_l
	IS 'キラックス商品大分類マスタ';
COMMENT ON COLUMN mst_product_divisions_l.id IS '大分類ID';
COMMENT ON COLUMN mst_product_divisions_l.division_l_code IS '大分類コード';
COMMENT ON COLUMN mst_product_divisions_l.division_l_name IS '大分類名';
COMMENT ON COLUMN mst_product_divisions_l.rank IS '表示順';
COMMENT ON COLUMN mst_product_divisions_l.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_product_divisions_l.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_product_divisions_l.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_product_divisions_l.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_product_divisions_l.created_at IS '作成日時';
COMMENT ON COLUMN mst_product_divisions_l.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_product_divisions_l.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_product_divisions_l.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_product_divisions_l.updated_at IS '更新日時';
COMMENT ON COLUMN mst_product_divisions_l.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_product_divisions_l.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_product_divisions_l.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_product_divisions_l.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_product_divisions_l.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_product_divisions_l.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_product_divisions_l FOR EACH ROW EXECUTE FUNCTION set_updated_at();