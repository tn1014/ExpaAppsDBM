-- Table: mst_suppliers
-- Table: mst_suppliers_history

DROP TABLE IF EXISTS mst_suppliers;
DROP TABLE IF EXISTS mst_suppliers_history;

CREATE TABLE IF NOT EXISTS mst_suppliers
(
		id BIGSERIAL
	,	supplier_code TEXT NOT NULL
	,	kiracs_supplier_code TEXT NOT NULL
	,	contract_type TEXT NOT NULL
	,	order_type TEXT NOT NULL
	,	supplier_name TEXT NOT NULL
	,	kiracs_supplier_name TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	short_name_kana TEXT NOT NULL
	,	office_zip_code01 TEXT NOT NULL
	,	office_zip_code02 TEXT NOT NULL
	,	office_pref_code TEXT NOT NULL
	,	office_addr01 TEXT NOT NULL
	,	office_addr02 TEXT NOT NULL
	,	office_addr03 TEXT NOT NULL
	,	office_tel01 TEXT NOT NULL
	,	office_tel02 TEXT NOT NULL
	,	office_tel03 TEXT NOT NULL
	,	office_fax01 TEXT NOT NULL
	,	office_fax02 TEXT NOT NULL
	,	office_fax03 TEXT NOT NULL
	,	office_email TEXT NOT NULL
	,	site_url TEXT NOT NULL
	,	order_closing_time INTEGER
	,	order_conditions TEXT NOT NULL
	,	shipment_location TEXT NOT NULL
	,	products TEXT NOT NULL
	,	open_time INTEGER
	,	close_time INTEGER
	,	regular_holidays TEXT NOT NULL
	,	charge_person TEXT NOT NULL
	,	charge_person_kana TEXT NOT NULL
	,	charge_position TEXT NOT NULL
	,	charge_dept TEXT NOT NULL
	,	charge_tel01 TEXT NOT NULL
	,	charge_tel02 TEXT NOT NULL
	,	charge_tel03 TEXT NOT NULL
	,	charge_email TEXT NOT NULL
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
	,	CONSTRAINT mst_suppliers_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_suppliers OWNER to expa_apps;

COMMENT ON TABLE mst_suppliers
	IS '仕入先マスタ';
COMMENT ON COLUMN mst_suppliers.id IS '仕入先ID';
COMMENT ON COLUMN mst_suppliers.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mst_suppliers.kiracs_supplier_code IS 'キラックス仕入先コード';
COMMENT ON COLUMN mst_suppliers.contract_type IS '契約形態(キラックス/エクスパッケージ/グループ会社)';
COMMENT ON COLUMN mst_suppliers.order_type IS '発注方法';
COMMENT ON COLUMN mst_suppliers.supplier_name IS '仕入先名';
COMMENT ON COLUMN mst_suppliers.kiracs_supplier_name IS 'キラックス仕入先名';
COMMENT ON COLUMN mst_suppliers.short_name IS '仕入先名略称';
COMMENT ON COLUMN mst_suppliers.short_name_kana IS '仕入先名略称(カナ)';
COMMENT ON COLUMN mst_suppliers.office_zip_code01 IS '郵便番号1';
COMMENT ON COLUMN mst_suppliers.office_zip_code02 IS '郵便番号2';
COMMENT ON COLUMN mst_suppliers.office_pref_code IS '都道府県コード';
COMMENT ON COLUMN mst_suppliers.office_addr01 IS '住所1';
COMMENT ON COLUMN mst_suppliers.office_addr02 IS '住所2';
COMMENT ON COLUMN mst_suppliers.office_addr03 IS '住所3';
COMMENT ON COLUMN mst_suppliers.office_tel01 IS '電話番号1';
COMMENT ON COLUMN mst_suppliers.office_tel02 IS '電話番号2';
COMMENT ON COLUMN mst_suppliers.office_tel03 IS '電話番号3';
COMMENT ON COLUMN mst_suppliers.office_fax01 IS 'FAX1';
COMMENT ON COLUMN mst_suppliers.office_fax02 IS 'FAX2';
COMMENT ON COLUMN mst_suppliers.office_fax03 IS 'FAX3';
COMMENT ON COLUMN mst_suppliers.office_email IS '問い合わせ・発注メールアドレス';
COMMENT ON COLUMN mst_suppliers.site_url IS 'ホームページURL';
COMMENT ON COLUMN mst_suppliers.order_closing_time IS '発注締時間';
COMMENT ON COLUMN mst_suppliers.order_conditions IS '発注条件';
COMMENT ON COLUMN mst_suppliers.shipment_location IS '出荷場所';
COMMENT ON COLUMN mst_suppliers.products IS '取扱商品';
COMMENT ON COLUMN mst_suppliers.open_time IS '営業開始時間';
COMMENT ON COLUMN mst_suppliers.close_time IS '営業終了時間';
COMMENT ON COLUMN mst_suppliers.regular_holidays IS '定休曜日';
COMMENT ON COLUMN mst_suppliers.charge_person IS '営業担当者';
COMMENT ON COLUMN mst_suppliers.charge_person_kana IS '営業担当者(カナ)';
COMMENT ON COLUMN mst_suppliers.charge_position IS '営業担当者役職';
COMMENT ON COLUMN mst_suppliers.charge_dept IS '営業担当者部署';
COMMENT ON COLUMN mst_suppliers.charge_tel01 IS '営業担当者電話番号1';
COMMENT ON COLUMN mst_suppliers.charge_tel02 IS '営業担当者電話番号2';
COMMENT ON COLUMN mst_suppliers.charge_tel03 IS '営業担当者電話番号3';
COMMENT ON COLUMN mst_suppliers.charge_email IS '営業担当者メールアドレス';
COMMENT ON COLUMN mst_suppliers.rank IS '表示順';
COMMENT ON COLUMN mst_suppliers.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_suppliers.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_suppliers.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_suppliers.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_suppliers.created_at IS '作成日時';
COMMENT ON COLUMN mst_suppliers.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_suppliers.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_suppliers.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_suppliers.updated_at IS '更新日時';
COMMENT ON COLUMN mst_suppliers.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_suppliers.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_suppliers.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_suppliers.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_suppliers.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_suppliers.deleted_at IS '削除日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS mst_suppliers_history
(
		id BIGSERIAL
	,	supplier_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	kiracs_supplier_code TEXT NOT NULL
	,	contract_type TEXT NOT NULL
	,	order_type TEXT NOT NULL
	,	supplier_name TEXT NOT NULL
	,	kiracs_supplier_name TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	short_name_kana TEXT NOT NULL
	,	office_zip_code01 TEXT NOT NULL
	,	office_zip_code02 TEXT NOT NULL
	,	office_pref_code TEXT NOT NULL
	,	office_addr01 TEXT NOT NULL
	,	office_addr02 TEXT NOT NULL
	,	office_addr03 TEXT NOT NULL
	,	office_tel01 TEXT NOT NULL
	,	office_tel02 TEXT NOT NULL
	,	office_tel03 TEXT NOT NULL
	,	office_fax01 TEXT NOT NULL
	,	office_fax02 TEXT NOT NULL
	,	office_fax03 TEXT NOT NULL
	,	office_email TEXT NOT NULL
	,	site_url TEXT NOT NULL
	,	order_closing_time INTEGER
	,	order_conditions TEXT NOT NULL
	,	shipment_location TEXT NOT NULL
	,	products TEXT NOT NULL
	,	open_time INTEGER
	,	close_time INTEGER
	,	regular_holidays TEXT NOT NULL
	,	charge_person TEXT NOT NULL
	,	charge_person_kana TEXT NOT NULL
	,	charge_position TEXT NOT NULL
	,	charge_dept TEXT NOT NULL
	,	charge_tel01 TEXT NOT NULL
	,	charge_tel02 TEXT NOT NULL
	,	charge_tel03 TEXT NOT NULL
	,	charge_email TEXT NOT NULL
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
	,	CONSTRAINT mst_suppliers_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE mst_suppliers_history
	IS '[履歴]仕入先マスタ';
COMMENT ON COLUMN mst_suppliers_history.id IS '仕入先ID';
COMMENT ON COLUMN mst_suppliers_history.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mst_suppliers_history.history_count IS '更新回数';
COMMENT ON COLUMN mst_suppliers_history.kiracs_supplier_code IS 'キラックス仕入先コード';
COMMENT ON COLUMN mst_suppliers_history.contract_type IS '契約形態(キラックス/エクスパッケージ/グループ会社)';
COMMENT ON COLUMN mst_suppliers_history.order_type IS '発注方法';
COMMENT ON COLUMN mst_suppliers_history.supplier_name IS '仕入先名';
COMMENT ON COLUMN mst_suppliers_history.kiracs_supplier_name IS 'キラックス仕入先名';
COMMENT ON COLUMN mst_suppliers_history.short_name IS '仕入先名略称';
COMMENT ON COLUMN mst_suppliers_history.short_name_kana IS '仕入先名略称(カナ)';
COMMENT ON COLUMN mst_suppliers_history.office_zip_code01 IS '郵便番号1';
COMMENT ON COLUMN mst_suppliers_history.office_zip_code02 IS '郵便番号2';
COMMENT ON COLUMN mst_suppliers_history.office_pref_code IS '都道府県コード';
COMMENT ON COLUMN mst_suppliers_history.office_addr01 IS '住所1';
COMMENT ON COLUMN mst_suppliers_history.office_addr02 IS '住所2';
COMMENT ON COLUMN mst_suppliers_history.office_addr03 IS '住所3';
COMMENT ON COLUMN mst_suppliers_history.office_tel01 IS '電話番号1';
COMMENT ON COLUMN mst_suppliers_history.office_tel02 IS '電話番号2';
COMMENT ON COLUMN mst_suppliers_history.office_tel03 IS '電話番号3';
COMMENT ON COLUMN mst_suppliers_history.office_fax01 IS 'FAX1';
COMMENT ON COLUMN mst_suppliers_history.office_fax02 IS 'FAX2';
COMMENT ON COLUMN mst_suppliers_history.office_fax03 IS 'FAX3';
COMMENT ON COLUMN mst_suppliers_history.office_email IS '問い合わせ・発注メールアドレス';
COMMENT ON COLUMN mst_suppliers_history.site_url IS 'ホームページURL';
COMMENT ON COLUMN mst_suppliers_history.order_closing_time IS '発注締時間';
COMMENT ON COLUMN mst_suppliers_history.order_conditions IS '発注条件';
COMMENT ON COLUMN mst_suppliers_history.shipment_location IS '出荷場所';
COMMENT ON COLUMN mst_suppliers_history.products IS '取扱商品';
COMMENT ON COLUMN mst_suppliers_history.open_time IS '営業開始時間';
COMMENT ON COLUMN mst_suppliers_history.close_time IS '営業終了時間';
COMMENT ON COLUMN mst_suppliers_history.regular_holidays IS '定休曜日';
COMMENT ON COLUMN mst_suppliers_history.charge_person IS '営業担当者';
COMMENT ON COLUMN mst_suppliers_history.charge_person_kana IS '営業担当者(カナ)';
COMMENT ON COLUMN mst_suppliers_history.charge_position IS '営業担当者役職';
COMMENT ON COLUMN mst_suppliers_history.charge_dept IS '営業担当者部署';
COMMENT ON COLUMN mst_suppliers_history.charge_tel01 IS '営業担当者電話番号1';
COMMENT ON COLUMN mst_suppliers_history.charge_tel02 IS '営業担当者電話番号2';
COMMENT ON COLUMN mst_suppliers_history.charge_tel03 IS '営業担当者電話番号3';
COMMENT ON COLUMN mst_suppliers_history.charge_email IS '営業担当者メールアドレス';
COMMENT ON COLUMN mst_suppliers_history.rank IS '表示順';
COMMENT ON COLUMN mst_suppliers_history.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_suppliers_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_suppliers_history.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_suppliers_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_suppliers_history.created_at IS '作成日時';
COMMENT ON COLUMN mst_suppliers_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_suppliers_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_suppliers_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_suppliers_history.updated_at IS '更新日時';
COMMENT ON COLUMN mst_suppliers_history.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_suppliers_history.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_suppliers_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_suppliers_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_suppliers_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_suppliers_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS mst_suppliers_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_suppliers FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_mst_suppliers_trigger AFTER INSERT OR UPDATE ON mst_suppliers FOR EACH ROW EXECUTE FUNCTION insert_mst_suppliers_history();

