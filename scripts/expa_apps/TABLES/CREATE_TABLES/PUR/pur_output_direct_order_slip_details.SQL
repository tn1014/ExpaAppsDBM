-- Table: pur_output_direct_order_slip_details

DROP TABLE IF EXISTS pur_output_direct_order_slip_details;

CREATE TABLE IF NOT EXISTS pur_output_direct_order_slip_details
(
		id BIGSERIAL
	,	output_direct_order_slip_id BIGINT NOT NULL
	,	detail_no SMALLINT NOT NULL
	,	package_shipment_product_id BIGINT NOT NULL
	,	product_code TEXT NOT NULL
	,	purchase_product_code TEXT NOT NULL
	,	product_name TEXT NOT NULL
	,	supplier_item_code TEXT NOT NULL
	,	purchase_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_code TEXT NOT NULL
	,	purchase_unit TEXT NOT NULL
	,	purchase_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	purchase_unit_price NUMERIC NOT NULL DEFAULT 0	
	,	sales_relation_no TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_output_direct_order_slip_details_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_output_direct_order_slip_details OWNER to expa_apps;

COMMENT ON TABLE pur_output_direct_order_slip_details
	IS '直送伝票発行テーブル';
COMMENT ON COLUMN pur_output_direct_order_slip_details.id IS '直送伝票明細発行ID';
COMMENT ON COLUMN pur_output_direct_order_slip_details.output_direct_order_slip_id IS '直送伝票発行ID';
COMMENT ON COLUMN pur_output_direct_order_slip_details.detail_no IS '明細No.';
COMMENT ON COLUMN pur_output_direct_order_slip_details.package_shipment_product_id IS '出荷製品ID';
COMMENT ON COLUMN pur_output_direct_order_slip_details.product_code IS '製品コード';
COMMENT ON COLUMN pur_output_direct_order_slip_details.purchase_product_code IS '発注製品コード';
COMMENT ON COLUMN pur_output_direct_order_slip_details.product_name IS '製品名';
COMMENT ON COLUMN pur_output_direct_order_slip_details.supplier_item_code IS '仕入先品番';
COMMENT ON COLUMN pur_output_direct_order_slip_details.purchase_quantity IS '発注数量';
COMMENT ON COLUMN pur_output_direct_order_slip_details.purchase_unit_code IS '発注単位コード';
COMMENT ON COLUMN pur_output_direct_order_slip_details.purchase_unit IS '発注単位';
COMMENT ON COLUMN pur_output_direct_order_slip_details.purchase_unit_quantity IS '発注ロット数';
COMMENT ON COLUMN pur_output_direct_order_slip_details.purchase_unit_price IS '発注単価';
COMMENT ON COLUMN pur_output_direct_order_slip_details.sales_relation_no IS '直送伝票発行ID';
COMMENT ON COLUMN pur_output_direct_order_slip_details.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_output_direct_order_slip_details.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_output_direct_order_slip_details.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_output_direct_order_slip_details.created_at IS '作成日時';
COMMENT ON COLUMN pur_output_direct_order_slip_details.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_output_direct_order_slip_details.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_output_direct_order_slip_details.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_output_direct_order_slip_details.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_output_direct_order_slip_details FOR EACH ROW EXECUTE FUNCTION set_updated_at();