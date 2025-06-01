-- Table: div_shipment_state_applies

DROP TABLE IF EXISTS div_shipment_state_applies;

CREATE TABLE IF NOT EXISTS div_shipment_state_applies
(
		id BIGSERIAL
	,	order_new TEXT NOT NULL
	,	waiting_address_confirm TEXT NOT NULL
	,	waiting_postage_confirm TEXT NOT NULL
	,	waiting_delivery_on_confirm TEXT NOT NULL
	,	waiting_rakuten_process TEXT NOT NULL
	,	waiting_payment TEXT NOT NULL
	,	waiting_preshipment_confirm TEXT NOT NULL
	,	shippable TEXT NOT NULL
	,	shipping_today TEXT NOT NULL
	,	shipped TEXT NOT NULL
	,	waiting_shipped_confirm TEXT NOT NULL
	,	preshipment_cancel TEXT NOT NULL
	,	shipped_cancel TEXT NOT NULL
	,	returned_shipment TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT div_shipment_state_applies_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS div_shipment_state_applies OWNER to expa_apps;

COMMENT ON TABLE div_shipment_state_applies
	IS '出荷状態設定適用テーブル';
COMMENT ON COLUMN div_shipment_state_applies.id IS '適用ID';
COMMENT ON COLUMN div_shipment_state_applies.order_new IS '新規受注';
COMMENT ON COLUMN div_shipment_state_applies.waiting_address_confirm IS '宛先確認中';
COMMENT ON COLUMN div_shipment_state_applies.waiting_postage_confirm IS '送料確認中';
COMMENT ON COLUMN div_shipment_state_applies.waiting_delivery_on_confirm IS '着日確認中';
COMMENT ON COLUMN div_shipment_state_applies.waiting_rakuten_process IS '楽天処理待ち';
COMMENT ON COLUMN div_shipment_state_applies.waiting_payment IS '出荷前入金待ち';
COMMENT ON COLUMN div_shipment_state_applies.waiting_preshipment_confirm IS '出荷前確認中';
COMMENT ON COLUMN div_shipment_state_applies.shippable IS '出荷待ち';
COMMENT ON COLUMN div_shipment_state_applies.shipping_today IS '本日出荷';
COMMENT ON COLUMN div_shipment_state_applies.shipped IS '出荷済';
COMMENT ON COLUMN div_shipment_state_applies.waiting_shipped_confirm IS '出荷後確認中';
COMMENT ON COLUMN div_shipment_state_applies.preshipment_cancel IS '出荷前キャンセル';
COMMENT ON COLUMN div_shipment_state_applies.shipped_cancel IS '出荷後キャンセル';
COMMENT ON COLUMN div_shipment_state_applies.returned_shipment IS '返品済';
COMMENT ON COLUMN div_shipment_state_applies.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN div_shipment_state_applies.created_terminal IS '作成端末';
COMMENT ON COLUMN div_shipment_state_applies.created_function_code IS '作成機能コード';
COMMENT ON COLUMN div_shipment_state_applies.created_at IS '作成日時';
COMMENT ON COLUMN div_shipment_state_applies.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN div_shipment_state_applies.updated_terminal IS '更新端末';
COMMENT ON COLUMN div_shipment_state_applies.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN div_shipment_state_applies.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON div_shipment_state_applies FOR EACH ROW EXECUTE FUNCTION set_updated_at();