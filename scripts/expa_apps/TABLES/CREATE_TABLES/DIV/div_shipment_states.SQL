-- Table: div_shipment_states

DROP TABLE IF EXISTS div_shipment_states;

CREATE TABLE IF NOT EXISTS div_shipment_states
(
		id BIGSERIAL
	,	shipment_state_code TEXT NOT NULL
	,	shipment_state TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	is_shipped BOOLEAN NOT NULL DEFAULT FALSE
	,	is_shippable BOOLEAN NOT NULL DEFAULT FALSE
	,	is_wait_for_customer_reply BOOLEAN NOT NULL DEFAULT FALSE
	,	is_canceled BOOLEAN NOT NULL DEFAULT FALSE
	,	is_returned BOOLEAN NOT NULL DEFAULT FALSE
	,	background_color_code TEXT NOT NULL
	,	rank INT
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	is_deleted BOOLEAN NOT NULL DEFAULT FALSE
	,	deleted_user_code TEXT
	,	deleted_terminal TEXT
	,	deleted_function_code TEXT
	,	deleted_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	deleted_description TEXT
	,	CONSTRAINT div_shipment_states_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS div_shipment_states OWNER to expa_apps;

COMMENT ON TABLE div_shipment_states
	IS '出荷状態設定';
COMMENT ON COLUMN div_shipment_states.id IS '出荷状態ID';
COMMENT ON COLUMN div_shipment_states.shipment_state_code IS '出荷状態コード';
COMMENT ON COLUMN div_shipment_states.shipment_state IS '出荷状態';
COMMENT ON COLUMN div_shipment_states.short_name IS '略称';
COMMENT ON COLUMN div_shipment_states.is_shipped IS '出荷済みフラグ';
COMMENT ON COLUMN div_shipment_states.is_shippable IS '出荷可能フラグ';
COMMENT ON COLUMN div_shipment_states.is_wait_for_customer_reply IS '購入者返信待ちフラグ';
COMMENT ON COLUMN div_shipment_states.is_canceled IS '受注キャンセル済みフラグ';
COMMENT ON COLUMN div_shipment_states.is_returned IS '返品済みフラグ';
COMMENT ON COLUMN div_shipment_states.background_color_code IS '背景色コード';
COMMENT ON COLUMN div_shipment_states.rank IS '表示順';
COMMENT ON COLUMN div_shipment_states.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN div_shipment_states.created_terminal IS '作成端末';
COMMENT ON COLUMN div_shipment_states.created_function_code IS '作成機能コード';
COMMENT ON COLUMN div_shipment_states.created_at IS '作成日時';
COMMENT ON COLUMN div_shipment_states.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN div_shipment_states.updated_terminal IS '更新端末';
COMMENT ON COLUMN div_shipment_states.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN div_shipment_states.updated_at IS '更新日時';
COMMENT ON COLUMN div_shipment_states.is_deleted IS '削除区分';
COMMENT ON COLUMN div_shipment_states.deleted_description IS '削除備考';
COMMENT ON COLUMN div_shipment_states.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN div_shipment_states.deleted_terminal IS '削除端末';
COMMENT ON COLUMN div_shipment_states.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN div_shipment_states.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON div_shipment_states FOR EACH ROW EXECUTE FUNCTION set_updated_at();