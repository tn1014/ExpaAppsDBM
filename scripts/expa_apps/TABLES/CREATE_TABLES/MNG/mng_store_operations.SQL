-- Table: mng_store_operations;

DROP TABLE IF EXISTS mng_store_operations;

CREATE TABLE IF NOT EXISTS mng_store_operations
(
		id BIGSERIAL
	,	purchase_slip_detail_count SMALLINT NOT NULL DEFAULT 0
	,	persons_address_delivery_method_code TEXT NOT NULL
	,	corporations_address_delivery_method_code TEXT NOT NULL
	,	isolated_island_delivery_method_code TEXT NOT NULL
	,	default_address_div TEXT NOT NULL
	,	settlement_closing_month TEXT NOT NULL
	,	settlement_closing_date TEXT NOT NULL
	,	inventory_closing_month TEXT NOT NULL
	,	inventory_closing_date TEXT NOT NULL
	,	monthly_inventory_closing_date TEXT NOT NULL
	,	inventory_location_code TEXT NOT NULL
	,	inventory_delivery_destination_code TEXT NOT NULL
	,	order_closing_time INTEGER NOT NULL
	,	confirmed_order_closing_time INTEGER NOT NULL
	,	picking_closing_time INTEGER NOT NULL
	,	shipment_closing_time INTEGER NOT NULL
	,	included_tax_div TEXT NOT NULL
	,	tax_rounding_div TEXT NOT NULL
	,	kiracs_purchase_charge_name TEXT NOT NULL
	,	kiracs_purchase_charge_code TEXT NOT NULL
	,	contact_company_name TEXT NOT NULL
	,	contact_tel01 TEXT NOT NULL
	,	contact_tel02 TEXT NOT NULL
	,	contact_tel03 TEXT NOT NULL
	,	contact_fax01 TEXT NOT NULL
	,	contact_fax02 TEXT NOT NULL
	,	contact_fax03 TEXT NOT NULL
	,	contact_email TEXT NOT NULL
	,	is_required_print_receipt_honten BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_print_delivery_slip_honten BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_print_receipt_rakuten BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_print_delivery_slip_rakuten BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_print_receipt_yahoo BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_print_delivery_slip_yahoo BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_print_receipt_fax BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_print_delivery_slip_fax BOOLEAN NOT NULL DEFAULT FALSE
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT mng_store_operations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mng_store_operations OWNER to expa_apps;

COMMENT ON TABLE mng_store_operations
	IS '店舗運用情報';
COMMENT ON COLUMN mng_store_operations.id IS '店舗運用ID';
COMMENT ON COLUMN mng_store_operations.purchase_slip_detail_count IS '発注伝票明細数';
COMMENT ON COLUMN mng_store_operations.persons_address_delivery_method_code IS '個人宛配送方法コード';
COMMENT ON COLUMN mng_store_operations.corporations_address_delivery_method_code IS '法人宛配送方法コード';
COMMENT ON COLUMN mng_store_operations.isolated_island_delivery_method_code IS '離島/特別地域配送方法コード';
COMMENT ON COLUMN mng_store_operations.default_address_div IS '初期宛先区分';
COMMENT ON COLUMN mng_store_operations.settlement_closing_month IS '決算月';
COMMENT ON COLUMN mng_store_operations.settlement_closing_date IS '決算日';
COMMENT ON COLUMN mng_store_operations.inventory_closing_month IS '棚卸月';
COMMENT ON COLUMN mng_store_operations.inventory_closing_date IS '棚卸日';
COMMENT ON COLUMN mng_store_operations.monthly_inventory_closing_date IS '月次在庫締日';
COMMENT ON COLUMN mng_store_operations.inventory_location_code IS '在庫場所コード';
COMMENT ON COLUMN mng_store_operations.inventory_delivery_destination_code IS '在庫場所納品先番号';
COMMENT ON COLUMN mng_store_operations.order_closing_time IS '発注締時間';
COMMENT ON COLUMN mng_store_operations.confirmed_order_closing_time IS '受注確認締時間';
COMMENT ON COLUMN mng_store_operations.picking_closing_time IS 'ピッキング作業締時間';
COMMENT ON COLUMN mng_store_operations.shipment_closing_time IS '出荷締時間';
COMMENT ON COLUMN mng_store_operations.included_tax_div IS '内税・外税区分';
COMMENT ON COLUMN mng_store_operations.tax_rounding_div IS '消費税端数処理区分';
COMMENT ON COLUMN mng_store_operations.kiracs_purchase_charge_name IS 'キラックス発注担当者名';
COMMENT ON COLUMN mng_store_operations.kiracs_purchase_charge_code IS 'キラックス発注担当者コード';
COMMENT ON COLUMN mng_store_operations.contact_company_name IS '発注書用会社名';
COMMENT ON COLUMN mng_store_operations.contact_tel01 IS '発注書用連絡先電話番号01';
COMMENT ON COLUMN mng_store_operations.contact_tel02 IS '発注書用連絡先電話番号02';
COMMENT ON COLUMN mng_store_operations.contact_tel03 IS '発注書用連絡先電話番号03';
COMMENT ON COLUMN mng_store_operations.contact_fax01 IS '発注書用連絡先FAX番号01';
COMMENT ON COLUMN mng_store_operations.contact_fax02 IS '発注書用連絡先FAX番号02';
COMMENT ON COLUMN mng_store_operations.contact_fax03 IS '発注書用連絡先FAX番号03';
COMMENT ON COLUMN mng_store_operations.contact_email IS '発注書用連絡先メールアドレス';
COMMENT ON COLUMN mng_store_operations.is_required_print_receipt_honten IS '本店領収書発行要否';
COMMENT ON COLUMN mng_store_operations.is_required_print_delivery_slip_honten IS '本店納品書発行要否';
COMMENT ON COLUMN mng_store_operations.is_required_print_receipt_rakuten IS '楽天市場領収書発行要否';
COMMENT ON COLUMN mng_store_operations.is_required_print_delivery_slip_rakuten IS '楽天市場納品書発行要否';
COMMENT ON COLUMN mng_store_operations.is_required_print_receipt_yahoo IS 'Yahoo!ショッピング領収書発行要否';
COMMENT ON COLUMN mng_store_operations.is_required_print_delivery_slip_yahoo IS 'Yahoo!ショッピング納品書発行要否';
COMMENT ON COLUMN mng_store_operations.is_required_print_receipt_fax IS 'FAX注文領収書発行要否';
COMMENT ON COLUMN mng_store_operations.is_required_print_delivery_slip_fax IS 'FAX注文納品書発行要否';
COMMENT ON COLUMN mng_store_operations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_store_operations.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_store_operations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_store_operations.created_at IS '作成日時';
COMMENT ON COLUMN mng_store_operations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_store_operations.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_store_operations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_store_operations.updated_at IS '更新日時';

CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_store_operations FOR EACH ROW EXECUTE FUNCTION set_updated_at();