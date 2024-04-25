-- Table: inv_stock_transaction_histories

DROP TABLE IF EXISTS inv_stock_transaction_histories;

CREATE TABLE IF NOT EXISTS inv_stock_transaction_histories
(
		id BIGSERIAL
	,	location_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	traded_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	inout_div TEXT NOT NULL
	,	transaction_div TEXT NOT NULL
	,	transaction_user_code TEXT NOT NULL
	,	description TEXT NOT NULL
	,	prev_stock_quantity NUMERIC
	,	is_corrected BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT inv_stock_transaction_histories_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS inv_stock_transaction_histories OWNER to expa_apps;

COMMENT ON TABLE inv_stock_transaction_histories
	IS '在庫受払履歴テーブル';
COMMENT ON COLUMN inv_stock_transaction_histories.id IS '在庫受払履歴ID';
COMMENT ON COLUMN inv_stock_transaction_histories.location_code IS '在庫場所コード';
COMMENT ON COLUMN inv_stock_transaction_histories.product_code IS '製品コード';
COMMENT ON COLUMN inv_stock_transaction_histories.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN inv_stock_transaction_histories.traded_at IS '受払日時';
COMMENT ON COLUMN inv_stock_transaction_histories.inout_div IS '入出庫区分';
COMMENT ON COLUMN inv_stock_transaction_histories.transaction_div IS '受払区分';
COMMENT ON COLUMN inv_stock_transaction_histories.transaction_user_code IS '受払ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_histories.description IS '備考';
COMMENT ON COLUMN inv_stock_transaction_histories.prev_stock_quantity IS '更新前在庫数';
COMMENT ON COLUMN inv_stock_transaction_histories.is_corrected IS '仕入単価訂正フラグ';
COMMENT ON COLUMN inv_stock_transaction_histories.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_histories.created_terminal IS '作成端末';
COMMENT ON COLUMN inv_stock_transaction_histories.created_function_code IS '作成機能コード';
COMMENT ON COLUMN inv_stock_transaction_histories.created_at IS '作成日時';
COMMENT ON COLUMN inv_stock_transaction_histories.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_histories.updated_terminal IS '更新端末';
COMMENT ON COLUMN inv_stock_transaction_histories.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN inv_stock_transaction_histories.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON inv_stock_transaction_histories FOR EACH ROW EXECUTE FUNCTION set_updated_at();