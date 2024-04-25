-- Table: div_management_items

DROP TABLE IF EXISTS div_management_items;

CREATE TABLE IF NOT EXISTS div_management_items
(
		id BIGSERIAL
	,	management_division_code TEXT NOT NULL
	,	management_item_code TEXT NOT NULL
	,	management_item_name TEXT NOT NULL
	,	management_item_value01 TEXT NOT NULL
	,	management_item_value02 TEXT NOT NULL
	,	management_item_value03 TEXT NOT NULL
	,	management_item_value04 TEXT NOT NULL
	,	management_item_value05 TEXT NOT NULL
	,	management_item_value06 TEXT NOT NULL
	,	management_item_value07 TEXT NOT NULL
	,	management_item_value08 TEXT NOT NULL
	,	management_item_value09 TEXT NOT NULL
	,	management_item_value10 TEXT NOT NULL
	,	management_item_num01 NUMERIC
	,	management_item_num02 NUMERIC
	,	management_item_num03 NUMERIC
	,	management_item_num04 NUMERIC
	,	management_item_num05 NUMERIC
	,	management_item_num06 NUMERIC
	,	management_item_num07 NUMERIC
	,	management_item_num08 NUMERIC
	,	management_item_num09 NUMERIC
	,	management_item_num10 NUMERIC
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
	,	CONSTRAINT div_management_items_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS div_management_items OWNER to expa_apps;

COMMENT ON TABLE div_management_items
	IS '業務用管理区分設定';
COMMENT ON COLUMN div_management_items.id IS '管理区分ID';
COMMENT ON COLUMN div_management_items.management_division_code IS '業務管理区分コード';
COMMENT ON COLUMN div_management_items.management_item_code IS '管理項目コード';
COMMENT ON COLUMN div_management_items.management_item_name IS '管理項目名';
COMMENT ON COLUMN div_management_items.management_item_value01 IS '管理項目文字列値01';
COMMENT ON COLUMN div_management_items.management_item_value02 IS '管理項目文字列値02';
COMMENT ON COLUMN div_management_items.management_item_value03 IS '管理項目文字列値03';
COMMENT ON COLUMN div_management_items.management_item_value04 IS '管理項目文字列値04';
COMMENT ON COLUMN div_management_items.management_item_value05 IS '管理項目文字列値05';
COMMENT ON COLUMN div_management_items.management_item_value06 IS '管理項目文字列値06';
COMMENT ON COLUMN div_management_items.management_item_value07 IS '管理項目文字列値07';
COMMENT ON COLUMN div_management_items.management_item_value08 IS '管理項目文字列値08';
COMMENT ON COLUMN div_management_items.management_item_value09 IS '管理項目文字列値09';
COMMENT ON COLUMN div_management_items.management_item_value10 IS '管理項目文字列値10';
COMMENT ON COLUMN div_management_items.management_item_num01 IS '管理項目数値01';
COMMENT ON COLUMN div_management_items.management_item_num02 IS '管理項目数値02';
COMMENT ON COLUMN div_management_items.management_item_num03 IS '管理項目数値03';
COMMENT ON COLUMN div_management_items.management_item_num04 IS '管理項目数値04';
COMMENT ON COLUMN div_management_items.management_item_num05 IS '管理項目数値05';
COMMENT ON COLUMN div_management_items.management_item_num06 IS '管理項目数値06';
COMMENT ON COLUMN div_management_items.management_item_num07 IS '管理項目数値07';
COMMENT ON COLUMN div_management_items.management_item_num08 IS '管理項目数値08';
COMMENT ON COLUMN div_management_items.management_item_num09 IS '管理項目数値09';
COMMENT ON COLUMN div_management_items.management_item_num10 IS '管理項目数値10';
COMMENT ON COLUMN div_management_items.rank IS '表示順';
COMMENT ON COLUMN div_management_items.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN div_management_items.created_terminal IS '作成端末';
COMMENT ON COLUMN div_management_items.created_function_code IS '作成機能コード';
COMMENT ON COLUMN div_management_items.created_at IS '作成日時';
COMMENT ON COLUMN div_management_items.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN div_management_items.updated_terminal IS '更新端末';
COMMENT ON COLUMN div_management_items.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN div_management_items.updated_at IS '更新日時';
COMMENT ON COLUMN div_management_items.is_deleted IS '削除区分';
COMMENT ON COLUMN div_management_items.deleted_description IS '削除備考';
COMMENT ON COLUMN div_management_items.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN div_management_items.deleted_terminal IS '削除端末';
COMMENT ON COLUMN div_management_items.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN div_management_items.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON div_management_items FOR EACH ROW EXECUTE FUNCTION set_updated_at();