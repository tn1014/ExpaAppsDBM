-- Table: pur_output_direct_order_slips

DROP TABLE IF EXISTS pur_output_direct_order_slips;

CREATE TABLE IF NOT EXISTS pur_output_direct_order_slips
(
		id BIGSERIAL
	,	print_format_type TEXT NOT NULL
	,	purchase_slip_no TEXT NOT NULL
	,	order_id BIGINT NOT NULL
	,	package_id	 BIGINT NOT NULL
	,	package_shipment_id BIGINT NOT NULL
	,	order_slip_no TEXT NOT NULL
	,	ordered_on DATE NOT NULL
	,	purchase_on DATE NOT NULL
	,	delivery_destination_code TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	supplier_name TEXT NOT NULL
	,	supplier_short_name TEXT NOT NULL
	,	delivery_scheduled_on DATE
	,	delivery_scheduled_time_code TEXT NOT NULL
	,	delivery_scheduled_time TEXT NOT NULL
	,	purchase_employee_code TEXT NOT NULL
	,	purchase_employee_name TEXT NOT NULL
	,	purchase_charge_code TEXT NOT NULL
	,	purchase_charge_name TEXT NOT NULL
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
	,	company_name TEXT NOT NULL
	,	contact_tel01 TEXT NOT NULL
	,	contact_tel02 TEXT NOT NULL
	,	contact_tel03 TEXT NOT NULL
	,	contact_fax01 TEXT NOT NULL
	,	contact_fax02 TEXT NOT NULL
	,	contact_fax03 TEXT NOT NULL
	,	contact_email TEXT NOT NULL
	,	slip_description TEXT NOT NULL
	,	first_outputed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	latest_outputed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	outputed_count SMALLINT NOT NULL DEFAULT 0
	,	is_outputed BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT pur_output_direct_order_slips_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_output_direct_order_slips OWNER to expa_apps;

COMMENT ON TABLE pur_output_direct_order_slips
	IS '直送伝票発行テーブル';
COMMENT ON COLUMN pur_output_direct_order_slips.id IS '直送伝票発行ID';
COMMENT ON COLUMN pur_output_direct_order_slips.print_format_type IS '印刷書式タイプ';
COMMENT ON COLUMN pur_output_direct_order_slips.purchase_slip_no IS '発注伝票番号';
COMMENT ON COLUMN pur_output_direct_order_slips.order_id IS '受注伝票ID';
COMMENT ON COLUMN pur_output_direct_order_slips.package_id IS '受注送付先ID';
COMMENT ON COLUMN pur_output_direct_order_slips.package_shipment_id IS '送付先出荷ID';
COMMENT ON COLUMN pur_output_direct_order_slips.order_slip_no IS '受注伝票番号';
COMMENT ON COLUMN pur_output_direct_order_slips.ordered_on IS '受注日';
COMMENT ON COLUMN pur_output_direct_order_slips.purchase_on IS '発注日';
COMMENT ON COLUMN pur_output_direct_order_slips.delivery_destination_code IS '納品先コード';
COMMENT ON COLUMN pur_output_direct_order_slips.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_output_direct_order_slips.supplier_name IS '仕入先名';
COMMENT ON COLUMN pur_output_direct_order_slips.supplier_short_name IS '仕入先略称';
COMMENT ON COLUMN pur_output_direct_order_slips.delivery_scheduled_on IS '納品予定日';
COMMENT ON COLUMN pur_output_direct_order_slips.delivery_scheduled_time_code IS '納品予定時間帯コード';
COMMENT ON COLUMN pur_output_direct_order_slips.delivery_scheduled_time IS '納品予定時間帯';
COMMENT ON COLUMN pur_output_direct_order_slips.purchase_employee_code IS '発注社員コード';
COMMENT ON COLUMN pur_output_direct_order_slips.purchase_employee_name IS '発注社員名';
COMMENT ON COLUMN pur_output_direct_order_slips.purchase_charge_code IS '発注担当者コード';
COMMENT ON COLUMN pur_output_direct_order_slips.purchase_charge_name IS '発注担当者名';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_name IS '送付先名';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_charge_name IS '送付先担当者名';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_tel01 IS '送付先電話番号1';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_tel02 IS '送付先電話番号2';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_tel03 IS '送付先電話番号3';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_zip01 IS '送付先郵便番号1';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_zip02 IS '送付先郵便番号2';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_pref_code IS '送付先都道府県コード';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_pref IS '送付先都道府県';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_addr01 IS '送付先住所1';
COMMENT ON COLUMN pur_output_direct_order_slips.sender_addr02 IS '送付先住所2';
COMMENT ON COLUMN pur_output_direct_order_slips.company_name IS '発注会社名';
COMMENT ON COLUMN pur_output_direct_order_slips.contact_tel01 IS '連絡先電話番号1';
COMMENT ON COLUMN pur_output_direct_order_slips.contact_tel02 IS '連絡先電話番号2';
COMMENT ON COLUMN pur_output_direct_order_slips.contact_tel03 IS '連絡先電話番号3';
COMMENT ON COLUMN pur_output_direct_order_slips.contact_fax01 IS '連絡先FAX番号1';
COMMENT ON COLUMN pur_output_direct_order_slips.contact_fax02 IS '連絡先FAX番号2';
COMMENT ON COLUMN pur_output_direct_order_slips.contact_fax03 IS '連絡先FAX番号3';
COMMENT ON COLUMN pur_output_direct_order_slips.contact_email  IS '連絡先メールアドレス';
COMMENT ON COLUMN pur_output_direct_order_slips.slip_description  IS '伝票備考';
COMMENT ON COLUMN pur_output_direct_order_slips.first_outputed_at  IS '初回出力日時';
COMMENT ON COLUMN pur_output_direct_order_slips.latest_outputed_at  IS '最新出力日時';
COMMENT ON COLUMN pur_output_direct_order_slips.outputed_count  IS '出力回数';
COMMENT ON COLUMN pur_output_direct_order_slips.is_outputed  IS '出力フラグ';
COMMENT ON COLUMN pur_output_direct_order_slips.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_output_direct_order_slips.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_output_direct_order_slips.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_output_direct_order_slips.created_at IS '作成日時';
COMMENT ON COLUMN pur_output_direct_order_slips.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_output_direct_order_slips.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_output_direct_order_slips.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_output_direct_order_slips.updated_at IS '更新日時';
COMMENT ON COLUMN pur_output_direct_order_slips.is_deleted IS '削除区分';
COMMENT ON COLUMN pur_output_direct_order_slips.deleted_description IS '削除備考';
COMMENT ON COLUMN pur_output_direct_order_slips.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN pur_output_direct_order_slips.deleted_terminal IS '削除端末';
COMMENT ON COLUMN pur_output_direct_order_slips.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN pur_output_direct_order_slips.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_output_direct_order_slips FOR EACH ROW EXECUTE FUNCTION set_updated_at();