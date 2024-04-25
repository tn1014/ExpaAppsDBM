-- Table: job_item_upload_requests;

DROP TABLE IF EXISTS job_data_migration_requests;

CREATE TABLE IF NOT EXISTS job_data_migration_requests
(
		id BIGSERIAL
	,	job_status TEXT NOT NULL
	,	started_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	ended_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	result_code TEXT NOT NULL
	,	message TEXT NOT NULL
	,	file_path TEXT NOT NULL
	,	data_name TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	CONSTRAINT job_data_migration_requests_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS job_data_migration_requests OWNER to expa_apps;

COMMENT ON TABLE job_data_migration_requests
	IS '【旧システム用】データ移行実行リクエストジョブ';
COMMENT ON COLUMN job_data_migration_requests.id IS 'ジョブID';
COMMENT ON COLUMN job_data_migration_requests.job_status IS 'ジョブステータス';
COMMENT ON COLUMN job_data_migration_requests.started_at IS '開始日時';
COMMENT ON COLUMN job_data_migration_requests.ended_at IS '終了日時';
COMMENT ON COLUMN job_data_migration_requests.result_code IS '結果コード';
COMMENT ON COLUMN job_data_migration_requests.message IS 'メッセージ';
COMMENT ON COLUMN job_data_migration_requests.file_path IS 'データファイルパス';
COMMENT ON COLUMN job_data_migration_requests.data_name IS '移行データ名';
COMMENT ON COLUMN job_data_migration_requests.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN job_data_migration_requests.created_terminal IS '作成端末';
COMMENT ON COLUMN job_data_migration_requests.created_function_code IS '作成機能コード';
COMMENT ON COLUMN job_data_migration_requests.created_at IS '作成日時';
