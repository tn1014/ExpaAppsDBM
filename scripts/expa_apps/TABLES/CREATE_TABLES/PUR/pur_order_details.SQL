-- Table: pur_order_details
-- Table: pur_order_details_history

DROP TABLE IF EXISTS pur_order_details;
DROP TABLE IF EXISTS pur_order_details_history;

CREATE TABLE IF NOT EXISTS pur_order_details
(
		slip_no TEXT NOT NULL
	,	detail_no SMALLINT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	purchase_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_code TEXT NOT NULL
	,	purchase_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_price NUMERIC NOT NULL DEFAULT 0	
	,	detail_description TEXT NOT NULL
	,	is_canceled BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_order_details_pkey PRIMARY KEY (slip_no, detail_no)
);

ALTER TABLE IF EXISTS pur_order_details OWNER to expa_apps;

COMMENT ON TABLE pur_order_details
	IS '製品発注明細テーブル';
COMMENT ON COLUMN pur_order_details.slip_no IS '伝票番号';
COMMENT ON COLUMN pur_order_details.detail_no IS '明細No.';
COMMENT ON COLUMN pur_order_details.product_code IS '製品コード';
COMMENT ON COLUMN pur_order_details.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN pur_order_details.purchase_quantity IS '発注数';
COMMENT ON COLUMN pur_order_details.purchase_unit_code IS '発注単位コード';
COMMENT ON COLUMN pur_order_details.purchase_unit_quantity IS '発注単位数';
COMMENT ON COLUMN pur_order_details.purchase_unit_price IS '発注単価';
COMMENT ON COLUMN pur_order_details.detail_description IS '明細備考';
COMMENT ON COLUMN pur_order_details.is_canceled IS '明細取消フラグ';
COMMENT ON COLUMN pur_order_details.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_order_details.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_order_details.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_order_details.created_at IS '作成日時';
COMMENT ON COLUMN pur_order_details.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_order_details.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_order_details.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_order_details.updated_at IS '更新日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS pur_order_details_history
(
		id BIGSERIAL
	,	slip_no TEXT NOT NULL
	,	detail_no SMALLINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	purchase_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_code TEXT NOT NULL
	,	purchase_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_price NUMERIC NOT NULL DEFAULT 0	
	,	detail_description TEXT NOT NULL
	,	is_canceled BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_order_details_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_order_details_history OWNER to expa_apps;

COMMENT ON TABLE pur_order_details_history
	IS '[履歴]製品発注明細テーブル';
COMMENT ON COLUMN pur_order_details_history.id IS '履歴ID';
COMMENT ON COLUMN pur_order_details_history.slip_no IS '伝票番号';
COMMENT ON COLUMN pur_order_details_history.detail_no IS '明細No.';
COMMENT ON COLUMN pur_order_details_history.history_count IS '更新回数';
COMMENT ON COLUMN pur_order_details_history.product_code IS '製品コード';
COMMENT ON COLUMN pur_order_details_history.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN pur_order_details_history.purchase_quantity IS '発注数';
COMMENT ON COLUMN pur_order_details_history.purchase_unit_code IS '発注単位コード';
COMMENT ON COLUMN pur_order_details_history.purchase_unit_quantity IS '発注単位数';
COMMENT ON COLUMN pur_order_details_history.purchase_unit_price IS '発注単価';
COMMENT ON COLUMN pur_order_details_history.detail_description IS '明細備考';
COMMENT ON COLUMN pur_order_details_history.is_canceled IS '明細取消フラグ';
COMMENT ON COLUMN pur_order_details_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_order_details_history.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_order_details_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_order_details_history.created_at IS '作成日時';
COMMENT ON COLUMN pur_order_details_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_order_details_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_order_details_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_order_details_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_order_details FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_pur_order_details_trigger AFTER INSERT OR UPDATE ON pur_order_details FOR EACH ROW EXECUTE FUNCTION insert_pur_order_details_history();