-- Table: pur_direct_order_temporaries

DROP TABLE IF EXISTS pur_direct_order_temporaries;

CREATE TABLE IF NOT EXISTS pur_direct_order_temporaries
(
		id BIGSERIAL
	,	package_shipment_id BIGINT NOT NULL
	,	package_shipment_product_id BIGINT NOT NULL
	,	order_scheduled_on DATE
	,	delivery_destination_code TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	sender_confirmed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	product_code TEXT NOT NULL
	,	internal_description TEXT NOT NULL
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
	,	CONSTRAINT pur_direct_order_temporaries_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_direct_order_temporaries OWNER to expa_apps;

COMMENT ON TABLE pur_direct_order_temporaries
	IS '製品直送仮発注テーブル';
COMMENT ON COLUMN pur_direct_order_temporaries.id IS '仮発注ID';
COMMENT ON COLUMN pur_direct_order_temporaries.package_shipment_id IS '受注送付先出荷ID';
COMMENT ON COLUMN pur_direct_order_temporaries.package_shipment_product_id IS '受注送付先出荷製品ID';
COMMENT ON COLUMN pur_direct_order_temporaries.order_scheduled_on IS '発注予定日';
COMMENT ON COLUMN pur_direct_order_temporaries.delivery_destination_code IS '納品先コード';
COMMENT ON COLUMN pur_direct_order_temporaries.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_direct_order_temporaries.sender_confirmed_at IS '送付先確認日時';
COMMENT ON COLUMN pur_direct_order_temporaries.product_code IS '製品コード';
COMMENT ON COLUMN pur_direct_order_temporaries.internal_description IS '社内備考';
COMMENT ON COLUMN pur_direct_order_temporaries.purchase_quantity IS '発注数量';
COMMENT ON COLUMN pur_direct_order_temporaries.purchase_unit_code IS '発注単位コード';
COMMENT ON COLUMN pur_direct_order_temporaries.purchase_unit_quantity IS '発注単位数';
COMMENT ON COLUMN pur_direct_order_temporaries.purchase_unit_price IS '発注単価';
COMMENT ON COLUMN pur_direct_order_temporaries.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_direct_order_temporaries.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_direct_order_temporaries.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_direct_order_temporaries.created_at IS '作成日時';
COMMENT ON COLUMN pur_direct_order_temporaries.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_direct_order_temporaries.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_direct_order_temporaries.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_direct_order_temporaries.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_direct_order_temporaries FOR EACH ROW EXECUTE FUNCTION set_updated_at();