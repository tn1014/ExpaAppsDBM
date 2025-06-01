-- Table: pur_delivery_destinations

DROP TABLE IF EXISTS pur_delivery_destinations;

CREATE TABLE IF NOT EXISTS pur_delivery_destinations
(
		id BIGSERIAL
	,	delivery_destination_code TEXT NOT NULL
	,	sender_tel TEXT NOT NULL
	,	sender_name TEXT NOT NULL
	,	sender_charge_name TEXT NOT NULL
	,	sender_zip01 TEXT NOT NULL
	,	sender_zip02 TEXT NOT NULL
	,	sender_pref_code TEXT NOT NULL
	,	sender_pref TEXT NOT NULL
	,	sender_addr01 TEXT NOT NULL
	,	sender_addr02 TEXT NOT NULL
	,	destination_description TEXT NOT NULL
	,	first_purchased_on DATE
	,	latest_purchased_on DATE
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
	,	CONSTRAINT pur_delivery_destinations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_delivery_destinations OWNER to expa_apps;

COMMENT ON TABLE pur_delivery_destinations
	IS '発注納品先マスタ';
COMMENT ON COLUMN pur_delivery_destinations.id IS '発注納品先ID';
COMMENT ON COLUMN pur_delivery_destinations.delivery_destination_code IS '納品先コード';
COMMENT ON COLUMN pur_delivery_destinations.sender_tel IS '納品先電話番号';
COMMENT ON COLUMN pur_delivery_destinations.sender_name IS '納品先名';
COMMENT ON COLUMN pur_delivery_destinations.sender_charge_name IS '納品先担当者名';
COMMENT ON COLUMN pur_delivery_destinations.sender_zip01 IS '納品先郵便番号1';
COMMENT ON COLUMN pur_delivery_destinations.sender_zip02 IS '納品先郵便番号2';
COMMENT ON COLUMN pur_delivery_destinations.sender_pref_code IS '納品先都道府県コード';
COMMENT ON COLUMN pur_delivery_destinations.sender_pref IS '納品先都道府県';
COMMENT ON COLUMN pur_delivery_destinations.sender_addr01 IS '納品先住所1';
COMMENT ON COLUMN pur_delivery_destinations.sender_addr02 IS '納品先住所2';
COMMENT ON COLUMN pur_delivery_destinations.destination_description IS '納品先備考';
COMMENT ON COLUMN pur_delivery_destinations.first_purchased_on IS '初回発注日';
COMMENT ON COLUMN pur_delivery_destinations.latest_purchased_on IS '最新発注日';
COMMENT ON COLUMN pur_delivery_destinations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_delivery_destinations.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_delivery_destinations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_delivery_destinations.created_at IS '作成日時';
COMMENT ON COLUMN pur_delivery_destinations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_delivery_destinations.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_delivery_destinations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_delivery_destinations.updated_at IS '更新日時';
COMMENT ON COLUMN pur_delivery_destinations.is_deleted IS '削除区分';
COMMENT ON COLUMN pur_delivery_destinations.deleted_description IS '削除備考';
COMMENT ON COLUMN pur_delivery_destinations.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN pur_delivery_destinations.deleted_terminal IS '削除端末';
COMMENT ON COLUMN pur_delivery_destinations.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN pur_delivery_destinations.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_delivery_destinations FOR EACH ROW EXECUTE FUNCTION set_updated_at();