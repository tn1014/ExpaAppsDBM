-- Table: ord_slip_timestamps

DROP TABLE IF EXISTS ord_slip_timestamps;

CREATE TABLE IF NOT EXISTS ord_slip_timestamps
(
		order_id BIGINT
	,	ordered_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	confirmed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	approved_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	completed_on DATE
	,	payment_confirmed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	paymented_on DATE
	,	canceled_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_slip_timestamps_pkey PRIMARY KEY (order_id)
);

ALTER TABLE IF EXISTS ord_slip_timestamps OWNER to expa_apps;

COMMENT ON TABLE ord_slip_timestamps
	IS '受注伝票タイムスタンプテーブル';
COMMENT ON COLUMN ord_slip_timestamps.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slip_timestamps.ordered_at IS '受注日時';
COMMENT ON COLUMN ord_slip_timestamps.confirmed_at IS '受注確認日時';
COMMENT ON COLUMN ord_slip_timestamps.approved_at IS '出荷承認日時';
COMMENT ON COLUMN ord_slip_timestamps.completed_on IS '全商品出荷完了日';
COMMENT ON COLUMN ord_slip_timestamps.payment_confirmed_at IS '入金確認日時';
COMMENT ON COLUMN ord_slip_timestamps.paymented_on IS '入金日';
COMMENT ON COLUMN ord_slip_timestamps.canceled_at IS 'キャンセル日時';
COMMENT ON COLUMN ord_slip_timestamps.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slip_timestamps.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slip_timestamps.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slip_timestamps.created_at IS '作成日時';
COMMENT ON COLUMN ord_slip_timestamps.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slip_timestamps.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slip_timestamps.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slip_timestamps.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_slip_timestamps FOR EACH ROW EXECUTE FUNCTION set_updated_at();
