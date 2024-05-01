-- Table: prd_product_numerical_specs;
-- Table: prd_product_numerical_specs_history;

DROP TABLE IF EXISTS prd_product_numerical_specs;
DROP TABLE IF EXISTS prd_product_numerical_specs_history;

CREATE TABLE IF NOT EXISTS prd_product_numerical_specs
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	spec_seq INTEGER NOT NULL DEFAULT 0
	,	numerical_spec_code TEXT NOT NULL
	,	numerical_value01 NUMERIC
	,	numerical_value02 NUMERIC
	,	numerical_value03 NUMERIC
	,	unit01 TEXT NOT NULL
	,	unit02 TEXT NOT NULL
	,	unit03 TEXT NOT NULL
	,	spec_description TEXT NOT NULL
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
	,	CONSTRAINT prd_product_specs_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_product_numerical_specs OWNER to expa_apps;

COMMENT ON TABLE prd_product_numerical_specs
	IS '製品数値スペックマスタ';
COMMENT ON COLUMN prd_product_numerical_specs.id IS '製品数値スペックID';
COMMENT ON COLUMN prd_product_numerical_specs.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_numerical_specs.spec_seq IS 'スペックシークエンス';
COMMENT ON COLUMN prd_product_numerical_specs.numerical_spec_code IS '数値スペックコード';
COMMENT ON COLUMN prd_product_numerical_specs.numerical_value01 IS '数値1';
COMMENT ON COLUMN prd_product_numerical_specs.numerical_value02 IS '数値2';
COMMENT ON COLUMN prd_product_numerical_specs.numerical_value03 IS '数値3';
COMMENT ON COLUMN prd_product_numerical_specs.unit01 IS '単位1';
COMMENT ON COLUMN prd_product_numerical_specs.unit02 IS '単位2';
COMMENT ON COLUMN prd_product_numerical_specs.unit03 IS '単位3';
COMMENT ON COLUMN prd_product_numerical_specs.spec_description IS 'スペック備考';
COMMENT ON COLUMN prd_product_numerical_specs.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_numerical_specs.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_numerical_specs.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_numerical_specs.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_numerical_specs.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_numerical_specs.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_numerical_specs.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_numerical_specs.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_numerical_specs.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_numerical_specs.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_numerical_specs.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_numerical_specs.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_numerical_specs.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_numerical_specs.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_product_numerical_specs_history
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	spec_seq INTEGER NOT NULL DEFAULT 0
	,	numerical_spec_code TEXT NOT NULL
	,	numerical_value01 NUMERIC
	,	numerical_value02 NUMERIC
	,	numerical_value03 NUMERIC
	,	unit01 TEXT NOT NULL
	,	unit02 TEXT NOT NULL
	,	unit03 TEXT NOT NULL
	,	spec_description TEXT NOT NULL
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
	,	CONSTRAINT prd_product_numerical_specs_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_product_numerical_specs_history
	IS '[履歴]製品数値スペックマスタ';
COMMENT ON COLUMN prd_product_numerical_specs_history.id IS '履歴ID';
COMMENT ON COLUMN prd_product_numerical_specs_history.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_numerical_specs_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_product_numerical_specs_history.spec_seq IS 'スペックシークエンス';
COMMENT ON COLUMN prd_product_numerical_specs_history.numerical_spec_code IS '数値スペックコード';
COMMENT ON COLUMN prd_product_numerical_specs_history.numerical_value01 IS '数値1';
COMMENT ON COLUMN prd_product_numerical_specs_history.numerical_value02 IS '数値2';
COMMENT ON COLUMN prd_product_numerical_specs_history.numerical_value03 IS '数値3';
COMMENT ON COLUMN prd_product_numerical_specs_history.unit01 IS '単位1';
COMMENT ON COLUMN prd_product_numerical_specs_history.unit02 IS '単位2';
COMMENT ON COLUMN prd_product_numerical_specs_history.unit03 IS '単位3';
COMMENT ON COLUMN prd_product_numerical_specs_history.spec_description IS 'スペック備考';
COMMENT ON COLUMN prd_product_numerical_specs_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_numerical_specs_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_numerical_specs_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_numerical_specs_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_numerical_specs_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_numerical_specs_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_numerical_specs_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_numerical_specs_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_numerical_specs_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_numerical_specs_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_numerical_specs_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_numerical_specs_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_numerical_specs_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_numerical_specs_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_product_numerical_specs_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_product_numerical_specs FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_product_numerical_specs_trigger AFTER INSERT OR UPDATE ON prd_product_numerical_specs FOR EACH ROW EXECUTE FUNCTION insert_prd_product_numerical_specs_history();