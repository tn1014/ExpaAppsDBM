-- Table: inv_monthly_stocks

DROP TABLE IF EXISTS inv_monthly_stocks;

CREATE TABLE IF NOT EXISTS inv_monthly_stocks
(
		id BIGSERIAL
	,	closing_on DATE NOT NULL
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
	,	CONSTRAINT inv_monthly_stocks_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS inv_monthly_stocks OWNER to expa_apps;

COMMENT ON TABLE inv_monthly_stocks
	IS '製品月末在庫テーブル';
COMMENT ON COLUMN inv_monthly_stocks.id IS '月末在庫ID';
COMMENT ON COLUMN inv_monthly_stocks.closing_on IS '在庫締日';
COMMENT ON COLUMN inv_monthly_stocks.location_code IS '在庫場所コード';
COMMENT ON COLUMN inv_monthly_stocks.product_code IS '製品コード';
COMMENT ON COLUMN inv_monthly_stocks.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN inv_monthly_stocks.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN inv_monthly_stocks.created_terminal IS '作成端末';
COMMENT ON COLUMN inv_monthly_stocks.created_function_code IS '作成機能コード';
COMMENT ON COLUMN inv_monthly_stocks.created_at IS '作成日時';
COMMENT ON COLUMN inv_monthly_stocks.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN inv_monthly_stocks.updated_terminal IS '更新端末';
COMMENT ON COLUMN inv_monthly_stocks.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN inv_monthly_stocks.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON inv_monthly_stocks FOR EACH ROW EXECUTE FUNCTION set_updated_at();