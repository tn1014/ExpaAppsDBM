-- Table: app_function_authority_relations

DROP TABLE IF EXISTS app_function_authority_relations;

CREATE TABLE IF NOT EXISTS app_function_authority_relations
(
		id BIGSERIAL
	,	authority_code TEXT NOT NULL
	,	function_code TEXT NOT NULL
	,	permission_type TEXT NOT NULL
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
	,	CONSTRAINT app_function_authority_relations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_function_authority_relations OWNER to expa_apps;

COMMENT ON TABLE app_function_authority_relations
	IS 'アプリケーション権限別使用機能リレーション設定';
COMMENT ON COLUMN app_function_authority_relations.id IS 'アプリケーション権限別使用機能リレーションID';
COMMENT ON COLUMN app_function_authority_relations.authority_code IS 'アプリケーション権限コード';
COMMENT ON COLUMN app_function_authority_relations.function_code IS '機能コード';
COMMENT ON COLUMN app_function_authority_relations.permission_type IS '権限タイプ';
COMMENT ON COLUMN app_function_authority_relations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_function_authority_relations.created_terminal IS '作成端末';
COMMENT ON COLUMN app_function_authority_relations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_function_authority_relations.created_at IS '作成日時';
COMMENT ON COLUMN app_function_authority_relations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_function_authority_relations.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_function_authority_relations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_function_authority_relations.updated_at IS '更新日時';
COMMENT ON COLUMN app_function_authority_relations.is_deleted IS '削除区分';
COMMENT ON COLUMN app_function_authority_relations.deleted_description IS '削除備考';
COMMENT ON COLUMN app_function_authority_relations.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_function_authority_relations.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_function_authority_relations.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_function_authority_relations.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_function_authority_relations FOR EACH ROW EXECUTE FUNCTION set_updated_at();