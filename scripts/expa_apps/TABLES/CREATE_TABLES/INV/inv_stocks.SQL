-- Table: inv_stocks

DROP TABLE IF EXISTS inv_stocks;

CREATE TABLE IF NOT EXISTS inv_stocks
(
		id BIGSERIAL
	,	current_ym TEXT NOT NULL
	,	location_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT inv_stocks_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS inv_stocks OWNER to expa_apps;

COMMENT ON TABLE inv_stocks
	IS '製品当月在庫テーブル';
COMMENT ON COLUMN inv_stocks.id IS '製品当月在庫ID';
COMMENT ON COLUMN inv_stocks.current_ym IS '当年月';
COMMENT ON COLUMN inv_stocks.location_code IS '在庫場所コード';
COMMENT ON COLUMN inv_stocks.product_code IS '製品コード';
COMMENT ON COLUMN inv_stocks.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN inv_stocks.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN inv_stocks.created_terminal IS '作成端末';
COMMENT ON COLUMN inv_stocks.created_function_code IS '作成機能コード';
COMMENT ON COLUMN inv_stocks.created_at IS '作成日時';
COMMENT ON COLUMN inv_stocks.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN inv_stocks.updated_terminal IS '更新端末';
COMMENT ON COLUMN inv_stocks.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN inv_stocks.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON inv_stocks FOR EACH ROW EXECUTE FUNCTION set_updated_at();