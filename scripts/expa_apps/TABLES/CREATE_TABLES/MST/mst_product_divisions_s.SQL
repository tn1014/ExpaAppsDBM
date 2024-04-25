-- Table: mst_product_divisions_s

DROP TABLE IF EXISTS mst_product_divisions_s;

CREATE TABLE IF NOT EXISTS mst_product_divisions_s
(
		id BIGSERIAL
	,	division_s_code TEXT NOT NULL
	,	division_s_name TEXT NOT NULL
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
	,	CONSTRAINT mst_product_divisions_s_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_product_divisions_s OWNER to expa_apps;

COMMENT ON TABLE mst_product_divisions_s
	IS 'キラックス商品小分類マスタ';
COMMENT ON COLUMN mst_product_divisions_s.id IS '小分類ID';
COMMENT ON COLUMN mst_product_divisions_s.division_s_code IS '小分類コード';
COMMENT ON COLUMN mst_product_divisions_s.division_s_name IS '小分類名';
COMMENT ON COLUMN mst_product_divisions_s.rank IS '表示順';
COMMENT ON COLUMN mst_product_divisions_s.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_product_divisions_s.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_product_divisions_s.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_product_divisions_s.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_product_divisions_s.created_at IS '作成日時';
COMMENT ON COLUMN mst_product_divisions_s.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_product_divisions_s.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_product_divisions_s.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_product_divisions_s.updated_at IS '更新日時';
COMMENT ON COLUMN mst_product_divisions_s.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_product_divisions_s.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_product_divisions_s.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_product_divisions_s.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_product_divisions_s.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_product_divisions_s.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_product_divisions_s FOR EACH ROW EXECUTE FUNCTION set_updated_at();