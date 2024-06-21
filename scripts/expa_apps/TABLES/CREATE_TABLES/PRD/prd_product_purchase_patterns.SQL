-- Table: prd_product_purchase_patterns;

DROP TABLE IF EXISTS prd_product_purchase_patterns;

CREATE TABLE IF NOT EXISTS prd_product_purchase_patterns
(
		product_code TEXT NOT NULL
	,	location_code TEXT NOT NULL
	,	purchase_pattern_id BIGINT
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT prd_product_purchase_patterns_pkey PRIMARY KEY (product_code, location_code)
);

ALTER TABLE IF EXISTS prd_product_purchase_patterns OWNER to expa_apps;

COMMENT ON TABLE prd_product_purchase_patterns
	IS '製品別発注パターンマスタ';
COMMENT ON COLUMN prd_product_purchase_patterns.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_purchase_patterns.location_code IS '場所コード';
COMMENT ON COLUMN prd_product_purchase_patterns.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN prd_product_purchase_patterns.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_purchase_patterns.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_purchase_patterns.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_purchase_patterns.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_purchase_patterns.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_purchase_patterns.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_purchase_patterns.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_purchase_patterns.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_product_purchase_patterns FOR EACH ROW EXECUTE FUNCTION set_updated_at();