-- Table: prd_item_sales_prices;
-- Table: prd_item_sales_prices_history;

DROP TABLE IF EXISTS prd_item_sales_prices;
DROP TABLE IF EXISTS prd_item_sales_prices_history;

CREATE TABLE IF NOT EXISTS prd_item_sales_prices
(
		id BIGSERIAL
	,	item_code TEXT NOT NULL
	,	start_on DATE NOT NULL
	,	tax_div TEXT NOT NULL
	,	tax_rate NUMERIC NOT NULL DEFAULT 0
	,	included_tax_div TEXT NOT NULL
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
	,	CONSTRAINT prd_item_sales_prices_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_item_sales_prices OWNER to expa_apps;

COMMENT ON TABLE prd_item_sales_prices
	IS '商品販売単価マスタ';
COMMENT ON COLUMN prd_item_sales_prices.id IS '販売単価ID';
COMMENT ON COLUMN prd_item_sales_prices.item_code IS '商品コード';
COMMENT ON COLUMN prd_item_sales_prices.start_on IS '適用日';
COMMENT ON COLUMN prd_item_sales_prices.tax_div IS '消費税区分';
COMMENT ON COLUMN prd_item_sales_prices.tax_rate IS '消費税率';
COMMENT ON COLUMN prd_item_sales_prices.included_tax_div IS '内税外税区分';
COMMENT ON COLUMN prd_item_sales_prices.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_item_sales_prices.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_item_sales_prices.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_item_sales_prices.created_at IS '作成日時';
COMMENT ON COLUMN prd_item_sales_prices.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_item_sales_prices.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_item_sales_prices.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_item_sales_prices.updated_at IS '更新日時';
COMMENT ON COLUMN prd_item_sales_prices.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_item_sales_prices.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_item_sales_prices.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_item_sales_prices.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_item_sales_prices.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_item_sales_prices.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_item_sales_prices_history
(
		id BIGSERIAL
	,	item_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	start_on DATE NOT NULL
	,	tax_div TEXT NOT NULL
	,	tax_rate NUMERIC NOT NULL DEFAULT 0
	,	included_tax_div TEXT NOT NULL
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
	,	CONSTRAINT prd_item_sales_prices_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_item_sales_prices_history
	IS '[履歴]商品販売単価マスタ';
COMMENT ON COLUMN prd_item_sales_prices_history.id IS '履歴ID';
COMMENT ON COLUMN prd_item_sales_prices_history.item_code IS '商品コード';
COMMENT ON COLUMN prd_item_sales_prices_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_item_sales_prices_history.start_on IS '適用日';
COMMENT ON COLUMN prd_item_sales_prices_history.tax_div IS '消費税区分';
COMMENT ON COLUMN prd_item_sales_prices_history.tax_rate IS '消費税率';
COMMENT ON COLUMN prd_item_sales_prices_history.included_tax_div IS '内税外税区分';
COMMENT ON COLUMN prd_item_sales_prices_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_item_sales_prices_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_item_sales_prices_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_item_sales_prices_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_item_sales_prices_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_item_sales_prices_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_item_sales_prices_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_item_sales_prices_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_item_sales_prices_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_item_sales_prices_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_item_sales_prices_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_item_sales_prices_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_item_sales_prices_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_item_sales_prices_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_item_sales_prices_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_item_sales_prices FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_item_sales_prices_trigger AFTER INSERT OR UPDATE ON prd_item_sales_prices FOR EACH ROW EXECUTE FUNCTION insert_prd_item_sales_prices_history();