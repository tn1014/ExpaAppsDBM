-- Table: mng_store_informations;

DROP TABLE IF EXISTS mng_store_informations;

CREATE TABLE IF NOT EXISTS mng_store_informations
(
		id BIGSERIAL
	,	store_name TEXT NOT NULL
	,	store_short_name TEXT NOT NULL
	,	company_name TEXT NOT NULL
	,	company_short_name TEXT NOT NULL
	,	store_email TEXT NOT NULL
	,	store_tel01 TEXT NOT NULL
	,	store_tel02 TEXT NOT NULL
	,	store_tel03 TEXT NOT NULL
	,	store_fax01 TEXT NOT NULL
	,	store_fax02 TEXT NOT NULL
	,	store_fax03 TEXT NOT NULL
	,	store_zip01 TEXT NOT NULL
	,	store_zip02 TEXT NOT NULL
	,	store_pref_code TEXT NOT NULL
	,	store_pref TEXT NOT NULL
	,	store_addr01 TEXT NOT NULL
	,	store_addr02 TEXT NOT NULL
	,	manager_name TEXT NOT NULL
	,	charge_name TEXT NOT NULL
	,	business_time TEXT NOT NULL
	,	invoice_register_no TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT mng_store_informations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_store_informations OWNER to expa_apps;

COMMENT ON TABLE mng_store_informations
	IS '店舗情報マスタ';
COMMENT ON COLUMN mng_store_informations.id IS '店舗情報ID';
COMMENT ON COLUMN mng_store_informations.store_name IS '店舗名';
COMMENT ON COLUMN mng_store_informations.store_short_name IS '店舗名略称';
COMMENT ON COLUMN mng_store_informations.company_name IS '会社名';
COMMENT ON COLUMN mng_store_informations.company_short_name IS '会社名略称';
COMMENT ON COLUMN mng_store_informations.store_email IS '店舗メールアドレス';
COMMENT ON COLUMN mng_store_informations.store_tel01 IS '店舗電話番号1';
COMMENT ON COLUMN mng_store_informations.store_tel02 IS '店舗電話番号2';
COMMENT ON COLUMN mng_store_informations.store_tel03 IS '店舗電話番号3';
COMMENT ON COLUMN mng_store_informations.store_fax01 IS '店舗FAX番号1';
COMMENT ON COLUMN mng_store_informations.store_fax02 IS '店舗FAX番号2';
COMMENT ON COLUMN mng_store_informations.store_fax03 IS '店舗FAX番号3';
COMMENT ON COLUMN mng_store_informations.store_zip01 IS '店舗郵便番号1';
COMMENT ON COLUMN mng_store_informations.store_zip02 IS '店舗郵便番号2';
COMMENT ON COLUMN mng_store_informations.store_pref_code IS '店舗都道府県コード';
COMMENT ON COLUMN mng_store_informations.store_pref IS '店舗都道府県';
COMMENT ON COLUMN mng_store_informations.store_addr01 IS '店舗住所1';
COMMENT ON COLUMN mng_store_informations.store_addr02 IS '店舗住所2';
COMMENT ON COLUMN mng_store_informations.manager_name IS '運営者名';
COMMENT ON COLUMN mng_store_informations.charge_name IS '責任者名';
COMMENT ON COLUMN mng_store_informations.business_time IS '営業時間';
COMMENT ON COLUMN mng_store_informations.invoice_register_no IS 'インボイス登録番号';
COMMENT ON COLUMN mng_store_informations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_store_informations.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_store_informations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_store_informations.created_at IS '作成日時';
COMMENT ON COLUMN mng_store_informations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_store_informations.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_store_informations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_store_informations.updated_at IS '更新日時';

CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_store_informations FOR EACH ROW EXECUTE FUNCTION set_updated_at();