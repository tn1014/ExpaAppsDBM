-- Table: inv_stock_transaction_quantity_histories

DROP TABLE IF EXISTS inv_stock_transaction_quantity_histories;

CREATE TABLE IF NOT EXISTS inv_stock_transaction_quantity_histories
(
		id BIGSERIAL
	,	transaction_history_id	BIGINT NOT NULL
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
	,	CONSTRAINT inv_stock_transaction_quantity_histories_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS inv_stock_transaction_quantity_histories OWNER to expa_apps;

COMMENT ON TABLE inv_stock_transaction_quantity_histories
	IS '在庫受払数量履歴テーブル';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.id IS '在庫受払数量履歴ID';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.transaction_history_id IS '在庫受払履歴ID';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.purchase_unit_price IS '仕入単価';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.transaction_quantity IS '受払数量';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.created_terminal IS '作成端末';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.created_function_code IS '作成機能コード';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.created_at IS '作成日時';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.updated_terminal IS '更新端末';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN inv_stock_transaction_quantity_histories.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON inv_stock_transaction_quantity_histories FOR EACH ROW EXECUTE FUNCTION set_updated_at();