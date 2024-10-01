-- Table: ord_slip_payment_states
-- Table: ord_slip_payment_states_history

DROP TABLE IF EXISTS ord_slip_payment_states;
DROP TABLE IF EXISTS ord_slip_payment_states_history;

CREATE TABLE IF NOT EXISTS ord_slip_payment_states
(
		order_id BIGINT
	,	payment_state_code TEXT NOT NULL
	,	payment_state TEXT NOT NULL
	,	charge_employee_code TEXT NOT NULL
	,	charge_employee_name TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_slip_payment_states_pkey PRIMARY KEY (order_id)
);

ALTER TABLE IF EXISTS ord_slip_payment_states OWNER to expa_apps;

COMMENT ON TABLE ord_slip_payment_states
	IS '受注伝票入金状況テーブル';
COMMENT ON COLUMN ord_slip_payment_states.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slip_payment_states.payment_state_code IS '入金状況コード';
COMMENT ON COLUMN ord_slip_payment_states.payment_state IS '入金状況';
COMMENT ON COLUMN ord_slip_payment_states.charge_employee_code IS '担当社員コード';
COMMENT ON COLUMN ord_slip_payment_states.charge_employee_name IS '担当社員名';
COMMENT ON COLUMN ord_slip_payment_states.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slip_payment_states.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slip_payment_states.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slip_payment_states.created_at IS '作成日時';
COMMENT ON COLUMN ord_slip_payment_states.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slip_payment_states.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slip_payment_states.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slip_payment_states.updated_at IS '更新日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_slip_payment_states_history
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	payment_state_code TEXT NOT NULL
	,	payment_state TEXT NOT NULL
	,	charge_employee_code TEXT NOT NULL
	,	charge_employee_name TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_slip_payment_states_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_slip_payment_states_history OWNER to expa_apps;

COMMENT ON TABLE ord_slip_payment_states_history
	IS '[履歴]受注伝票入金状況テーブル';
COMMENT ON COLUMN ord_slip_payment_states_history.id IS '履歴ID';
COMMENT ON COLUMN ord_slip_payment_states_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slip_payment_states_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_slip_payment_states_history.payment_state_code IS '入金状況コード';
COMMENT ON COLUMN ord_slip_payment_states_history.payment_state IS '入金状況';
COMMENT ON COLUMN ord_slip_payment_states_history.charge_employee_code IS '担当社員コード';
COMMENT ON COLUMN ord_slip_payment_states_history.charge_employee_name IS '担当社員名';
COMMENT ON COLUMN ord_slip_payment_states_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slip_payment_states_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slip_payment_states_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slip_payment_states_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_slip_payment_states_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slip_payment_states_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slip_payment_states_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slip_payment_states_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_slip_payment_states FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_slip_payment_states_trigger AFTER INSERT OR UPDATE ON ord_slip_payment_states FOR EACH ROW EXECUTE FUNCTION insert_ord_slip_payment_states_history();