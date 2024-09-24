-- Table: pur_arrival_results
-- Table: pur_arrival_results_history

DROP TABLE IF EXISTS pur_arrival_results;
DROP TABLE IF EXISTS pur_arrival_results_history;

CREATE TABLE IF NOT EXISTS pur_arrival_results
(
		id BIGSERIAL
	,	arrival_schedule_id BIGINT NOT NULL
	,	stock_transaction_id BIGINT NOT NULL
	,	arrived_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	arrived_unit_code TEXT NOT NULL
	,	arrived_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	arrived_quantity NUMERIC NOT NULL DEFAULT 0
	,	arrived_description TEXT NOT NULL
	,	arrived_employee_code TEXT NOT NULL
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
	,	CONSTRAINT pur_arrival_results_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_arrival_results OWNER to expa_apps;

COMMENT ON TABLE pur_arrival_results
	IS '製品入荷実績テーブル';
COMMENT ON COLUMN pur_arrival_results.id IS '入荷実績ID';
COMMENT ON COLUMN pur_arrival_results.arrival_schedule_id IS '入荷予定ID';
COMMENT ON COLUMN pur_arrival_results.stock_transaction_id IS '受払ID';
COMMENT ON COLUMN pur_arrival_results.arrived_at IS '入庫日時';
COMMENT ON COLUMN pur_arrival_results.arrived_unit_code IS '入庫単位コード';
COMMENT ON COLUMN pur_arrival_results.arrived_unit_quantity IS '入庫単位数';
COMMENT ON COLUMN pur_arrival_results.arrived_quantity IS '入庫数';
COMMENT ON COLUMN pur_arrival_results.arrived_description IS '入庫備考';
COMMENT ON COLUMN pur_arrival_results.arrived_employee_code IS '入庫担当社員コード';
COMMENT ON COLUMN pur_arrival_results.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_arrival_results.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_arrival_results.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_arrival_results.created_at IS '作成日時';
COMMENT ON COLUMN pur_arrival_results.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_arrival_results.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_arrival_results.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_arrival_results.updated_at IS '更新日時';
COMMENT ON COLUMN pur_arrival_results.is_deleted IS '削除区分';
COMMENT ON COLUMN pur_arrival_results.deleted_description IS '削除備考';
COMMENT ON COLUMN pur_arrival_results.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN pur_arrival_results.deleted_terminal IS '削除端末';
COMMENT ON COLUMN pur_arrival_results.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN pur_arrival_results.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS pur_arrival_results_history
(
		id BIGSERIAL
	,	arrival_result_id BIGINT
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	arrival_schedule_id BIGINT
	,	stock_transaction_id BIGINT
	,	arrived_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	arrived_unit_code TEXT
	,	arrived_unit_quantity NUMERIC
	,	arrived_quantity NUMERIC
	,	arrived_description TEXT
	,	arrived_employee_code TEXT
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
	,	CONSTRAINT pur_arrival_results_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_arrival_results_history OWNER to expa_apps;

COMMENT ON TABLE pur_arrival_results_history
	IS '[ 履歴]製品入荷実績テーブル';
COMMENT ON COLUMN pur_arrival_results_history.id IS '履歴ID';
COMMENT ON COLUMN pur_arrival_results_history.arrival_result_id IS '入荷実績ID';
COMMENT ON COLUMN pur_arrival_results_history.history_count IS '更新回数';
COMMENT ON COLUMN pur_arrival_results_history.arrival_schedule_id IS '入荷予定ID';
COMMENT ON COLUMN pur_arrival_results_history.stock_transaction_id IS '受払ID';
COMMENT ON COLUMN pur_arrival_results_history.arrived_at IS '入庫日時';
COMMENT ON COLUMN pur_arrival_results_history.arrived_unit_code IS '入庫単位コード';
COMMENT ON COLUMN pur_arrival_results_history.arrived_unit_quantity IS '入庫単位数';
COMMENT ON COLUMN pur_arrival_results_history.arrived_quantity IS '入庫数';
COMMENT ON COLUMN pur_arrival_results_history.arrived_description IS '入庫備考';
COMMENT ON COLUMN pur_arrival_results_history.arrived_employee_code IS '入庫担当社員コード';
COMMENT ON COLUMN pur_arrival_results_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_arrival_results_history.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_arrival_results_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_arrival_results_history.created_at IS '作成日時';
COMMENT ON COLUMN pur_arrival_results_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_arrival_results_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_arrival_results_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_arrival_results_history.updated_at IS '更新日時';
COMMENT ON COLUMN pur_arrival_results_history.is_deleted IS '削除区分';
COMMENT ON COLUMN pur_arrival_results_history.deleted_description IS '削除備考';
COMMENT ON COLUMN pur_arrival_results_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN pur_arrival_results_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN pur_arrival_results_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN pur_arrival_results_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_arrival_results FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_pur_arrival_results_trigger AFTER INSERT OR UPDATE ON pur_arrival_results FOR EACH ROW EXECUTE FUNCTION insert_pur_arrival_results_history();