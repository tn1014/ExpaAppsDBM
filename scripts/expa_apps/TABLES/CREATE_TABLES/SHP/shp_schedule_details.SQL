-- Table: shp_schedule_details
-- Table: shp_schedule_details_history

DROP TABLE IF EXISTS shp_schedule_details;
DROP TABLE IF EXISTS shp_schedule_details;

CREATE TABLE IF NOT EXISTS shp_schedule_details
(
		id BIGSERIAL
	,	shipment_schedule_id BIGINT NOT NULL
	,	package_item_configuration_id BIGINT
	,	stock_transaction_temporary_id BIGINT
	,	item_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	configuration_parts_div TEXT NOT NULL
	,	lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_scheduled_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_scheduled_quantity NUMERIC NOT NULL DEFAULT 0
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
	,	CONSTRAINT shp_schedule_details_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_schedule_details OWNER to expa_apps;

COMMENT ON TABLE shp_schedule_details
	IS '出荷予定明細テーブル';
COMMENT ON COLUMN shp_schedule_details.id IS '出荷予定明細ID';
COMMENT ON COLUMN shp_schedule_details.shipment_schedule_id IS '出荷予定ID';
COMMENT ON COLUMN shp_schedule_details.package_item_configuration_id IS '受注送付先商品構成ID';
COMMENT ON COLUMN shp_schedule_details.stock_transaction_temporary_id IS '在庫仮受払ID';
COMMENT ON COLUMN shp_schedule_details.item_code IS '商品コード';
COMMENT ON COLUMN shp_schedule_details.product_code IS '製品コード';
COMMENT ON COLUMN shp_schedule_details.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN shp_schedule_details.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN shp_schedule_details.lot_quantity IS '入数';
COMMENT ON COLUMN shp_schedule_details.shipment_scheduled_unit_quantity IS '出荷予定単位数';
COMMENT ON COLUMN shp_schedule_details.shipment_scheduled_quantity IS '出荷予定数';
COMMENT ON COLUMN shp_schedule_details.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_schedule_details.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_schedule_details.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_schedule_details.created_at IS '作成日時';
COMMENT ON COLUMN shp_schedule_details.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_schedule_details.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_schedule_details.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_schedule_details.updated_at IS '更新日時';
COMMENT ON COLUMN shp_schedule_details.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_schedule_details.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_schedule_details.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_schedule_details.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_schedule_details.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_schedule_details.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS shp_schedule_details_history
(
		id BIGSERIAL
	,	shipment_schedule_detail_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	shipment_schedule_id BIGINT NOT NULL
	,	package_item_configuration_id BIGINT
	,	stock_transaction_temporary_id BIGINT NOT NULL
	,	item_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	configuration_parts_div TEXT NOT NULL
	,	lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_scheduled_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_scheduled_quantity NUMERIC NOT NULL DEFAULT 0
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
	,	CONSTRAINT shp_schedule_details_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_schedule_details_history OWNER to expa_apps;

COMMENT ON TABLE shp_schedule_details_history
	IS '[履歴]出荷予定明細テーブル';
COMMENT ON COLUMN shp_schedule_details_history.id IS '履歴ID';
COMMENT ON COLUMN shp_schedule_details_history.shipment_schedule_detail_id IS '出荷予定明細ID';
COMMENT ON COLUMN shp_schedule_details_history.history_count IS '更新回数';
COMMENT ON COLUMN shp_schedule_details_history.shipment_schedule_id IS '出荷予定ID';
COMMENT ON COLUMN shp_schedule_details_history.package_item_configuration_id IS '受注送付先商品構成ID';
COMMENT ON COLUMN shp_schedule_details_history.stock_transaction_temporary_id IS '在庫仮受払ID';
COMMENT ON COLUMN shp_schedule_details_history.item_code IS '商品コード';
COMMENT ON COLUMN shp_schedule_details_history.product_code IS '製品コード';
COMMENT ON COLUMN shp_schedule_details_history.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN shp_schedule_details_history.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN shp_schedule_details_history.lot_quantity IS '入数';
COMMENT ON COLUMN shp_schedule_details_history.shipment_scheduled_unit_quantity IS '出荷予定単位数';
COMMENT ON COLUMN shp_schedule_details_history.shipment_scheduled_quantity IS '出荷予定数';
COMMENT ON COLUMN shp_schedule_details_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_schedule_details_history.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_schedule_details_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_schedule_details_history.created_at IS '作成日時';
COMMENT ON COLUMN shp_schedule_details_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_schedule_details_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_schedule_details_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_schedule_details_history.updated_at IS '更新日時';
COMMENT ON COLUMN shp_schedule_details_history.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_schedule_details_history.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_schedule_details_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_schedule_details_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_schedule_details_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_schedule_details_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_schedule_details FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_shp_schedule_details_trigger AFTER INSERT OR UPDATE ON shp_schedule_details FOR EACH ROW EXECUTE FUNCTION insert_shp_schedule_details_history();