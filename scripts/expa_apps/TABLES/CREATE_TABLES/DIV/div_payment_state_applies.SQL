-- Table: div_payment_state_applies

DROP TABLE IF EXISTS div_payment_state_applies;

CREATE TABLE IF NOT EXISTS div_payment_state_applies
(
		id BIGSERIAL
	,	unpaid TEXT NOT NULL
	,	deposited TEXT NOT NULL
	,	unclaimed TEXT NOT NULL
	,	partial_deposited TEXT NOT NULL
	,	order_cancel TEXT NOT NULL
	,	refunded TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT div_payment_state_applies_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS div_payment_state_applies OWNER to expa_apps;

COMMENT ON TABLE div_payment_state_applies
	IS '出荷状態設定適用テーブル';
COMMENT ON COLUMN div_payment_state_applies.id IS '適用ID';
COMMENT ON COLUMN div_payment_state_applies.unpaid IS '未回収';
COMMENT ON COLUMN div_payment_state_applies.deposited IS '回収済';
COMMENT ON COLUMN div_payment_state_applies.unclaimed IS '未請求';
COMMENT ON COLUMN div_payment_state_applies.partial_deposited IS '一部回収済';
COMMENT ON COLUMN div_payment_state_applies.order_cancel IS 'キャンセル済';
COMMENT ON COLUMN div_payment_state_applies.refunded IS '返金済';
COMMENT ON COLUMN div_payment_state_applies.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN div_payment_state_applies.created_terminal IS '作成端末';
COMMENT ON COLUMN div_payment_state_applies.created_function_code IS '作成機能コード';
COMMENT ON COLUMN div_payment_state_applies.created_at IS '作成日時';
COMMENT ON COLUMN div_payment_state_applies.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN div_payment_state_applies.updated_terminal IS '更新端末';
COMMENT ON COLUMN div_payment_state_applies.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN div_payment_state_applies.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON div_payment_state_applies FOR EACH ROW EXECUTE FUNCTION set_updated_at();