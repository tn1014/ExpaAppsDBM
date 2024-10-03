-- Table: shp_schedules
-- Table: shp_schedules_history

DROP TABLE IF EXISTS shp_schedules;
DROP TABLE IF EXISTS shp_schedules_history;

CREATE TABLE IF NOT EXISTS shp_schedules
(
		id BIGSERIAL
	,	order_id BIGINT
	,	package_id BIGINT
	,	shipment_location_code TEXT NOT NULL
	,	shipment_location_name TEXT NOT NULL
	,	shipment_instructed_on DATE
	,	delivery_instructed_on DATE
	,	delivery_time_code TEXT NOT NULL
	,	delivery_time TEXT NOT NULL
	,	shipment_referenced_on DATE
	,	approved_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	completed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	is_partical_shipment BOOLEAN NOT NULL DEFAULT FALSE
	,	packages_count INTEGER NOT NULL DEFAULT 0
	,	delivery_method_code TEXT NOT NULL
	,	delivery_method TEXT NOT NULL
	,	is_required_delivery_slip BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_invoice_slip BOOLEAN NOT NULL DEFAULT FALSE
	,	picking_description TEXT NOT NULL 
	,	packing_description TEXT NOT NULL
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
	,	CONSTRAINT shp_schedules_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_schedules OWNER to expa_apps;

COMMENT ON TABLE shp_schedules
	IS '出荷予定テーブル';
COMMENT ON COLUMN shp_schedules.id IS '出荷予定ID';
COMMENT ON COLUMN shp_schedules.order_id IS '受注伝票ID';
COMMENT ON COLUMN shp_schedules.package_id IS '受注送付先ID';
COMMENT ON COLUMN shp_schedules.shipment_location_code IS '出荷場所コード';
COMMENT ON COLUMN shp_schedules.shipment_location_name IS '出荷場所';
COMMENT ON COLUMN shp_schedules.shipment_instructed_on IS '出荷日指定';
COMMENT ON COLUMN shp_schedules.delivery_instructed_on IS '着日指定';
COMMENT ON COLUMN shp_schedules.delivery_time_code IS '着時間指定コード';
COMMENT ON COLUMN shp_schedules.delivery_time IS '着時間指定';
COMMENT ON COLUMN shp_schedules.shipment_referenced_on IS '参考出荷日';
COMMENT ON COLUMN shp_schedules.approved_at IS '出荷承認日時';
COMMENT ON COLUMN shp_schedules.completed_at IS '全商品出荷完了日時';
COMMENT ON COLUMN shp_schedules.is_isolated_island IS '離島送付先フラグ';
COMMENT ON COLUMN shp_schedules.is_partical_shipment IS '分納フラグ';
COMMENT ON COLUMN shp_schedules.packages_count IS '出荷個口数';
COMMENT ON COLUMN shp_schedules.delivery_method_code IS '配送方法コード';
COMMENT ON COLUMN shp_schedules.delivery_method IS '配送方法';
COMMENT ON COLUMN shp_schedules.is_required_delivery_slip IS '納品書印刷要否';
COMMENT ON COLUMN shp_schedules.is_required_invoice_slip IS '領収書印刷要否';
COMMENT ON COLUMN shp_schedules.picking_description IS 'ピッキング備考';
COMMENT ON COLUMN shp_schedules.packing_description IS '梱包備考';
COMMENT ON COLUMN shp_schedules.sender_name IS '送付者名';
COMMENT ON COLUMN shp_schedules.sender_charge_name IS '担当者名';
COMMENT ON COLUMN shp_schedules.sender_tel01 IS '送付者TEL1';
COMMENT ON COLUMN shp_schedules.sender_tel02 IS '送付者TEL2';
COMMENT ON COLUMN shp_schedules.sender_tel03 IS '送付者TEL3';
COMMENT ON COLUMN shp_schedules.sender_zip01 IS '送付者郵便番号1';
COMMENT ON COLUMN shp_schedules.sender_zip02 IS '送付者郵便番号2';
COMMENT ON COLUMN shp_schedules.sender_pref_code IS '送付者都道府県コード';
COMMENT ON COLUMN shp_schedules.sender_pref IS '送付者都道府県';
COMMENT ON COLUMN shp_schedules.sender_addr01 IS '送付者住所1';
COMMENT ON COLUMN shp_schedules.sender_addr02 IS '送付者住所2';
COMMENT ON COLUMN shp_schedules.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_schedules.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_schedules.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_schedules.created_at IS '作成日時';
COMMENT ON COLUMN shp_schedules.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_schedules.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_schedules.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_schedules.updated_at IS '更新日時';
COMMENT ON COLUMN shp_schedules.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_schedules.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_schedules.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_schedules.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_schedules.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_schedules.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS shp_schedules_history
(
		id BIGSERIAL
	,	shipment_schedule_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	order_id BIGINT
	,	package_id BIGINT
	,	shipment_location_code TEXT NOT NULL
	,	shipment_location_name TEXT NOT NULL
	,	shipment_instructed_on DATE
	,	delivery_instructed_on DATE
	,	delivery_time_code TEXT NOT NULL
	,	delivery_time TEXT NOT NULL
	,	shipment_referenced_on DATE
	,	approved_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	completed_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	is_partical_shipment BOOLEAN NOT NULL DEFAULT FALSE
	,	packages_count INTEGER NOT NULL DEFAULT 0
	,	delivery_method_code TEXT NOT NULL
	,	delivery_method TEXT NOT NULL
	,	is_required_delivery_slip BOOLEAN NOT NULL DEFAULT FALSE
	,	is_required_invoice_slip BOOLEAN NOT NULL DEFAULT FALSE
	,	picking_description TEXT NOT NULL 
	,	packing_description TEXT NOT NULL
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
	,	CONSTRAINT shp_schedules_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_schedules_history OWNER to expa_apps;

COMMENT ON TABLE shp_schedules_history
	IS '[履歴]出荷予定テーブル';
COMMENT ON COLUMN shp_schedules_history.id IS '履歴ID';
COMMENT ON COLUMN shp_schedules_history.shipment_schedule_id IS '出荷予定ID';
COMMENT ON COLUMN shp_schedules_history.history_count IS '更新回数';
COMMENT ON COLUMN shp_schedules_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN shp_schedules_history.package_id IS '受注送付先ID';
COMMENT ON COLUMN shp_schedules_history.shipment_location_code IS '出荷場所コード';
COMMENT ON COLUMN shp_schedules_history.shipment_location_name IS '出荷場所';
COMMENT ON COLUMN shp_schedules_history.shipment_instructed_on IS '出荷日指定';
COMMENT ON COLUMN shp_schedules_history.delivery_instructed_on IS '着日指定';
COMMENT ON COLUMN shp_schedules_history.delivery_time_code IS '着時間指定コード';
COMMENT ON COLUMN shp_schedules_history.delivery_time IS '着時間指定';
COMMENT ON COLUMN shp_schedules_history.shipment_referenced_on IS '参考出荷日';
COMMENT ON COLUMN shp_schedules_history.approved_at IS '出荷承認日時';
COMMENT ON COLUMN shp_schedules_history.completed_at IS '全商品出荷完了日時';
COMMENT ON COLUMN shp_schedules_history.is_isolated_island IS '離島送付先フラグ';
COMMENT ON COLUMN shp_schedules_history.is_partical_shipment IS '分納フラグ';
COMMENT ON COLUMN shp_schedules_history.packages_count IS '出荷個口数';
COMMENT ON COLUMN shp_schedules_history.delivery_method_code IS '配送方法コード';
COMMENT ON COLUMN shp_schedules_history.delivery_method IS '配送方法';
COMMENT ON COLUMN shp_schedules_history.is_required_delivery_slip IS '納品書印刷要否';
COMMENT ON COLUMN shp_schedules_history.is_required_invoice_slip IS '領収書印刷要否';
COMMENT ON COLUMN shp_schedules_history.picking_description IS 'ピッキング備考';
COMMENT ON COLUMN shp_schedules_history.packing_description IS '梱包備考';
COMMENT ON COLUMN shp_schedules_history.sender_name IS '送付者名';
COMMENT ON COLUMN shp_schedules_history.sender_charge_name IS '担当者名';
COMMENT ON COLUMN shp_schedules_history.sender_tel01 IS '送付者TEL1';
COMMENT ON COLUMN shp_schedules_history.sender_tel02 IS '送付者TEL2';
COMMENT ON COLUMN shp_schedules_history.sender_tel03 IS '送付者TEL3';
COMMENT ON COLUMN shp_schedules_history.sender_zip01 IS '送付者郵便番号1';
COMMENT ON COLUMN shp_schedules_history.sender_zip02 IS '送付者郵便番号2';
COMMENT ON COLUMN shp_schedules_history.sender_pref_code IS '送付者都道府県コード';
COMMENT ON COLUMN shp_schedules_history.sender_pref IS '送付者都道府県';
COMMENT ON COLUMN shp_schedules_history.sender_addr01 IS '送付者住所1';
COMMENT ON COLUMN shp_schedules_history.sender_addr02 IS '送付者住所2';
COMMENT ON COLUMN shp_schedules_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_schedules_history.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_schedules_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_schedules_history.created_at IS '作成日時';
COMMENT ON COLUMN shp_schedules_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_schedules_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_schedules_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_schedules_history.updated_at IS '更新日時';
COMMENT ON COLUMN shp_schedules_history.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_schedules_history.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_schedules_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_schedules_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_schedules_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_schedules_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_schedules FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_shp_schedules_trigger AFTER INSERT OR UPDATE ON shp_schedules FOR EACH ROW EXECUTE FUNCTION insert_shp_schedules_history();