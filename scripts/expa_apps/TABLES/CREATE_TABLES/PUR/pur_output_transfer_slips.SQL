-- Table: pur_output_transfer_slips

DROP TABLE IF EXISTS pur_output_transfer_slips;

CREATE TABLE IF NOT EXISTS pur_output_transfer_slips
(
		id BIGSERIAL
	,	purchase_slip_no TEXT NOT NULL
	,	purchase_on DATE NOT NULL
	,	supplier_code TEXT NOT NULL
	,	supplier_name TEXT NOT NULL
	,	supplier_short_name TEXT NOT NULL
	,	arrival_scheduled_on DATE
	,	purchase_employee_code TEXT NOT NULL
	,	purchase_employee_name TEXT NOT NULL
	,	purchase_charge_code TEXT NOT NULL
	,	purchase_charge_name TEXT NOT NULL
	,	company_name TEXT NOT NULL
	,	contact_tel01 TEXT NOT NULL
	,	contact_tel02 TEXT NOT NULL
	,	contact_tel03 TEXT NOT NULL
	,	contact_fax01 TEXT NOT NULL
	,	contact_fax02 TEXT NOT NULL
	,	contact_fax03 TEXT NOT NULL
	,	contact_email TEXT NOT NULL
	,	shipment_location_code TEXT NOT NULL
	,	shipment_location_name TEXT NOT NULL
	,	shipment_location_short_name TEXT NOT NULL
	,	carry_location_code01 TEXT NOT NULL
	,	carry_location_name01 TEXT NOT NULL
	,	carry_location_short_name01 TEXT NOT NULL
	,	carry_location_code02 TEXT NOT NULL
	,	carry_location_name02 TEXT NOT NULL
	,	carry_location_short_name02 TEXT NOT NULL
	,	carry_location_code03 TEXT NOT NULL
	,	carry_location_name03 TEXT NOT NULL
	,	carry_location_short_name03 TEXT NOT NULL
	,	carry_location_code04 TEXT NOT NULL
	,	carry_location_name04 TEXT NOT NULL
	,	carry_location_short_name04 TEXT NOT NULL
	,	carry_location_code05 TEXT NOT NULL
	,	carry_location_name05 TEXT NOT NULL
	,	carry_location_short_name05 TEXT NOT NULL
	,	delivery_location_code TEXT NOT NULL
	,	delivery_location_name TEXT NOT NULL
	,	delivery_location_short_name TEXT NOT NULL
	,	slip_description01 TEXT NOT NULL
	,	slip_description02 TEXT NOT NULL
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
	,	CONSTRAINT pur_output_transfer_slips_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS pur_output_transfer_slips OWNER to expa_apps;

COMMENT ON TABLE pur_output_transfer_slips
	IS '移動依頼伝票発行テーブル';
COMMENT ON COLUMN pur_output_transfer_slips.id IS '移動依頼伝票発行ID';
COMMENT ON COLUMN pur_output_transfer_slips.purchase_slip_no IS '発注伝票番号';
COMMENT ON COLUMN pur_output_transfer_slips.purchase_on IS '発注日';
COMMENT ON COLUMN pur_output_transfer_slips.supplier_code IS '仕入先コード';
COMMENT ON COLUMN pur_output_transfer_slips.supplier_name IS '仕入先名';
COMMENT ON COLUMN pur_output_transfer_slips.supplier_short_name IS '仕入先略称';
COMMENT ON COLUMN pur_output_transfer_slips.arrival_scheduled_on IS '入荷予定日';
COMMENT ON COLUMN pur_output_transfer_slips.purchase_employee_code IS '発注社員コード';
COMMENT ON COLUMN pur_output_transfer_slips.purchase_employee_name IS '発注社員名';
COMMENT ON COLUMN pur_output_transfer_slips.purchase_charge_code IS '発注担当者コード';
COMMENT ON COLUMN pur_output_transfer_slips.purchase_charge_name IS '発注担当者名';
COMMENT ON COLUMN pur_output_transfer_slips.company_name IS '会社名';
COMMENT ON COLUMN pur_output_transfer_slips.contact_tel01 IS '連絡先電話番号1';
COMMENT ON COLUMN pur_output_transfer_slips.contact_tel02 IS '連絡先電話番号2';
COMMENT ON COLUMN pur_output_transfer_slips.contact_tel03 IS '連絡先電話番号3';
COMMENT ON COLUMN pur_output_transfer_slips.contact_fax01 IS '連絡先FAX番号1';
COMMENT ON COLUMN pur_output_transfer_slips.contact_fax02 IS '連絡先FAX番号2';
COMMENT ON COLUMN pur_output_transfer_slips.contact_fax03 IS '連絡先FAX番号3';
COMMENT ON COLUMN pur_output_transfer_slips.contact_email IS '連絡先メールアドレス';
COMMENT ON COLUMN pur_output_transfer_slips.shipment_location_code IS '移動元場所コード';
COMMENT ON COLUMN pur_output_transfer_slips.shipment_location_name IS '移動元場所名';
COMMENT ON COLUMN pur_output_transfer_slips.shipment_location_short_name IS '移動元場所略称';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_code01 IS '経由場所コード1';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_name01 IS '経由場所名1';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_short_name01 IS '経由場所略称1';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_code02 IS '経由場所コード2';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_name02 IS '経由場所名2';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_short_name02 IS '経由場所略称2';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_code03 IS '経由場所コード3';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_name03 IS '経由場所名3';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_short_name03 IS '経由場所略称3';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_code04 IS '経由場所コード4';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_name04 IS '経由場所名4';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_short_name04 IS '経由場所略称4';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_code05 IS '経由場所コード5';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_name05 IS '経由場所名5';
COMMENT ON COLUMN pur_output_transfer_slips.carry_location_short_name05 IS '経由場所略称5';
COMMENT ON COLUMN pur_output_transfer_slips.delivery_location_code  IS '納品場所コード';
COMMENT ON COLUMN pur_output_transfer_slips.delivery_location_name IS '納品場所名';
COMMENT ON COLUMN pur_output_transfer_slips.delivery_location_short_name IS '納品場所略称';
COMMENT ON COLUMN pur_output_transfer_slips.slip_description01 IS '伝票備考1';
COMMENT ON COLUMN pur_output_transfer_slips.slip_description02 IS '伝票備考2';
COMMENT ON COLUMN pur_output_transfer_slips.first_outputed_at  IS '初回発行日時';
COMMENT ON COLUMN pur_output_transfer_slips.latest_outputed_at IS '最新発行日時';
COMMENT ON COLUMN pur_output_transfer_slips.outputed_count  IS '出力回数';
COMMENT ON COLUMN pur_output_transfer_slips.is_outputed  IS '出力フラグ';
COMMENT ON COLUMN pur_output_transfer_slips.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN pur_output_transfer_slips.created_terminal IS '作成端末';
COMMENT ON COLUMN pur_output_transfer_slips.created_function_code IS '作成機能コード';
COMMENT ON COLUMN pur_output_transfer_slips.created_at IS '作成日時';
COMMENT ON COLUMN pur_output_transfer_slips.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN pur_output_transfer_slips.updated_terminal IS '更新端末';
COMMENT ON COLUMN pur_output_transfer_slips.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN pur_output_transfer_slips.updated_at IS '更新日時';
COMMENT ON COLUMN pur_output_transfer_slips.is_deleted IS '削除区分';
COMMENT ON COLUMN pur_output_transfer_slips.deleted_description IS '削除備考';
COMMENT ON COLUMN pur_output_transfer_slips.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN pur_output_transfer_slips.deleted_terminal IS '削除端末';
COMMENT ON COLUMN pur_output_transfer_slips.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN pur_output_transfer_slips.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON pur_output_transfer_slips FOR EACH ROW EXECUTE FUNCTION set_updated_at();