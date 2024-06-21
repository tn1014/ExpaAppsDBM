-- Table: mst_purchase_patterns;
-- Table: mst_purchase_patterns_history;

DROP TABLE IF EXISTS mst_purchase_patterns;
DROP TABLE IF EXISTS mst_purchase_patterns_history;

CREATE TABLE IF NOT EXISTS mst_purchase_patterns
(
		id BIGSERIAL
	,	purchase_pattern_name TEXT NOT NULL
	,	purchase_method_div TEXT NOT NULL
	,	last_arrival_location_code TEXT NOT NULL
	,	is_required_print_transfer_request_form BOOLEAN NOT NULL
	,	rank INT
	,	is_enabled BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT mst_purchase_patterns_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_purchase_patterns OWNER to expa_apps;

COMMENT ON TABLE mst_purchase_patterns
	IS '発注パターンマスタ';
COMMENT ON COLUMN mst_purchase_patterns.id IS '発注パターンID';
COMMENT ON COLUMN mst_purchase_patterns.purchase_pattern_name IS '発注パターン名';
COMMENT ON COLUMN mst_purchase_patterns.purchase_method_div IS '発注方法区分(発注・使用依頼)';
COMMENT ON COLUMN mst_purchase_patterns.last_arrival_location_code IS '最終入庫場所コード';
COMMENT ON COLUMN mst_purchase_patterns.is_required_print_transfer_request_form IS '移動依頼書印刷要否';
COMMENT ON COLUMN mst_purchase_patterns.rank IS '表示順';
COMMENT ON COLUMN mst_purchase_patterns.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_purchase_patterns.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_purchase_patterns.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_purchase_patterns.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_purchase_patterns.created_at IS '作成日時';
COMMENT ON COLUMN mst_purchase_patterns.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_purchase_patterns.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_purchase_patterns.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_purchase_patterns.updated_at IS '更新日時';
COMMENT ON COLUMN mst_purchase_patterns.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_purchase_patterns.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_purchase_patterns.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_purchase_patterns.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_purchase_patterns.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_purchase_patterns.deleted_at IS '削除日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS mst_purchase_patterns_history
(
		id BIGSERIAL
	,	purchase_pattern_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL
	,	purchase_pattern_name TEXT NOT NULL
	,	purchase_method_div TEXT NOT NULL
	,	last_arrival_location_code TEXT NOT NULL
	,	is_required_print_transfer_request_form BOOLEAN NOT NULL DEFAULT FALSE
	,	rank INT
	,	is_enabled BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT mst_purchase_patterns_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_purchase_patterns_history OWNER to expa_apps;

COMMENT ON TABLE mst_purchase_patterns_history
	IS '[履歴]発注パターンマスタ';
COMMENT ON COLUMN mst_purchase_patterns_history.id IS '履歴ID';
COMMENT ON COLUMN mst_purchase_patterns_history.purchase_pattern_id IS '発注パターンID';
COMMENT ON COLUMN mst_purchase_patterns_history.history_count IS '更新回数';
COMMENT ON COLUMN mst_purchase_patterns_history.purchase_pattern_name IS '発注パターン名';
COMMENT ON COLUMN mst_purchase_patterns_history.purchase_method_div IS '発注方法区分(発注・使用依頼)';
COMMENT ON COLUMN mst_purchase_patterns_history.last_arrival_location_code IS '最終入庫場所コード';
COMMENT ON COLUMN mst_purchase_patterns_history.is_required_print_transfer_request_form IS '移動依頼書印刷要否';
COMMENT ON COLUMN mst_purchase_patterns_history.rank IS '表示順';
COMMENT ON COLUMN mst_purchase_patterns_history.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_purchase_patterns_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_purchase_patterns_history.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_purchase_patterns_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_purchase_patterns_history.created_at IS '作成日時';
COMMENT ON COLUMN mst_purchase_patterns_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_purchase_patterns_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_purchase_patterns_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_purchase_patterns_history.updated_at IS '更新日時';
COMMENT ON COLUMN mst_purchase_patterns_history.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_purchase_patterns_history.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_purchase_patterns_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_purchase_patterns_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_purchase_patterns_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_purchase_patterns_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_purchase_patterns FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_mst_purchase_patterns_trigger AFTER INSERT OR UPDATE ON mst_purchase_patterns FOR EACH ROW EXECUTE FUNCTION insert_mst_purchase_patterns_history();