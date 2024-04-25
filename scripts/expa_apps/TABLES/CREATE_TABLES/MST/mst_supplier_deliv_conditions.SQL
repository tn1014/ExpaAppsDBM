-- Table: mst_supplier_deliv_conditions;
-- Table: mst_supplier_deliv_conditions_history;

DROP TABLE IF EXISTS mst_supplier_deliv_conditions;
DROP TABLE IF EXISTS mst_supplier_deliv_conditions_history;

CREATE TABLE IF NOT EXISTS mst_supplier_deliv_conditions
(
		id BIGSERIAL
	,	supplier_code TEXT NOT NULL
	,	start_on DATE NOT NULL
	,	case_rules NUMERIC
	,	amount_rules NUMERIC
	,	postage_price NUMERIC
	,	deliv_lead_time SMALLINT NOT NULL
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
	,	CONSTRAINT mst_supplier_deliv_conditions_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_supplier_deliv_conditions OWNER to expa_apps;

COMMENT ON TABLE mst_supplier_deliv_conditions
	IS '仕入先倉入れ条件マスタ';
COMMENT ON COLUMN mst_supplier_deliv_conditions.id IS '倉入れ条件ID';
COMMENT ON COLUMN mst_supplier_deliv_conditions.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions.start_on IS '適用日';
COMMENT ON COLUMN mst_supplier_deliv_conditions.case_rules IS '倉入れ条件(ケース数)';
COMMENT ON COLUMN mst_supplier_deliv_conditions.amount_rules IS '倉入れ条件(発注金額)';
COMMENT ON COLUMN mst_supplier_deliv_conditions.postage_price IS '運賃';
COMMENT ON COLUMN mst_supplier_deliv_conditions.deliv_lead_time IS 'リードタイム';
COMMENT ON COLUMN mst_supplier_deliv_conditions.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_supplier_deliv_conditions.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_supplier_deliv_conditions.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions.created_at IS '作成日時';
COMMENT ON COLUMN mst_supplier_deliv_conditions.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_supplier_deliv_conditions.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_supplier_deliv_conditions.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions.updated_at IS '更新日時';
COMMENT ON COLUMN mst_supplier_deliv_conditions.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_supplier_deliv_conditions.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_supplier_deliv_conditions.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_supplier_deliv_conditions.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_supplier_deliv_conditions.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions.deleted_at IS '削除日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS mst_supplier_deliv_conditions_history
(
		id BIGSERIAL
	,	supplier_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	start_on DATE NOT NULL
	,	case_rules NUMERIC
	,	amount_rules NUMERIC
	,	postage_price NUMERIC
	,	deliv_lead_time SMALLINT NOT NULL
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
	,	CONSTRAINT mst_supplier_deliv_conditions_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_supplier_deliv_conditions_history OWNER to expa_apps;

COMMENT ON TABLE mst_supplier_deliv_conditions_history
	IS '[履歴]仕入先倉入れ条件マスタ';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.id IS '倉入れ条件ID';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.history_count IS '更新回数';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.start_on IS '適用日';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.case_rules IS '倉入れ条件(ケース数)';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.amount_rules IS '倉入れ条件(発注金額)';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.postage_price IS '運賃';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.deliv_lead_time IS 'リードタイム';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.created_at IS '作成日時';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.updated_at IS '更新日時';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_supplier_deliv_conditions_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_supplier_deliv_conditions FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--履歴テーブル更新トリガー
CREATE TRIGGER update_mst_supplier_deliv_conditions_trigger AFTER INSERT OR UPDATE ON mst_supplier_deliv_conditions FOR EACH ROW EXECUTE FUNCTION insert_mst_supplier_deliv_conditions_history();

