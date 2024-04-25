-- Table: user_message_notifications

DROP TABLE IF EXISTS user_message_notifications;

CREATE TABLE IF NOT EXISTS user_message_notifications
(
		id BIGSERIAL
	,	user_code TEXT NOT NULL
	,	notify_type TEXT NOT NULL
	,	message_type TEXT NOT NULL
	,	display_duration INTEGER
	,	download_file_path TEXT NOT NULL
	,	title TEXT NOT NULL
	,	message TEXT NOT NULL
	,	confirmed_at TIMESTAMP(3) WITHOUT TIME ZONE
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
	,	CONSTRAINT user_message_notifications_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS user_message_notifications OWNER to expa_apps;

COMMENT ON TABLE user_message_notifications
	IS 'ユーザメッセージ通知テーブル';
COMMENT ON COLUMN user_message_notifications.id IS '通知ID';
COMMENT ON COLUMN user_message_notifications.user_code IS 'ユーザコード';
COMMENT ON COLUMN user_message_notifications.notify_type IS '通知タイプ';
COMMENT ON COLUMN user_message_notifications.message_type IS 'メッセージタイプ';
COMMENT ON COLUMN user_message_notifications.display_duration IS '表示時間(ミリ秒)';
COMMENT ON COLUMN user_message_notifications.download_file_path IS 'ダウンロードファイルパス';
COMMENT ON COLUMN user_message_notifications.title IS '通知タイトル';
COMMENT ON COLUMN user_message_notifications.message IS '通知メッセージ';
COMMENT ON COLUMN user_message_notifications.confirmed_at IS '確認日時';
COMMENT ON COLUMN user_message_notifications.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN user_message_notifications.created_terminal IS '作成端末';
COMMENT ON COLUMN user_message_notifications.created_function_code IS '作成機能コード';
COMMENT ON COLUMN user_message_notifications.created_at IS '作成日時';
COMMENT ON COLUMN user_message_notifications.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN user_message_notifications.updated_terminal IS '更新端末';
COMMENT ON COLUMN user_message_notifications.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN user_message_notifications.updated_at IS '更新日時';
COMMENT ON COLUMN user_message_notifications.is_deleted IS '削除区分';
COMMENT ON COLUMN user_message_notifications.deleted_description IS '削除備考';
COMMENT ON COLUMN user_message_notifications.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN user_message_notifications.deleted_terminal IS '削除端末';
COMMENT ON COLUMN user_message_notifications.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN user_message_notifications.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON user_message_notifications FOR EACH ROW EXECUTE FUNCTION set_updated_at();