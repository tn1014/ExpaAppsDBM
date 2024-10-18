-- Table: mng_payment_methods;

DROP TABLE IF EXISTS mng_payment_methods;

CREATE TABLE IF NOT EXISTS mng_payment_methods
(
		id BIGSERIAL
	,	payment_method_code TEXT NOT NULL
	,	payment_method TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	honten_relation_code TEXT NOT NULL
	,	rakuten_relation_code TEXT NOT NULL
	,	yahoo_relation_code TEXT NOT NULL
	,	honten_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	honten_payment_charge NUMERIC NOT NULL DEFAULT 0
	,	rakuten_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	rakuten_payment_charge NUMERIC NOT NULL DEFAULT 0
	,	yahoo_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	yahoo_payment_charge NUMERIC NOT NULL DEFAULT 0
	,	fax_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	fax_payment_charge NUMERIC NOT NULL DEFAULT 0
	,	delivery_charge_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	payment_charge_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	is_cash_on_delivery BOOLEAN NOT NULL DEFAULT FALSE
	,	is_directly_shippable BOOLEAN NOT NULL DEFAULT FALSE
	,	is_preshipping_payment BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT mng_payment_methods_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_payment_methods OWNER to expa_apps;

COMMENT ON TABLE mng_payment_methods
	IS '決済方法マスタ';
COMMENT ON COLUMN mng_payment_methods.id IS '決済方法ID';
COMMENT ON COLUMN mng_payment_methods.payment_method_code IS '決済方法コード';
COMMENT ON COLUMN mng_payment_methods.payment_method IS '決済方法';
COMMENT ON COLUMN mng_payment_methods.short_name IS '略称';
COMMENT ON COLUMN mng_payment_methods.honten_relation_code IS '本店連携コード';
COMMENT ON COLUMN mng_payment_methods.rakuten_relation_code IS '楽天市場連携コード';
COMMENT ON COLUMN mng_payment_methods.yahoo_relation_code IS 'Yahoo!ショッピング連携コード';
COMMENT ON COLUMN mng_payment_methods.honten_delivery_charge IS '本店代引手数料';
COMMENT ON COLUMN mng_payment_methods.honten_payment_charge IS '本店決済手数料';
COMMENT ON COLUMN mng_payment_methods.rakuten_delivery_charge IS '楽天市場代引手数料';
COMMENT ON COLUMN mng_payment_methods.rakuten_payment_charge IS '楽天市場決済手数料';
COMMENT ON COLUMN mng_payment_methods.yahoo_delivery_charge IS 'Yahoo!ショッピング代引手数料';
COMMENT ON COLUMN mng_payment_methods.yahoo_payment_charge IS 'Yahoo!ショッピング決済手数料';
COMMENT ON COLUMN mng_payment_methods.fax_delivery_charge IS 'FAX注文代引手数料';
COMMENT ON COLUMN mng_payment_methods.fax_payment_charge IS 'FAX注文決済手数料';
COMMENT ON COLUMN mng_payment_methods.delivery_charge_tax_rate IS '代引手数料消費税率';
COMMENT ON COLUMN mng_payment_methods.payment_charge_tax_rate IS '決済手数料消費税率';
COMMENT ON COLUMN mng_payment_methods.is_cash_on_delivery IS '代引フラグ';
COMMENT ON COLUMN mng_payment_methods.is_directly_shippable IS '直送可能フラグ';
COMMENT ON COLUMN mng_payment_methods.is_preshipping_payment IS '出荷前入金フラグ';
COMMENT ON COLUMN mng_payment_methods.rank IS '表示順';
COMMENT ON COLUMN mng_payment_methods.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mng_payment_methods.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_payment_methods.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_payment_methods.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_payment_methods.created_at IS '作成日時';
COMMENT ON COLUMN mng_payment_methods.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_payment_methods.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_payment_methods.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_payment_methods.updated_at IS '更新日時';
COMMENT ON COLUMN mng_payment_methods.is_deleted IS '削除区分';
COMMENT ON COLUMN mng_payment_methods.deleted_description IS '削除備考';
COMMENT ON COLUMN mng_payment_methods.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mng_payment_methods.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mng_payment_methods.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mng_payment_methods.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_payment_methods FOR EACH ROW EXECUTE FUNCTION set_updated_at();