-- Table: shp_direct_results
-- Table: shp_direct_results_history

DROP TABLE IF EXISTS shp_direct_results;
DROP TABLE IF EXISTS shp_direct_results_history;

CREATE TABLE IF NOT EXISTS shp_direct_results
(
		id BIGSERIAL
	,	direct_schedule_id BIGINT
	,	purchase_slip_no TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	supplier_name TEXT NOT NULL
	,	shipment_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	is_partical_shipment BOOLEAN NOT NULL DEFAULT FALSE
	,	packages_count INTEGER NOT NULL DEFAULT 0
	,	delivery_method_code TEXT NOT NULL
	,	delivery_method TEXT NOT NULL
	,	delivery_slip_printed_count INTEGER NOT NULL DEFAULT 0
	,	invoice_slip_printed_count INTEGER NOT NULL DEFAULT 0
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
	,	CONSTRAINT shp_direct_results_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_direct_results OWNER to expa_apps;

COMMENT ON TABLE shp_direct_results
	IS '直送出荷実績テーブル';
COMMENT ON COLUMN shp_direct_results.id IS '直送出荷実績ID';
COMMENT ON COLUMN shp_direct_results.direct_schedule_id IS '直送出荷予定ID';
COMMENT ON COLUMN shp_direct_results.purchase_slip_no IS '直送発注番号';
COMMENT ON COLUMN shp_direct_results.supplier_code IS '仕入先コード';
COMMENT ON COLUMN shp_direct_results.supplier_name IS '仕入先名';
COMMENT ON COLUMN shp_direct_results.shipment_at IS '出荷日時';
COMMENT ON COLUMN shp_direct_results.is_isolated_island IS '離島送付先フラグ';
COMMENT ON COLUMN shp_direct_results.is_partical_shipment IS '分納フラグ';
COMMENT ON COLUMN shp_direct_results.packages_count IS '出荷個口数';
COMMENT ON COLUMN shp_direct_results.delivery_method_code IS '配送方法コード';
COMMENT ON COLUMN shp_direct_results.delivery_method IS '配送方法';
COMMENT ON COLUMN shp_direct_results.delivery_slip_printed_count IS '納品書出力回数';
COMMENT ON COLUMN shp_direct_results.invoice_slip_printed_count IS '領収書出力回数';
COMMENT ON COLUMN shp_direct_results.sender_name IS '送付者名';
COMMENT ON COLUMN shp_direct_results.sender_charge_name IS '担当者名';
COMMENT ON COLUMN shp_direct_results.sender_tel01 IS '送付者TEL1';
COMMENT ON COLUMN shp_direct_results.sender_tel02 IS '送付者TEL2';
COMMENT ON COLUMN shp_direct_results.sender_tel03 IS '送付者TEL3';
COMMENT ON COLUMN shp_direct_results.sender_zip01 IS '送付者郵便番号1';
COMMENT ON COLUMN shp_direct_results.sender_zip02 IS '送付者郵便番号2';
COMMENT ON COLUMN shp_direct_results.sender_pref_code IS '送付者都道府県コード';
COMMENT ON COLUMN shp_direct_results.sender_pref IS '送付者都道府県';
COMMENT ON COLUMN shp_direct_results.sender_addr01 IS '送付者住所1';
COMMENT ON COLUMN shp_direct_results.sender_addr02 IS '送付者住所2';
COMMENT ON COLUMN shp_direct_results.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_direct_results.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_direct_results.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_direct_results.created_at IS '作成日時';
COMMENT ON COLUMN shp_direct_results.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_direct_results.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_direct_results.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_direct_results.updated_at IS '更新日時';
COMMENT ON COLUMN shp_direct_results.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_direct_results.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_direct_results.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_direct_results.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_direct_results.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_direct_results.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS shp_direct_results_history
(
		id BIGSERIAL
	,	direct_result_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	direct_schedule_id BIGINT
	,	purchase_slip_no TEXT NOT NULL
	,	supplier_code TEXT NOT NULL
	,	supplier_name TEXT NOT NULL
	,	shipment_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	is_partical_shipment BOOLEAN NOT NULL DEFAULT FALSE
	,	packages_count INTEGER NOT NULL DEFAULT 0
	,	delivery_method_code TEXT NOT NULL
	,	delivery_method TEXT NOT NULL
	,	delivery_slip_printed_count INTEGER NOT NULL DEFAULT 0
	,	invoice_slip_printed_count INTEGER NOT NULL DEFAULT 0
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
	,	CONSTRAINT shp_direct_results_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_direct_results_history OWNER to expa_apps;

COMMENT ON TABLE shp_direct_results_history
	IS '[履歴]直送出荷実績テーブル';
COMMENT ON COLUMN shp_direct_results_history.id IS '履歴ID';
COMMENT ON COLUMN shp_direct_results_history.direct_result_id IS '直送出荷実績ID';
COMMENT ON COLUMN shp_direct_results_history.history_count IS '更新回数';
COMMENT ON COLUMN shp_direct_results_history.direct_schedule_id IS '直送出荷予定ID';
COMMENT ON COLUMN shp_direct_results_history.purchase_slip_no IS '直送発注番号';
COMMENT ON COLUMN shp_direct_results_history.supplier_code IS '仕入先コード';
COMMENT ON COLUMN shp_direct_results_history.supplier_name IS '仕入先名';
COMMENT ON COLUMN shp_direct_results_history.shipment_at IS '出荷日時';
COMMENT ON COLUMN shp_direct_results_history.is_isolated_island IS '離島送付先フラグ';
COMMENT ON COLUMN shp_direct_results_history.is_partical_shipment IS '分納フラグ';
COMMENT ON COLUMN shp_direct_results_history.packages_count IS '出荷個口数';
COMMENT ON COLUMN shp_direct_results_history.delivery_method_code IS '配送方法コード';
COMMENT ON COLUMN shp_direct_results_history.delivery_method IS '配送方法';
COMMENT ON COLUMN shp_direct_results_history.delivery_slip_printed_count IS '納品書出力回数';
COMMENT ON COLUMN shp_direct_results_history.invoice_slip_printed_count IS '領収書出力回数';
COMMENT ON COLUMN shp_direct_results_history.sender_name IS '送付者名';
COMMENT ON COLUMN shp_direct_results_history.sender_charge_name IS '担当者名';
COMMENT ON COLUMN shp_direct_results_history.sender_tel01 IS '送付者TEL1';
COMMENT ON COLUMN shp_direct_results_history.sender_tel02 IS '送付者TEL2';
COMMENT ON COLUMN shp_direct_results_history.sender_tel03 IS '送付者TEL3';
COMMENT ON COLUMN shp_direct_results_history.sender_zip01 IS '送付者郵便番号1';
COMMENT ON COLUMN shp_direct_results_history.sender_zip02 IS '送付者郵便番号2';
COMMENT ON COLUMN shp_direct_results_history.sender_pref_code IS '送付者都道府県コード';
COMMENT ON COLUMN shp_direct_results_history.sender_pref IS '送付者都道府県';
COMMENT ON COLUMN shp_direct_results_history.sender_addr01 IS '送付者住所1';
COMMENT ON COLUMN shp_direct_results_history.sender_addr02 IS '送付者住所2';
COMMENT ON COLUMN shp_direct_results_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_direct_results_history.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_direct_results_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_direct_results_history.created_at IS '作成日時';
COMMENT ON COLUMN shp_direct_results_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_direct_results_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_direct_results_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_direct_results_history.updated_at IS '更新日時';
COMMENT ON COLUMN shp_direct_results_history.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_direct_results_history.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_direct_results_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_direct_results_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_direct_results_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_direct_results_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_direct_results FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_shp_direct_results_trigger AFTER INSERT OR UPDATE ON shp_direct_results FOR EACH ROW EXECUTE FUNCTION insert_shp_direct_results_history();