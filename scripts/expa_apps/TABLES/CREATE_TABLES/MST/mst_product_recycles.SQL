-- Table: mst_product_recycles

DROP TABLE IF EXISTS mst_product_recycles;

CREATE TABLE IF NOT EXISTS mst_product_recycles
(
		id BIGSERIAL
	,	recycle_code TEXT NOT NULL
	,	recycle_name TEXT NOT NULL
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
	,	CONSTRAINT mst_product_recycles_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_product_recycles OWNER to expa_apps;

COMMENT ON TABLE mst_product_recycles
	IS 'キラックス商品容器包装リサイクル区分マスタ';
COMMENT ON COLUMN mst_product_recycles.id IS 'リサイクル区分ID';
COMMENT ON COLUMN mst_product_recycles.recycle_code IS 'リサイクル区分コード';
COMMENT ON COLUMN mst_product_recycles.recycle_name IS 'リサイクル区分名';
COMMENT ON COLUMN mst_product_recycles.rank IS '表示順';
COMMENT ON COLUMN mst_product_recycles.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_product_recycles.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_product_recycles.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_product_recycles.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_product_recycles.created_at IS '作成日時';
COMMENT ON COLUMN mst_product_recycles.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_product_recycles.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_product_recycles.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_product_recycles.updated_at IS '更新日時';
COMMENT ON COLUMN mst_product_recycles.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_product_recycles.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_product_recycles.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_product_recycles.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_product_recycles.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_product_recycles.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_product_recycles FOR EACH ROW EXECUTE FUNCTION set_updated_at();