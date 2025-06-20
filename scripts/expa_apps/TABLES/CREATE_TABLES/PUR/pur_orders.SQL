-- Table: pur_orders
-- Table:pur_orders_history

DROP TABLE IF EXISTS pur_orders;
DROP TABLE IF EXISTS pur_orders_history;

CREATE TABLE IF NOT EXISTS pur_orders
(
		slip_no TEXT NOT NULL
	,	purchase_on DATE NOT NULL
	,	arrival_scheduled_on DATE NOT NULL
	,	purchase_employee_code TEXT NOT NULL
	,	purchase_pattern_id BIGINT NOT NULL
	,	purchase_charge_code TEXT NOT NULL
	,	purchase_charge_name TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	location_code TEXT NOT NULL
	,	purchase_method_div TEXT NOT NULL
	,	slip_description TEXT NOT NULL
	,	internal_description TEXT NOT NULL
	,	supplier_slip_no01 TEXT NOT NULL
	,	supplier_slip_no02 TEXT NOT NULL
	,	is_canceled BOOLEAN NOT NULL DEFAULT FALSE
	,	cancel_reason TEXT NOT NULL
	,	slip_closing_on DATE
	,	is_correction_slip BOOLEAN NOT NULL DEFAULT FALSE
	,	correct_slip_no TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_orders_pkey PRIMARY KEY (slip_no)
);

ALTER TABLE IF EXISTS pur_orders OWNER to expa_apps;

COMMENT ON TABLE pur_orders
	IS '製品発注テーブル';
COMMENT ON COLUMN pur_orders.slip_no IS '伝票番号';
COMMENT ON COLUMN pur_orders.purchase_on IS '発注日';
COMMENT ON COLUMN pur_orders.arrival_scheduled_on IS '入荷予定日';
COMMENT ON COLUMN pur_orders.purchase_employee_code IS '発注社員コード';
COMMENT ON COLUMN pur_orders.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN pur_orders.purchase_charge_code IS '発注担当者コード';
COMMENT ON COLUMN pur_orders.purchase_charge_name IS '発注担当者名';
COMMENT ON COLUMN pur_orders.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_orders.location_code IS '場所コード';
COMMENT ON COLUMN pur_orders.purchase_method_div IS '発注方法区分';
COMMENT ON COLUMN pur_orders.slip_description IS '伝票備考';
COMMENT ON COLUMN pur_orders.internal_description IS '社内備考';
COMMENT ON COLUMN pur_orders.supplier_slip_no01 IS '相手先伝票番号1';
COMMENT ON COLUMN pur_orders.supplier_slip_no02 IS '相手先伝票番号2';
COMMENT ON COLUMN pur_orders.is_canceled IS '伝票キャンセルフラグ';
COMMENT ON COLUMN pur_orders.cancel_reason IS '伝票キャンセルフラグ';
COMMENT ON COLUMN pur_orders.slip_closing_on IS '伝票締め日';
COMMENT ON COLUMN pur_orders.is_correction_slip IS '訂正伝票フラグ';
COMMENT ON COLUMN pur_orders.correct_slip_no IS '訂正元伝票番号';
COMMENT ON COLUMN pur_orders.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_orders.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_orders.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_orders.created_at IS '作成日時';
COMMENT ON COLUMN pur_orders.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_orders.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_orders.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_orders.updated_at IS '更新日時';


CREATE TABLE IF NOT EXISTS pur_orders_history
(
		id BIGSERIAL
	,	slip_no TEXT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	purchase_on DATE NOT NULL
	,	arrival_scheduled_on DATE NOT NULL
	,	purchase_employee_code TEXT NOT NULL
	,	purchase_pattern_id BIGINT NOT NULL
	,	purchase_charge_code TEXT NOT NULL
	,	purchase_charge_name TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	location_code TEXT NOT NULL
	,	purchase_method_div TEXT NOT NULL
	,	slip_description TEXT NOT NULL
	,	internal_description TEXT NOT NULL
	,	supplier_slip_no01 TEXT NOT NULL
	,	supplier_slip_no02 TEXT NOT NULL
	,	is_canceled BOOLEAN NOT NULL DEFAULT FALSE
	,	cancel_reason TEXT NOT NULL
	,	slip_closing_on DATE
	,	is_correction_slip BOOLEAN NOT NULL DEFAULT FALSE
	,	correct_slip_no TEXT NOT NULL
	,	is_slip_closing_on DATE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_orders_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_orders_history OWNER to expa_apps;

--履歴テーブル
COMMENT ON TABLE pur_orders_history
	IS '[ 履歴]製品発注テーブル';
COMMENT ON COLUMN pur_orders_history.id IS '履歴ID';	
COMMENT ON COLUMN pur_orders_history.slip_no IS '伝票番号';
COMMENT ON COLUMN pur_orders_history.history_count IS '更新回数';
COMMENT ON COLUMN pur_orders_history.purchase_on IS '発注日';
COMMENT ON COLUMN pur_orders_history.arrival_scheduled_on IS '入荷予定日';
COMMENT ON COLUMN pur_orders_history.purchase_employee_code IS '発注社員コード';
COMMENT ON COLUMN pur_orders_history.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN pur_orders_history.purchase_charge_code IS '発注担当者コード';
COMMENT ON COLUMN pur_orders_history.purchase_charge_name IS '発注担当者名';
COMMENT ON COLUMN pur_orders_history.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_orders_history.location_code IS '場所コード';
COMMENT ON COLUMN pur_orders_history.purchase_method_div IS '発注方法区分';
COMMENT ON COLUMN pur_orders_history.slip_description IS '伝票備考';
COMMENT ON COLUMN pur_orders_history.internal_description IS '社内備考';
COMMENT ON COLUMN pur_orders.supplier_slip_no01 IS '相手先伝票番号1';
COMMENT ON COLUMN pur_orders.supplier_slip_no02 IS '相手先伝票番号2';
COMMENT ON COLUMN pur_orders_history.is_canceled IS '発注取消フラグ';
COMMENT ON COLUMN pur_orders_history.cancel_reason IS '発注キャンセル理由';
COMMENT ON COLUMN pur_orders_history.slip_closing_on IS '伝票締め日';
COMMENT ON COLUMN pur_orders_history.is_correction_slip IS '訂正伝票フラグ';
COMMENT ON COLUMN pur_orders_history.correct_slip_no IS '訂正元伝票番号';
COMMENT ON COLUMN pur_orders_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_orders_history.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_orders_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_orders_history.created_at IS '作成日時';
COMMENT ON COLUMN pur_orders_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_orders_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_orders_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_orders_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_orders FOR EACH ROW EXECUTE FUNCTION set_updated_at();

--テーブル更新トリガーー
CREATE TRIGGER update_pur_orders_trigger AFTER INSERT OR UPDATE ON pur_orders FOR EACH ROW EXECUTE FUNCTION insert_pur_orders_history();