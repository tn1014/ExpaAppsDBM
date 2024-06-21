-- Table: inv_stock_transaction_temporaries

DROP TABLE IF EXISTS inv_stock_transaction_temporaries;

CREATE TABLE IF NOT EXISTS inv_stock_transaction_temporaries
(
		id BIGSERIAL
	,	location_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	scheduled_on DATE
	,	confirmed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	inout_div TEXT NOT NULL
	,	transaction_div TEXT NOT NULL
	,	transaction_quantity NUMERIC NOT NULL
	,	transaction_user_code TEXT NOT NULL
	,	description TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT inv_stock_transaction_temporaries_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS inv_stock_transaction_temporaries OWNER to expa_apps;

COMMENT ON TABLE inv_stock_transaction_temporaries
	IS '在庫仮受払テーブル';
COMMENT ON COLUMN inv_stock_transaction_temporaries.id IS '在庫仮受払ID';
COMMENT ON COLUMN inv_stock_transaction_temporaries.location_code IS '在庫場所コード';
COMMENT ON COLUMN inv_stock_transaction_temporaries.product_code IS '製品コード';
COMMENT ON COLUMN inv_stock_transaction_temporaries.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN inv_stock_transaction_temporaries.scheduled_on IS '受払予定日';
COMMENT ON COLUMN inv_stock_transaction_temporaries.confirmed_at IS '受払確定日時';
COMMENT ON COLUMN inv_stock_transaction_temporaries.inout_div IS '入出庫区分';
COMMENT ON COLUMN inv_stock_transaction_temporaries.transaction_div IS '受払区分';
COMMENT ON COLUMN inv_stock_transaction_temporaries.transaction_quantity IS '受払数';
COMMENT ON COLUMN inv_stock_transaction_temporaries.transaction_user_code IS '受払ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_temporaries.description IS '備考';
COMMENT ON COLUMN inv_stock_transaction_temporaries.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_temporaries.created_terminal IS '作成端末';
COMMENT ON COLUMN inv_stock_transaction_temporaries.created_function_code IS '作成機能コード';
COMMENT ON COLUMN inv_stock_transaction_temporaries.created_at IS '作成日時';
COMMENT ON COLUMN inv_stock_transaction_temporaries.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN inv_stock_transaction_temporaries.updated_terminal IS '更新端末';
COMMENT ON COLUMN inv_stock_transaction_temporaries.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN inv_stock_transaction_temporaries.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON inv_stock_transaction_temporaries FOR EACH ROW EXECUTE FUNCTION set_updated_at();