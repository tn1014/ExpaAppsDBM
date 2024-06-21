-- Table: pur_order_temporaries

DROP TABLE IF EXISTS pur_order_temporaries;

CREATE TABLE IF NOT EXISTS pur_order_temporaries
(
		id BIGSERIAL
	,	stock_transaction_temporary_id BIGINT NOT NULL
	,	order_scheduled_on DATE
	,	arrival_scheduled_on DATE
	,	purchase_pattern_id BIGINT
	,	location_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	purchase_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_code TEXT NOT NULL
	,	purchase_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_price NUMERIC NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_order_temporaries_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_order_temporaries OWNER to expa_apps;

COMMENT ON TABLE pur_order_temporaries
	IS '製品仮発注テーブル';
COMMENT ON COLUMN pur_order_temporaries.id IS '仮発注ID';
COMMENT ON COLUMN pur_order_temporaries.stock_transaction_temporary_id IS '仮受払ID';
COMMENT ON COLUMN pur_order_temporaries.order_scheduled_on IS '発注予定日';
COMMENT ON COLUMN pur_order_temporaries.arrival_scheduled_on IS '入荷予定日';
COMMENT ON COLUMN pur_order_temporaries.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN pur_order_temporaries.location_code IS '場所コード';
COMMENT ON COLUMN pur_order_temporaries.product_code IS '製品コード';
COMMENT ON COLUMN pur_order_temporaries.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN pur_order_temporaries.purchase_quantity IS '発注数量';
COMMENT ON COLUMN pur_order_temporaries.purchase_unit_code IS '発注単位コード';
COMMENT ON COLUMN pur_order_temporaries.purchase_unit_quantity IS '発注単位数';
COMMENT ON COLUMN pur_order_temporaries.purchase_unit_price IS '発注単価';
COMMENT ON COLUMN pur_order_temporaries.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_order_temporaries.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_order_temporaries.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_order_temporaries.created_at IS '作成日時';
COMMENT ON COLUMN pur_order_temporaries.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_order_temporaries.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_order_temporaries.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_order_temporaries.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_order_temporaries FOR EACH ROW EXECUTE FUNCTION set_updated_at();