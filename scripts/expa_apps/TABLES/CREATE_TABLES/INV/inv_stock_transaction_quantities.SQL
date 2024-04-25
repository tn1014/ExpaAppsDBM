-- Table: inv_stock_transaction_quantities

DROP TABLE IF EXISTS inv_stock_transaction_quantities;

CREATE TABLE IF NOT EXISTS inv_stock_transaction_quantities
(
		id BIGSERIAL
	,	transaction_id	BIGINT NOT NULL
	,	purchase_unit_price NUMERIC NOT NULL
	,	transaction_quantity NUMERIC NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT inv_stock_transaction_quantities_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS inv_stock_transaction_quantities OWNER to expa_apps;

COMMENT ON TABLE inv_stock_transaction_quantities
	IS '在庫受払数量テーブル';
COMMENT ON COLUMN inv_stock_transaction_quantities.id IS '在庫受払数量ID';
COMMENT ON COLUMN inv_stock_transaction_quantities.transaction_id IS '在庫受払ID';
COMMENT ON COLUMN inv_stock_transaction_quantities.purchase_unit_price IS '仕入単価';
COMMENT ON COLUMN inv_stock_transaction_quantities.transaction_quantity IS '受払数量';
COMMENT ON COLUMN inv_stock_transaction_quantities.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_quantities.created_terminal IS '作成端末';
COMMENT ON COLUMN inv_stock_transaction_quantities.created_function_code IS '作成機能コード';
COMMENT ON COLUMN inv_stock_transaction_quantities.created_at IS '作成日時';
COMMENT ON COLUMN inv_stock_transaction_quantities.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_quantities.updated_terminal IS '更新端末';
COMMENT ON COLUMN inv_stock_transaction_quantities.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN inv_stock_transaction_quantities.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON inv_stock_transaction_quantities FOR EACH ROW EXECUTE FUNCTION set_updated_at();