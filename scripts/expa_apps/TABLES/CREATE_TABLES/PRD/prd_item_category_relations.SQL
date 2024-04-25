-- Table: prd_item_category_relations;
-- Table: prd_item_category_relations_history;

DROP TABLE IF EXISTS prd_item_category_relations;
DROP TABLE IF EXISTS prd_item_category_relations_history;

CREATE TABLE IF NOT EXISTS prd_item_category_relations
(
		id BIGSERIAL
	,	item_code TEXT NOT NULL
	,	subcategory_id BIGINT NOT NULL
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
	,	CONSTRAINT prd_item_category_relations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_item_category_relations OWNER to expa_apps;

COMMENT ON TABLE prd_item_category_relations
	IS '商品カテゴリリレーション';
COMMENT ON COLUMN prd_item_category_relations.id IS '商品カテゴリリレーションID';
COMMENT ON COLUMN prd_item_category_relations.item_code IS '商品コード';
COMMENT ON COLUMN prd_item_category_relations.subcategory_id IS 'サブカテゴリID';
COMMENT ON COLUMN prd_item_category_relations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_item_category_relations.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_item_category_relations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_item_category_relations.created_at IS '作成日時';
COMMENT ON COLUMN prd_item_category_relations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_item_category_relations.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_item_category_relations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_item_category_relations.updated_at IS '更新日時';
COMMENT ON COLUMN prd_item_category_relations.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_item_category_relations.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_item_category_relations.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_item_category_relations.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_item_category_relations.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_item_category_relations.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_item_category_relations_history
(
		id BIGSERIAL
	,	item_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	subcategory_id BIGINT NOT NULL
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
	,	CONSTRAINT prd_item_category_relations_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_item_category_relations_history
	IS '[履歴]商品カテゴリリレーション';
COMMENT ON COLUMN prd_item_category_relations_history.id IS '履歴ID';
COMMENT ON COLUMN prd_item_category_relations_history.item_code IS '商品コード';
COMMENT ON COLUMN prd_item_category_relations_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_item_category_relations_history.subcategory_id IS 'サブカテゴリID';
COMMENT ON COLUMN prd_item_category_relations_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_item_category_relations_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_item_category_relations_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_item_category_relations_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_item_category_relations_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_item_category_relations_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_item_category_relations_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_item_category_relations_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_item_category_relations_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_item_category_relations_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_item_category_relations_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_item_category_relations_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_item_category_relations_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_item_category_relations_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_item_category_relations_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_item_category_relations FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_item_category_relations_trigger AFTER INSERT OR UPDATE ON prd_item_category_relations FOR EACH ROW EXECUTE FUNCTION insert_prd_item_category_relations_history();