-- Table: ord_package_shipment_product_purchase_costs

DROP TABLE IF EXISTS ord_package_shipment_product_purchase_costs;

CREATE TABLE IF NOT EXISTS ord_package_shipment_product_purchase_costs
(
		id BIGSERIAL
	,	package_shipment_product_id BIGINT
	,	purchase_cost_billing_on DATE
	,	purchase_cost_price NUMERIC
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipment_product_purchase_costs_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipment_product_purchase_costs OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipment_product_purchase_costs
	IS '送付先出荷製品仕入原価テーブル';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.id IS '送付先出荷製品仕入原価ID';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.package_shipment_product_id IS '送付先出荷製品ID';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.purchase_cost_billing_on IS '仕入請求日';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.purchase_cost_price IS '仕入原価';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipment_product_purchase_costs.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_shipment_product_purchase_costs FOR EACH ROW EXECUTE FUNCTION set_updated_at();
