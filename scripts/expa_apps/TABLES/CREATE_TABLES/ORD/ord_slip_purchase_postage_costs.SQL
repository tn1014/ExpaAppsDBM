-- Table: ord_slip_purchase_postage_costs

DROP TABLE IF EXISTS ord_slip_purchase_postage_costs;

CREATE TABLE IF NOT EXISTS ord_slip_purchase_postage_costs
(
		id BIGSERIAL
	,	order_id BIGINT
	,	purchase_postage_cost_billing_on DATE NOT NULL
	,	purchase_postage_cost_price NUMERIC NOT NULL
	,	is_directly_shipping boolean NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_slip_purchase_postage_costs_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_slip_purchase_postage_costs OWNER to expa_apps;

COMMENT ON TABLE ord_slip_purchase_postage_costs
	IS '受注伝票仕入送料テーブル';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.id IS '受注伝票仕入送料ID';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.purchase_postage_cost_billing_on IS '仕入送料請求日';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.purchase_postage_cost_price IS '仕入送料';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.is_directly_shipping IS 'メーカー直送フラグ';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.created_at IS '作成日時';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slip_purchase_postage_costs.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_slip_purchase_postage_costs FOR EACH ROW EXECUTE FUNCTION set_updated_at();
