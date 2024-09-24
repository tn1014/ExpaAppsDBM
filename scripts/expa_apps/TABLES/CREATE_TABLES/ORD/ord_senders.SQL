-- Table: ord_senders
-- Table: ord_senders_history

DROP TABLE IF EXISTS ord_senders;
DROP TABLE IF EXISTS ord_senders_history;

CREATE TABLE IF NOT EXISTS ord_senders
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	package_id BIGINT NOT NULL
	,	sender_name TEXT NOT NULL
	,	sender_charge_name TEXT NOT NULL
	,	sender_tel01 TEXT NOT NULL
	,	sender_tel02 TEXT NOT NULL
	,	sender_tel03 TEXT NOT NULL
	,	sender_zip01 TEXT NOT NULL
	,	sender_zip02 TEXT NOT NULL
	,	sender_pref_code TEXT NOT NULL
	,	sender_pref TEXT NOT NULL
	,	sender_addr01 TEXT NOT NULL
	,	sender_addr02 TEXT NOT NULL
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
	,	CONSTRAINT ord_senders_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_senders OWNER to expa_apps;

COMMENT ON TABLE ord_senders
	IS '受注送付者テーブル';
COMMENT ON COLUMN ord_senders.id IS '受注送付者ID';
COMMENT ON COLUMN ord_senders.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_senders.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_senders.sender_name IS '送付者名';
COMMENT ON COLUMN ord_senders.sender_charge_name IS '担当者名';
COMMENT ON COLUMN ord_senders.sender_tel01 IS '送付者TEL1';
COMMENT ON COLUMN ord_senders.sender_tel02 IS '送付者TEL2';
COMMENT ON COLUMN ord_senders.sender_tel03 IS '送付者TEL3';
COMMENT ON COLUMN ord_senders.sender_zip01 IS '送付者郵便番号1';
COMMENT ON COLUMN ord_senders.sender_zip02 IS '送付者郵便番号2';
COMMENT ON COLUMN ord_senders.sender_pref_code IS '送付者都道府県コード';
COMMENT ON COLUMN ord_senders.sender_pref IS '送付者都道府県';
COMMENT ON COLUMN ord_senders.sender_addr01 IS '送付者住所1';
COMMENT ON COLUMN ord_senders.sender_addr02 IS '送付者住所2';
COMMENT ON COLUMN ord_senders.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_senders.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_senders.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_senders.created_at IS '作成日時';
COMMENT ON COLUMN ord_senders.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_senders.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_senders.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_senders.updated_at IS '更新日時';
COMMENT ON COLUMN ord_senders.is_deleted IS '削除区分';
COMMENT ON COLUMN ord_senders.deleted_description IS '削除備考';
COMMENT ON COLUMN ord_senders.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN ord_senders.deleted_terminal IS '削除端末';
COMMENT ON COLUMN ord_senders.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN ord_senders.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_senders_history
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	sender_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	package_id BIGINT NOT NULL
	,	sender_name TEXT NOT NULL
	,	sender_charge_name TEXT NOT NULL
	,	sender_tel01 TEXT NOT NULL
	,	sender_tel02 TEXT NOT NULL
	,	sender_tel03 TEXT NOT NULL
	,	sender_zip01 TEXT NOT NULL
	,	sender_zip02 TEXT NOT NULL
	,	sender_pref_code TEXT NOT NULL
	,	sender_pref TEXT NOT NULL
	,	sender_addr01 TEXT NOT NULL
	,	sender_addr02 TEXT NOT NULL
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
	,	CONSTRAINT ord_senders_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_senders_history OWNER to expa_apps;

COMMENT ON TABLE ord_senders_history
	IS '[履歴]受注送付者テーブル';
COMMENT ON COLUMN ord_senders_history.id IS '履歴ID';
COMMENT ON COLUMN ord_senders_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_senders_history.sender_id IS '受注送付者ID';
COMMENT ON COLUMN ord_senders_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_senders_history.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_senders_history.sender_name IS '送付者名';
COMMENT ON COLUMN ord_senders_history.sender_charge_name IS '担当者名';
COMMENT ON COLUMN ord_senders_history.sender_tel01 IS '送付者TEL1';
COMMENT ON COLUMN ord_senders_history.sender_tel02 IS '送付者TEL2';
COMMENT ON COLUMN ord_senders_history.sender_tel03 IS '送付者TEL3';
COMMENT ON COLUMN ord_senders_history.sender_zip01 IS '送付者郵便番号1';
COMMENT ON COLUMN ord_senders_history.sender_zip02 IS '送付者郵便番号2';
COMMENT ON COLUMN ord_senders_history.sender_pref_code IS '送付者都道府県コード';
COMMENT ON COLUMN ord_senders_history.sender_pref IS '送付者都道府県';
COMMENT ON COLUMN ord_senders_history.sender_addr01 IS '送付者住所1';
COMMENT ON COLUMN ord_senders_history.sender_addr02 IS '送付者住所2';
COMMENT ON COLUMN ord_senders_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_senders_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_senders_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_senders_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_senders_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_senders_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_senders_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_senders_history.updated_at IS '更新日時';
COMMENT ON COLUMN ord_senders_history.is_deleted IS '削除区分';
COMMENT ON COLUMN ord_senders_history.deleted_description IS '削除備考';
COMMENT ON COLUMN ord_senders_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN ord_senders_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN ord_senders_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN ord_senders_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_senders FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_senders_trigger AFTER INSERT OR UPDATE ON ord_senders FOR EACH ROW EXECUTE FUNCTION insert_ord_senders_history();