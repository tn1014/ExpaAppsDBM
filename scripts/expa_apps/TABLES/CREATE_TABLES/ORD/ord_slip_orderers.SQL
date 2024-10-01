-- Table: ord_slip_orderers
-- Table: ord_slip_orderers_history

DROP TABLE IF EXISTS ord_slip_orderers;
DROP TABLE IF EXISTS ord_slip_orderers_history;

CREATE TABLE IF NOT EXISTS ord_slip_orderers
(
		id BIGSERIAL
	,	order_id BIGINT
	,	order_name TEXT NOT NULL
	,	order_charge_name TEXT NOT NULL
	,	order_email TEXT NOT NULL
	,	order_tel01 TEXT NOT NULL
	,	order_tel02 TEXT NOT NULL
	,	order_tel03 TEXT NOT NULL
	,	order_zip01 TEXT NOT NULL
	,	order_zip02 TEXT NOT NULL
	,	order_pref_code TEXT NOT NULL
	,	order_pref TEXT NOT NULL
	,	order_addr01 TEXT NOT NULL
	,	order_addr02 TEXT NOT NULL
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
	,	CONSTRAINT ord_slip_orderers_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_slip_orderers OWNER to expa_apps;

COMMENT ON TABLE ord_slip_orderers
	IS '受注伝票注文者テーブル';
COMMENT ON COLUMN ord_slip_orderers.id IS '受注伝票注文者ID';
COMMENT ON COLUMN ord_slip_orderers.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slip_orderers.order_name IS '注文者名';
COMMENT ON COLUMN ord_slip_orderers.order_charge_name IS '担当者名';
COMMENT ON COLUMN ord_slip_orderers.order_email IS 'メールアドレス';
COMMENT ON COLUMN ord_slip_orderers.order_tel01 IS '注文者TEL1';
COMMENT ON COLUMN ord_slip_orderers.order_tel02 IS '注文者TEL2';
COMMENT ON COLUMN ord_slip_orderers.order_tel03 IS '注文者TEL3';
COMMENT ON COLUMN ord_slip_orderers.order_zip01 IS '注文者郵便番号1';
COMMENT ON COLUMN ord_slip_orderers.order_zip02 IS '注文者郵便番号2';
COMMENT ON COLUMN ord_slip_orderers.order_pref_code IS '注文者都道府県コード';
COMMENT ON COLUMN ord_slip_orderers.order_pref IS '注文者都道府県';
COMMENT ON COLUMN ord_slip_orderers.order_addr01 IS '注文者住所1';
COMMENT ON COLUMN ord_slip_orderers.order_addr02 IS '注文者住所2';
COMMENT ON COLUMN ord_slip_orderers.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slip_orderers.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slip_orderers.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slip_orderers.created_at IS '作成日時';
COMMENT ON COLUMN ord_slip_orderers.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slip_orderers.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slip_orderers.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slip_orderers.updated_at IS '更新日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_slip_orderers_history
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	slip_orderer_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	order_name TEXT NOT NULL
	,	order_charge_name TEXT NOT NULL
	,	order_email TEXT NOT NULL
	,	order_tel01 TEXT NOT NULL
	,	order_tel02 TEXT NOT NULL
	,	order_tel03 TEXT NOT NULL
	,	order_zip01 TEXT NOT NULL
	,	order_zip02 TEXT NOT NULL
	,	order_pref_code TEXT NOT NULL
	,	order_pref TEXT NOT NULL
	,	order_addr01 TEXT NOT NULL
	,	order_addr02 TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_slip_orderers_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_slip_orderers_history OWNER to expa_apps;

COMMENT ON TABLE ord_slip_orderers_history
	IS '[履歴]受注伝票注文者テーブル';
COMMENT ON COLUMN ord_slip_orderers_history.id IS '履歴ID';
COMMENT ON COLUMN ord_slip_orderers_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slip_orderers_history.slip_orderer_id IS '受注伝票注文者ID';
COMMENT ON COLUMN ord_slip_orderers_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_slip_orderers_history.order_name IS '注文者名';
COMMENT ON COLUMN ord_slip_orderers_history.order_charge_name IS '担当者名';
COMMENT ON COLUMN ord_slip_orderers_history.order_email IS 'メールアドレス';
COMMENT ON COLUMN ord_slip_orderers_history.order_tel01 IS '注文者TEL1';
COMMENT ON COLUMN ord_slip_orderers_history.order_tel02 IS '注文者TEL2';
COMMENT ON COLUMN ord_slip_orderers_history.order_tel03 IS '注文者TEL3';
COMMENT ON COLUMN ord_slip_orderers_history.order_zip01 IS '注文者郵便番号1';
COMMENT ON COLUMN ord_slip_orderers_history.order_zip02 IS '注文者郵便番号2';
COMMENT ON COLUMN ord_slip_orderers_history.order_pref_code IS '注文者都道府県コード';
COMMENT ON COLUMN ord_slip_orderers_history.order_pref IS '注文者都道府県';
COMMENT ON COLUMN ord_slip_orderers_history.order_addr01 IS '注文者住所1';
COMMENT ON COLUMN ord_slip_orderers_history.order_addr02 IS '注文者住所2';
COMMENT ON COLUMN ord_slip_orderers_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slip_orderers_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slip_orderers_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slip_orderers_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_slip_orderers_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slip_orderers_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slip_orderers_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slip_orderers_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_slip_orderers FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_slips_trigger AFTER INSERT OR UPDATE ON ord_slip_orderers FOR EACH ROW EXECUTE FUNCTION insert_ord_slip_orderers_history();