-- Table: mst_purchase_pattern_carry_rules;
-- Table: mst_purchase_pattern_carry_rules_history;

DROP TABLE IF EXISTS mst_purchase_pattern_carry_rules;
DROP TABLE IF EXISTS mst_purchase_pattern_carry_rules_history;

CREATE TABLE IF NOT EXISTS mst_purchase_pattern_carry_rules
(
		id BIGSERIAL
	,	purchase_pattern_id BIGINT NOT NULL
	,	start_on DATE NOT NULL
	,	stock_location_code TEXT NOT NULL
	,	carry_location_code01 TEXT NOT NULL
	,	carry_location_code02 TEXT NOT NULL
	,	carry_location_code03 TEXT NOT NULL
	,	carry_location_code04 TEXT NOT NULL
	,	carry_location_code05 TEXT NOT NULL
	,	deliv_weekdays TEXT NOT NULL
	,	carry_lead_time INTEGER NOT NULL
	,	carry_description01 TEXT NOT NULL
	,	carry_description02 TEXT NOT NULL
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
	,	CONSTRAINT mst_purchase_pattern_carry_rules_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_purchase_pattern_carry_rules OWNER to expa_apps;

COMMENT ON TABLE mst_purchase_pattern_carry_rules
	IS '発注パターン移動規則マスタ';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.id IS '発注パターン移動規則ID';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.start_on IS '適用日';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.stock_location_code IS '在庫場所コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_location_code01 IS '横持ち経由場所コード1';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_location_code02 IS '横持ち経由場所コード2';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_location_code03 IS '横持ち経由場所コード3';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_location_code04 IS '横持ち経由場所コード4';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_location_code05 IS '横持ち経由場所コード5';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.deliv_weekdays IS '納品曜日';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_lead_time IS '移動リードタイム';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_description01 IS '移動備考1';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.carry_description02 IS '移動備考2';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.created_at IS '作成日時';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.updated_at IS '更新日時';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules.deleted_at IS '削除日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS mst_purchase_pattern_carry_rules_history
(
		id BIGSERIAL
	,	purchase_pattern_carry_rule_id BIGINT NOT NULL
	,	purchase_pattern_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL
	,	start_on DATE NOT NULL
	,	stock_location_code TEXT NOT NULL
	,	carry_location_code01 TEXT NOT NULL
	,	carry_location_code02 TEXT NOT NULL
	,	carry_location_code03 TEXT NOT NULL
	,	carry_location_code04 TEXT NOT NULL
	,	carry_location_code05 TEXT NOT NULL
	,	deliv_weekdays TEXT NOT NULL
	,	carry_lead_time INTEGER NOT NULL
	,	carry_description01 TEXT NOT NULL
	,	carry_description02 TEXT NOT NULL
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
	,	CONSTRAINT mst_purchase_pattern_carry_rules_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_purchase_pattern_carry_rules_history OWNER to expa_apps;

COMMENT ON TABLE mst_purchase_pattern_carry_rules_history
	IS '[履歴]発注パターンマスタ';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.id IS '履歴ID';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.purchase_pattern_carry_rule_id IS '発注パターン移動規則ID';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.history_count IS '更新回数';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.start_on IS '適用日';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.stock_location_code IS '在庫場所コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_location_code01 IS '横持ち経由場所コード1';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_location_code02 IS '横持ち経由場所コード2';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_location_code03 IS '横持ち経由場所コード3';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_location_code04 IS '横持ち経由場所コード4';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_location_code05 IS '横持ち経由場所コード5';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.deliv_weekdays IS '納品曜日';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_lead_time IS '移動リードタイム';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_description01 IS '移動備考1';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.carry_description02 IS '移動備考2';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.created_at IS '作成日時';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.updated_at IS '更新日時';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_purchase_pattern_carry_rules_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_purchase_pattern_carry_rules FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_mst_purchase_pattern_carry_rules_trigger AFTER INSERT OR UPDATE ON mst_purchase_pattern_carry_rules FOR EACH ROW EXECUTE FUNCTION insert_mst_purchase_pattern_carry_rules_history();