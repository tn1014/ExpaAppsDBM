-- Table: app_functions

DROP TABLE IF EXISTS app_functions;

CREATE TABLE IF NOT EXISTS app_functions
(
		id BIGSERIAL
	,	function_code TEXT NOT NULL
	,	function_name TEXT NOT NULL
	,	function_version TEXT NOT NULL
	,	function_type TEXT NOT NULL
	,	function_summary TEXT NOT NULL
	,	is_required_authority BOOLEAN NOT NULL DEFAULT false
	,	is_displayed_menu BOOLEAN NOT NULL DEFAULT false
	,	controller TEXT NOT NULL
	,	context_path TEXT NOT NULL
	,	js_path TEXT
	,	function_icon TEXT
	,	destination_context_path01 TEXT NOT NULL
	,	destination_context_path02 TEXT NOT NULL
	,	destination_context_path03 TEXT NOT NULL
	,	destination_context_path04 TEXT NOT NULL
	,	destination_context_path05 TEXT NOT NULL
	,	destination_context_path06 TEXT NOT NULL
	,	destination_context_path07 TEXT NOT NULL
	,	destination_context_path08 TEXT NOT NULL
	,	destination_context_path09 TEXT NOT NULL
	,	destination_context_path10 TEXT NOT NULL
	,	rank INT
	,	is_enabled BOOLEAN NOT NULL DEFAULT false
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
	,	CONSTRAINT app_functions_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS app_functions OWNER to expa_apps;

COMMENT ON TABLE app_functions
	IS 'アプリケーション機能設定';
COMMENT ON COLUMN app_functions.id IS '機能ID';
COMMENT ON COLUMN app_functions.function_code IS '機能コード';
COMMENT ON COLUMN app_functions.function_name IS '機能名';
COMMENT ON COLUMN app_functions.function_version IS '機能バージョン';
COMMENT ON COLUMN app_functions.function_type IS '機能種別[UNIQUE(独自)/COMMON(共通)]';
COMMENT ON COLUMN app_functions.function_summary IS '機能概要';
COMMENT ON COLUMN app_functions.is_required_authority IS '権限要否';
COMMENT ON COLUMN app_functions.is_displayed_menu IS '機能メニュー表示有無';
COMMENT ON COLUMN app_functions.controller IS 'コントローラ';
COMMENT ON COLUMN app_functions.context_path IS 'コンテキストパス';
COMMENT ON COLUMN app_functions.js_path IS 'JSパス';
COMMENT ON COLUMN app_functions.function_icon IS '機能アイコン';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス1';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス2';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス3';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス4';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス5';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス6';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス7';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス8';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス9';
COMMENT ON COLUMN app_functions.destination_context_path01 IS '遷移先コンテキストパス10';
COMMENT ON COLUMN app_functions.rank IS '表示順';
COMMENT ON COLUMN app_functions.is_enabled IS '使用可能区分';
COMMENT ON COLUMN app_functions.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN app_functions.created_terminal IS '作成端末';
COMMENT ON COLUMN app_functions.created_function_code IS '作成機能コード';
COMMENT ON COLUMN app_functions.created_at IS '作成日時';
COMMENT ON COLUMN app_functions.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN app_functions.updated_terminal IS '更新端末';
COMMENT ON COLUMN app_functions.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN app_functions.updated_at IS '更新日時';
COMMENT ON COLUMN app_functions.is_deleted IS '削除区分';
COMMENT ON COLUMN app_functions.deleted_description IS '削除備考';
COMMENT ON COLUMN app_functions.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN app_functions.deleted_terminal IS '削除端末';
COMMENT ON COLUMN app_functions.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN app_functions.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON app_functions FOR EACH ROW EXECUTE FUNCTION set_updated_at();