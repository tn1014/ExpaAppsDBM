-- Table: ord_package_address_divisions

DROP TABLE IF EXISTS ord_package_address_divisions;

CREATE TABLE IF NOT EXISTS ord_package_address_divisions
(
		id BIGSERIAL
	,	order_id BIGINT
	,	package_id BIGINT
	,	address_div TEXT NOT NULL
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
	,	CONSTRAINT ord_package_address_divisions_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_address_divisions OWNER to expa_apps;

COMMENT ON TABLE ord_package_address_divisions
	IS '受注送付先宛先区分テーブル';
COMMENT ON COLUMN ord_package_address_divisions.id IS '受注送付先宛先区分ID';
COMMENT ON COLUMN ord_package_address_divisions.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_package_address_divisions.package_id IS '送付先ID';
COMMENT ON COLUMN ord_package_address_divisions.address_div IS '宛先区分';
COMMENT ON COLUMN ord_package_address_divisions.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_address_divisions.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_address_divisions.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_address_divisions.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_address_divisions.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_address_divisions.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_address_divisions.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_address_divisions.updated_at IS '更新日時';
COMMENT ON COLUMN ord_package_address_divisions.is_deleted IS '削除区分';
COMMENT ON COLUMN ord_package_address_divisions.deleted_description IS '削除備考';
COMMENT ON COLUMN ord_package_address_divisions.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN ord_package_address_divisions.deleted_terminal IS '削除端末';
COMMENT ON COLUMN ord_package_address_divisions.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN ord_package_address_divisions.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_address_divisions FOR EACH ROW EXECUTE FUNCTION set_updated_at();
