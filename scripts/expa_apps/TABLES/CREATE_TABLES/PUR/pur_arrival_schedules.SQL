-- Table: pur_arrival_schedules
-- Table: pur_arrival_schedues_history

DROP TABLE IF EXISTS pur_arrival_schedules;
DROP TABLE IF EXISTS pur_arrival_schedules_history;

CREATE TABLE IF NOT EXISTS pur_arrival_schedules
(
		id BIGSERIAL
	,	purchase_slip_no TEXT NOT NULL
	,	detail_no SMALLINT NOT NULL
	,	stock_transaction_temporary_id BIGINT NOT NULL
	,	purchase_pattern_id BIGINT NOT NULL
	,	purchase_method_div TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	location_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	arrival_scheduled_on DATE NOT NULL
	,	arrival_scheduled_quantity NUMERIC NOT NULL DEFAULT 0
	,	arrival_unit_code TEXT NOT NULL
	,	arrival_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	arrival_unit_price NUMERIC NOT NULL DEFAULT 0
	,	arrived_quantity NUMERIC NOT NULL DEFAULT 0
	,	is_arrived BOOLEAN NOT NULL DEFAULT FALSE
	,	is_canceled BOOLEAN NOT NULL DEFAULT FALSE
	,	cancel_reason TEXT NOT NULL
	,	arrival_description TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_arrival_schedules_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_arrival_schedules OWNER to expa_apps;

COMMENT ON TABLE pur_arrival_schedules
	IS '製品入荷予定テーブル';
COMMENT ON COLUMN pur_arrival_schedules.id IS '入荷予定ID';
COMMENT ON COLUMN pur_arrival_schedules.purchase_slip_no IS '発注伝票番号';
COMMENT ON COLUMN pur_arrival_schedules.detail_no IS '発注明細番号';
COMMENT ON COLUMN pur_arrival_schedules.stock_transaction_temporary_id IS '仮受払ID';
COMMENT ON COLUMN pur_arrival_schedules.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN pur_arrival_schedules.purchase_method_div IS '発注方法区分';
COMMENT ON COLUMN pur_arrival_schedules.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_arrival_schedules.location_code IS '場所コード';
COMMENT ON COLUMN pur_arrival_schedules.product_code IS '製品コード';
COMMENT ON COLUMN pur_arrival_schedules.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN pur_arrival_schedules.arrival_scheduled_on IS '入荷予定日';
COMMENT ON COLUMN pur_arrival_schedules.arrival_scheduled_quantity IS '入荷予定数';
COMMENT ON COLUMN pur_arrival_schedules.arrival_unit_code IS '入荷単位コード';
COMMENT ON COLUMN pur_arrival_schedules.arrival_unit_quantity IS '入荷単位数';
COMMENT ON COLUMN pur_arrival_schedules.arrival_unit_price IS '入荷単価';
COMMENT ON COLUMN pur_arrival_schedules.arrived_quantity IS '入荷済数';
COMMENT ON COLUMN pur_arrival_schedules.is_arrived IS '入荷完了フラグ';
COMMENT ON COLUMN pur_arrival_schedules.is_canceled IS '発注取消フラグ';
COMMENT ON COLUMN pur_arrival_schedules.cancel_reason IS '発注取消フラグ';
COMMENT ON COLUMN pur_arrival_schedules.arrival_description IS '入荷予定備考';
COMMENT ON COLUMN pur_arrival_schedules.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_arrival_schedules.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_arrival_schedules.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_arrival_schedules.created_at IS '作成日時';
COMMENT ON COLUMN pur_arrival_schedules.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_arrival_schedules.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_arrival_schedules.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_arrival_schedules.updated_at IS '更新日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS pur_arrival_schedules_history
(
		id BIGSERIAL
	,	arrival_schedule_id BIGINT
	,	purchase_slip_no TEXT NOT NULL
	,	detail_no SMALLINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	stock_transaction_temporary_id BIGINT NOT NULL
	,	purchase_pattern_id BIGINT NOT NULL
	,	purchase_method_div TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	location_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	arrival_scheduled_on DATE NOT NULL
	,	arrival_scheduled_quantity NUMERIC NOT NULL DEFAULT 0
	,	arrival_unit_code TEXT NOT NULL
	,	arrival_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	arrival_unit_price NUMERIC NOT NULL DEFAULT 0
	,	arrived_quantity NUMERIC NOT NULL DEFAULT 0
	,	is_arrived BOOLEAN NOT NULL DEFAULT FALSE
	,	is_canceled BOOLEAN NOT NULL DEFAULT FALSE
	,	cancel_reason TEXT NOT NULL
	,	arrival_description TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT pur_arrival_schedules_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_arrival_schedules_history OWNER to expa_apps;

COMMENT ON TABLE pur_arrival_schedules_history
	IS '[履歴]製品入荷予定テーブル';
COMMENT ON COLUMN pur_arrival_schedules_history.id IS '履歴ID';
COMMENT ON COLUMN pur_arrival_schedules_history.arrival_schedule_id IS '入荷予定ID';
COMMENT ON COLUMN pur_arrival_schedules_history.purchase_slip_no IS '発注伝票番号';
COMMENT ON COLUMN pur_arrival_schedules_history.detail_no IS '発注明細番号';
COMMENT ON COLUMN pur_arrival_schedules_history.history_count IS '更新回数';
COMMENT ON COLUMN pur_arrival_schedules_history.stock_transaction_temporary_id IS '仮受払ID';
COMMENT ON COLUMN pur_arrival_schedules_history.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN pur_arrival_schedules_history.purchase_method_div IS '発注方法区分';
COMMENT ON COLUMN pur_arrival_schedules_history.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_arrival_schedules_history.location_code IS '場所コード';
COMMENT ON COLUMN pur_arrival_schedules_history.product_code IS '製品コード';
COMMENT ON COLUMN pur_arrival_schedules_history.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN pur_arrival_schedules_history.arrival_scheduled_on IS '入荷予定日';
COMMENT ON COLUMN pur_arrival_schedules_history.arrival_scheduled_quantity IS '入荷予定数';
COMMENT ON COLUMN pur_arrival_schedules_history.arrival_unit_code IS '入荷単位コード';
COMMENT ON COLUMN pur_arrival_schedules_history.arrival_unit_quantity IS '入荷単位数';
COMMENT ON COLUMN pur_arrival_schedules_history.arrival_unit_price IS '入荷単価';
COMMENT ON COLUMN pur_arrival_schedules_history.arrived_quantity IS '入荷済数';
COMMENT ON COLUMN pur_arrival_schedules_history.is_arrived IS '入荷完了フラグ';
COMMENT ON COLUMN pur_arrival_schedules_history.is_canceled IS '発注取消フラグ';
COMMENT ON COLUMN pur_arrival_schedules_history.cancel_reason IS '発注取消フラグ';
COMMENT ON COLUMN pur_arrival_schedules_history.arrival_description IS '入荷予定備考';
COMMENT ON COLUMN pur_arrival_schedules_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_arrival_schedules_history.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_arrival_schedules_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_arrival_schedules_history.created_at IS '作成日時';
COMMENT ON COLUMN pur_arrival_schedules_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_arrival_schedules_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_arrival_schedules_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_arrival_schedules_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_arrival_schedules FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_pur_arrival_schedules_trigger AFTER INSERT OR UPDATE ON pur_arrival_schedules FOR EACH ROW EXECUTE FUNCTION insert_pur_arrival_schedules_history();