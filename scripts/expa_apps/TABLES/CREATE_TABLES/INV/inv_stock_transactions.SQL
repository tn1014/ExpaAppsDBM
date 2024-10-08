-- Table: inv_stock_transactions

DROP TABLE IF EXISTS inv_stock_transactions;

CREATE TABLE IF NOT EXISTS inv_stock_transactions
(
		id BIGSERIAL
	,	location_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	traded_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	inout_div TEXT NOT NULL
	,	transaction_div TEXT NOT NULL
	,	transaction_employee_code TEXT NOT NULL
	,	description TEXT NOT NULL
	,	is_corrected BOOLEAN NOT NULL DEFAULT FALSE
	,	closing_on DATE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT inv_stock_transactions_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS inv_stock_transactions OWNER to expa_apps;

COMMENT ON TABLE inv_stock_transactions
	IS '在庫受払テーブル';
COMMENT ON COLUMN inv_stock_transactions.id IS '在庫受払ID';
COMMENT ON COLUMN inv_stock_transactions.location_code IS '在庫場所コード';
COMMENT ON COLUMN inv_stock_transactions.product_code IS '製品コード';
COMMENT ON COLUMN inv_stock_transactions.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN inv_stock_transactions.traded_at IS '受払日時';
COMMENT ON COLUMN inv_stock_transactions.inout_div IS '入出庫区分';
COMMENT ON COLUMN inv_stock_transactions.transaction_div IS '受払区分';
COMMENT ON COLUMN inv_stock_transactions.transaction_employee_code IS '受払社員コード';
COMMENT ON COLUMN inv_stock_transactions.description IS '備考';
COMMENT ON COLUMN inv_stock_transactions.is_corrected IS '訂正フラグ';
COMMENT ON COLUMN inv_stock_transactions.closing_on IS '在庫締日';
COMMENT ON COLUMN inv_stock_transactions.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN inv_stock_transactions.created_terminal IS '作成端末';
COMMENT ON COLUMN inv_stock_transactions.created_function_code IS '作成機能コード';
COMMENT ON COLUMN inv_stock_transactions.created_at IS '作成日時';
COMMENT ON COLUMN inv_stock_transactions.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN inv_stock_transactions.updated_terminal IS '更新端末';
COMMENT ON COLUMN inv_stock_transactions.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN inv_stock_transactions.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON inv_stock_transactions FOR EACH ROW EXECUTE FUNCTION set_updated_at();