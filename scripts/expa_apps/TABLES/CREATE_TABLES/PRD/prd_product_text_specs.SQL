-- Table: prd_product_text_specs;
-- Table: prd_product_text_specs_history;

DROP TABLE IF EXISTS prd_product_text_specs;
DROP TABLE IF EXISTS prd_product_text_specs_history;

CREATE TABLE IF NOT EXISTS prd_product_text_specs
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	spec_seq INTEGER NOT NULL DEFAULT 0
	,	text_spec_code TEXT NOT NULL
	,	text_value TEXT NOT NULL
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
	,	CONSTRAINT prd_product_text_specs_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_product_text_specs OWNER to expa_apps;

COMMENT ON TABLE prd_product_text_specs
	IS '製品テキストスペックマスタ';
COMMENT ON COLUMN prd_product_text_specs.id IS '製品テキストスペックID';
COMMENT ON COLUMN prd_product_text_specs.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_text_specs.spec_seq IS 'スペックシークエンス';
COMMENT ON COLUMN prd_product_text_specs.text_spec_code IS 'テキストスペックコード';
COMMENT ON COLUMN prd_product_text_specs.text_value IS 'テキスト';
COMMENT ON COLUMN prd_product_text_specs.spec_description IS 'スペック備考';
COMMENT ON COLUMN prd_product_text_specs.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_text_specs.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_text_specs.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_text_specs.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_text_specs.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_text_specs.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_text_specs.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_text_specs.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_text_specs.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_text_specs.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_text_specs.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_text_specs.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_text_specs.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_text_specs.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_product_text_specs_history
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	spec_seq INTEGER NOT NULL DEFAULT 0
	,	text_spec_code TEXT NOT NULL
	,	text_value TEXT NOT NULL
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
	,	CONSTRAINT prd_product_text_specs_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_product_text_specs_history
	IS '[履歴]製品テキストスペックマスタ';
COMMENT ON COLUMN prd_product_text_specs_history.id IS '履歴ID';
COMMENT ON COLUMN prd_product_text_specs_history.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_text_specs_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_product_text_specs_history.spec_seq IS 'スペックシークエンス';
COMMENT ON COLUMN prd_product_text_specs_history.text_spec_code IS 'テキストスペックコード';
COMMENT ON COLUMN prd_product_text_specs_history.text_value IS 'テキスト';
COMMENT ON COLUMN prd_product_text_specs_history.spec_description IS 'スペック備考';
COMMENT ON COLUMN prd_product_text_specs_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_text_specs_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_text_specs_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_text_specs_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_text_specs_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_text_specs_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_text_specs_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_text_specs_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_text_specs_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_text_specs_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_text_specs_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_text_specs_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_text_specs_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_text_specs_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_product_text_specs_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_product_text_specs FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_product_text_specs_trigger AFTER INSERT OR UPDATE ON prd_product_text_specs FOR EACH ROW EXECUTE FUNCTION insert_prd_product_text_specs_history();