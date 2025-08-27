-- Table: prd_product_retail_prices;
-- Table: prd_product_retail_prices_history;

DROP TABLE IF EXISTS prd_product_retail_prices;
DROP TABLE IF EXISTS prd_product_retail_prices_history;

CREATE TABLE IF NOT EXISTS prd_product_retail_prices
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	retail_price NUMERIC
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
	,	CONSTRAINT prd_product_retail_prices_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_product_retail_prices OWNER to expa_apps;

COMMENT ON TABLE prd_product_retail_prices
	IS '製品上代単価マスタ';
COMMENT ON COLUMN prd_product_retail_prices.id IS '製品テキストスペックID';
COMMENT ON COLUMN prd_product_retail_prices.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_retail_prices.retail_price IS '上代単価';
COMMENT ON COLUMN prd_product_retail_prices.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_retail_prices.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_retail_prices.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_retail_prices.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_retail_prices.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_retail_prices.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_retail_prices.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_retail_prices.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_retail_prices.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_retail_prices.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_retail_prices.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_retail_prices.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_retail_prices.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_retail_prices.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_product_retail_prices_history
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	retail_price NUMERIC
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
	,	CONSTRAINT prd_product_retail_prices_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_product_retail_prices_history
	IS '[履歴]製品上代単価マスタ';
COMMENT ON COLUMN prd_product_retail_prices_history.id IS '履歴ID';
COMMENT ON COLUMN prd_product_retail_prices_history.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_retail_prices_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_product_retail_prices_history.retail_price IS '上代単価';
COMMENT ON COLUMN prd_product_retail_prices_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_retail_prices_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_retail_prices_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_retail_prices_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_retail_prices_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_retail_prices_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_retail_prices_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_retail_prices_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_retail_prices_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_retail_prices_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_retail_prices_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_retail_prices_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_retail_prices_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_retail_prices_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_product_retail_prices_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_product_retail_prices FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_product_retail_prices_trigger AFTER INSERT OR UPDATE ON prd_product_retail_prices FOR EACH ROW EXECUTE FUNCTION insert_prd_product_retail_prices_history();