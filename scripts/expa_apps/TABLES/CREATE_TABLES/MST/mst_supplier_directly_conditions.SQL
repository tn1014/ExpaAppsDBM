-- Table: mst_supplier_directly_conditions;
-- Table: mst_supplier_directly_conditions_history;

DROP TABLE IF EXISTS mst_supplier_directly_conditions;
DROP TABLE IF EXISTS mst_supplier_directly_conditions_history;

CREATE TABLE IF NOT EXISTS mst_supplier_directly_conditions
(
		id BIGSERIAL
	,	supplier_code TEXT NOT NULL
	,	start_on DATE NOT NULL
	,	enable_type TEXT NOT NULL
	,	case_rules NUMERIC
	,	amount_rules NUMERIC
	,	postage_price NUMERIC
	,	deliv_company_code01 TEXT NOT NULL
	,	deliv_company_code02 TEXT NOT NULL
	,	deliv_company_code03 TEXT NOT NULL
	,	deliv_company_code04 TEXT NOT NULL
	,	deliv_company_code05 TEXT NOT NULL
	,	description TEXT NOT NULL
	,	is_required_customer_voucher BOOLEAN NOT NULL
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
	,	CONSTRAINT mst_supplier_directly_conditions_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_supplier_directly_conditions OWNER to expa_apps;

COMMENT ON TABLE mst_supplier_directly_conditions
	IS '仕入先直送条件マスタ';
COMMENT ON COLUMN mst_supplier_directly_conditions.id IS '直送条件ID';
COMMENT ON COLUMN mst_supplier_directly_conditions.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mst_supplier_directly_conditions.start_on IS '適用日';
COMMENT ON COLUMN mst_supplier_directly_conditions.enable_type IS '直送可否';
COMMENT ON COLUMN mst_supplier_directly_conditions.case_rules IS '直送条件(ケース数)';
COMMENT ON COLUMN mst_supplier_directly_conditions.amount_rules IS '直送条件(発注金額)';
COMMENT ON COLUMN mst_supplier_directly_conditions.postage_price IS '直送運賃';
COMMENT ON COLUMN mst_supplier_directly_conditions.deliv_company_code01 IS '運送業者コード1';
COMMENT ON COLUMN mst_supplier_directly_conditions.deliv_company_code02 IS '運送業者コード2';
COMMENT ON COLUMN mst_supplier_directly_conditions.deliv_company_code03 IS '運送業者コード3';
COMMENT ON COLUMN mst_supplier_directly_conditions.deliv_company_code04 IS '運送業者コード4';
COMMENT ON COLUMN mst_supplier_directly_conditions.deliv_company_code05 IS '運送業者コード5';
COMMENT ON COLUMN mst_supplier_directly_conditions.description IS '直送発注備考';
COMMENT ON COLUMN mst_supplier_directly_conditions.is_required_customer_voucher IS '新規顧客伝票発行要否';
COMMENT ON COLUMN mst_supplier_directly_conditions.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_supplier_directly_conditions.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_supplier_directly_conditions.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_supplier_directly_conditions.created_at IS '作成日時';
COMMENT ON COLUMN mst_supplier_directly_conditions.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_supplier_directly_conditions.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_supplier_directly_conditions.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_supplier_directly_conditions.updated_at IS '更新日時';
COMMENT ON COLUMN mst_supplier_directly_conditions.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_supplier_directly_conditions.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_supplier_directly_conditions.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_supplier_directly_conditions.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_supplier_directly_conditions.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_supplier_directly_conditions.deleted_at IS '削除日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS mst_supplier_directly_conditions_history
(
		id BIGSERIAL
	,	supplier_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	start_on DATE NOT NULL
	,	enable_type TEXT NOT NULL
	,	case_rules NUMERIC
	,	amount_rules NUMERIC
	,	postage_price NUMERIC
	,	deliv_company_code01 TEXT NOT NULL
	,	deliv_company_code02 TEXT NOT NULL
	,	deliv_company_code03 TEXT NOT NULL
	,	deliv_company_code04 TEXT NOT NULL
	,	deliv_company_code05 TEXT NOT NULL
	,	description TEXT NOT NULL
	,	is_required_customer_voucher BOOLEAN NOT NULL
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
	,	CONSTRAINT mst_supplier_directly_conditions_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_supplier_directly_conditions_history OWNER to expa_apps;

COMMENT ON TABLE mst_supplier_directly_conditions_history
	IS '[履歴]仕入先直送条件マスタ';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.id IS '直送条件ID';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.history_count IS '更新回数';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.start_on IS '適用日';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.enable_type IS '直送可否';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.case_rules IS '直送条件(ケース数)';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.amount_rules IS '直送条件(発注金額)';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.postage_price IS '直送運賃';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deliv_company_code01 IS '運送業者コード1';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deliv_company_code02 IS '運送業者コード2';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deliv_company_code03 IS '運送業者コード3';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deliv_company_code04 IS '運送業者コード4';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deliv_company_code05 IS '運送業者コード5';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.description IS '直送発注備考';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.is_required_customer_voucher IS '新規顧客伝票発行要否';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.created_at IS '作成日時';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.updated_at IS '更新日時';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_supplier_directly_conditions_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_supplier_directly_conditions FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--履歴テーブル更新トリガー
CREATE TRIGGER update_mst_supplier_directly_conditions_trigger AFTER INSERT OR UPDATE ON mst_supplier_directly_conditions FOR EACH ROW EXECUTE FUNCTION insert_mst_supplier_directly_conditions_history();

