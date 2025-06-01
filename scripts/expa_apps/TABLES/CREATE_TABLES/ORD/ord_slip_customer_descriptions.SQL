-- Table: ord_slip_customer_descriptions

DROP TABLE IF EXISTS ord_slip_customer_descriptions;

CREATE TABLE IF NOT EXISTS ord_slip_customer_descriptions
(
		order_id BIGINT
	,	remarks TEXT NOT NULL
	,	delivery_instructed_on DATE
	,	delivery_instructed_time_code TEXT NOT NULL
	,	delivery_instructed_time TEXT NOT NULL
	,	is_required_slip_confirm BOOLEAN NOT NULL DEFAULT FALSE
	,	slip_confirmed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_slip_customer_descriptions_pkey PRIMARY KEY (order_id)
);

ALTER TABLE IF EXISTS ord_slip_customer_descriptions OWNER to expa_apps;

COMMENT ON TABLE ord_slip_customer_descriptions
	IS '受注伝票顧客備考テーブル';
COMMENT ON COLUMN ord_slip_customer_descriptions.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slip_customer_descriptions.remarks IS '購入者備考';
COMMENT ON COLUMN ord_slip_customer_descriptions.delivery_instructed_on IS '購入者指定到着日';
COMMENT ON COLUMN ord_slip_customer_descriptions.delivery_instructed_time_code IS '購入者指定配達時間帯コード';
COMMENT ON COLUMN ord_slip_customer_descriptions.delivery_instructed_time IS '購入者指定配達時間帯';
COMMENT ON COLUMN ord_slip_customer_descriptions.is_required_slip_confirm IS '受注伝票要確認フラグ';
COMMENT ON COLUMN ord_slip_customer_descriptions.slip_confirmed_at IS '受注伝票確認日時';
COMMENT ON COLUMN ord_slip_customer_descriptions.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slip_customer_descriptions.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slip_customer_descriptions.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slip_customer_descriptions.created_at IS '作成日時';
COMMENT ON COLUMN ord_slip_customer_descriptions.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slip_customer_descriptions.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slip_customer_descriptions.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slip_customer_descriptions.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_slip_customer_descriptions FOR EACH ROW EXECUTE FUNCTION set_updated_at();
