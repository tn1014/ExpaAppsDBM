-- Table: prd_product_unit_relations;
-- Table: prd_product_unit_relations_history;

DROP TABLE IF EXISTS prd_product_unit_relations;
DROP TABLE IF EXISTS prd_product_unit_relations_history;

CREATE TABLE IF NOT EXISTS prd_product_unit_relations
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	unit_seq SMALLINT NOT NULL DEFAULT 0
	,	unit_code TEXT NOT NULL
	,	unit_quantity INTEGER NOT NULL
	,	is_master_used BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT prd_product_unit_relations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_product_unit_relations OWNER to expa_apps;

COMMENT ON TABLE prd_product_unit_relations
	IS '製品単位リレーション';
COMMENT ON COLUMN prd_product_unit_relations.id IS '製品単位リレーションID';
COMMENT ON COLUMN prd_product_unit_relations.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_unit_relations.unit_seq IS '単位登録シークエンス';
COMMENT ON COLUMN prd_product_unit_relations.unit_code IS '単位コード';
COMMENT ON COLUMN prd_product_unit_relations.unit_quantity IS '単位入数';
COMMENT ON COLUMN prd_product_unit_relations.is_master_used IS 'マスタ登録票使用区分';
COMMENT ON COLUMN prd_product_unit_relations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_unit_relations.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_unit_relations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_unit_relations.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_unit_relations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_unit_relations.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_unit_relations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_unit_relations.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_unit_relations.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_unit_relations.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_unit_relations.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_unit_relations.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_unit_relations.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_unit_relations.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_product_unit_relations_history
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	unit_seq SMALLINT NOT NULL DEFAULT 0
	,	unit_code TEXT NOT NULL
	,	unit_quantity INTEGER NOT NULL
	,	is_master_used BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT prd_product_unit_relations_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_product_unit_relations_history
	IS '[履歴]製品単位リレーション';
COMMENT ON COLUMN prd_product_unit_relations_history.id IS '履歴ID';
COMMENT ON COLUMN prd_product_unit_relations_history.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_unit_relations_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_product_unit_relations_history.unit_seq IS '単位登録シークエンス';
COMMENT ON COLUMN prd_product_unit_relations_history.unit_code IS '単位コード';
COMMENT ON COLUMN prd_product_unit_relations_history.unit_quantity IS '単位入数';
COMMENT ON COLUMN prd_product_unit_relations_history.is_master_used IS 'マスタ登録票使用区分';
COMMENT ON COLUMN prd_product_unit_relations_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_unit_relations_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_unit_relations_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_unit_relations_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_unit_relations_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_unit_relations_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_unit_relations_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_unit_relations_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_unit_relations_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_unit_relations_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_unit_relations_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_unit_relations_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_unit_relations_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_unit_relations_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_product_unit_relations_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_product_unit_relations FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_product_unit_relations_trigger AFTER INSERT OR UPDATE ON prd_product_unit_relations FOR EACH ROW EXECUTE FUNCTION insert_prd_product_unit_relations_history();