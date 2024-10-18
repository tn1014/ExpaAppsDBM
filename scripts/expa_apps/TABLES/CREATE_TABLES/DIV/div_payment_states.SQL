-- Table: div_payment_states

DROP TABLE IF EXISTS div_payment_states;

CREATE TABLE IF NOT EXISTS div_payment_states
(
		id BIGSERIAL
	,	payment_state_code TEXT NOT NULL
	,	payment_state TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	is_paid BOOLEAN NOT NULL DEFAULT FALSE
	,	is_completed BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT div_payment_states_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS div_payment_states OWNER to expa_apps;

COMMENT ON TABLE div_payment_states
	IS '出荷状態設定';
COMMENT ON COLUMN div_payment_states.id IS '入金状態ID';
COMMENT ON COLUMN div_payment_states.payment_state_code IS '入金状態コード';
COMMENT ON COLUMN div_payment_states.payment_state IS '入金状態';
COMMENT ON COLUMN div_payment_states.short_name IS '略称';
COMMENT ON COLUMN div_payment_states.is_paid IS '入金済みフラグ';
COMMENT ON COLUMN div_payment_states.is_completed IS '入金完了フラグ';
COMMENT ON COLUMN div_payment_states.is_canceled IS '受注キャンセル済みフラグ';
COMMENT ON COLUMN div_payment_states.is_returned IS '返金済みフラグ';
COMMENT ON COLUMN div_payment_states.background_color_code IS '背景色コード';
COMMENT ON COLUMN div_payment_states.rank IS '表示順';
COMMENT ON COLUMN div_payment_states.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN div_payment_states.created_terminal IS '作成端末';
COMMENT ON COLUMN div_payment_states.created_function_code IS '作成機能コード';
COMMENT ON COLUMN div_payment_states.created_at IS '作成日時';
COMMENT ON COLUMN div_payment_states.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN div_payment_states.updated_terminal IS '更新端末';
COMMENT ON COLUMN div_payment_states.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN div_payment_states.updated_at IS '更新日時';
COMMENT ON COLUMN div_payment_states.is_deleted IS '削除区分';
COMMENT ON COLUMN div_payment_states.deleted_description IS '削除備考';
COMMENT ON COLUMN div_payment_states.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN div_payment_states.deleted_terminal IS '削除端末';
COMMENT ON COLUMN div_payment_states.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN div_payment_states.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON div_payment_states FOR EACH ROW EXECUTE FUNCTION set_updated_at();