-- Table: shp_direct_result_details
-- Table: shp_direct_result_details_history

DROP TABLE IF EXISTS shp_direct_result_details;
DROP TABLE IF EXISTS shp_direct_result_details_history;

CREATE TABLE IF NOT EXISTS shp_direct_result_details
(
		id BIGSERIAL
	,	direct_result_id BIGINT NOT NULL
	,	direct_schedule_detail_id BIGINT
	,	purchase_slip_no TEXT NOT NULL
	,	detail_no SMALLINT NOT NULL
	,	item_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	configuration_parts_div TEXT NOT NULL
	,	lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_quantity NUMERIC NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT shp_direct_result_details_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_direct_result_details OWNER to expa_apps;

COMMENT ON TABLE shp_direct_result_details
	IS '直送出荷実績明細テーブル';
COMMENT ON COLUMN shp_direct_result_details.id IS '直送出荷実績明細ID';
COMMENT ON COLUMN shp_direct_result_details.direct_result_id IS '直送出荷実績ID';
COMMENT ON COLUMN shp_direct_result_details.direct_schedule_detail_id IS '直送出荷予定明細ID';
COMMENT ON COLUMN shp_direct_result_details.purchase_slip_no IS '直送発注番号';
COMMENT ON COLUMN shp_direct_result_details.detail_no IS '直送発注明細番号';
COMMENT ON COLUMN shp_direct_result_details.item_code IS '商品コード';
COMMENT ON COLUMN shp_direct_result_details.product_code IS '製品コード';
COMMENT ON COLUMN shp_direct_result_details.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN shp_direct_result_details.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN shp_direct_result_details.lot_quantity IS '入数';
COMMENT ON COLUMN shp_direct_result_details.shipment_unit_quantity IS '出荷実績単位数';
COMMENT ON COLUMN shp_direct_result_details.shipment_quantity IS '出荷実績数';
COMMENT ON COLUMN shp_direct_result_details.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_direct_result_details.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_direct_result_details.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_direct_result_details.created_at IS '作成日時';
COMMENT ON COLUMN shp_direct_result_details.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_direct_result_details.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_direct_result_details.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_direct_result_details.updated_at IS '更新日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS shp_direct_result_details_history
(
		id BIGSERIAL
	,	direct_result_detail_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	direct_result_id BIGINT NOT NULL
	,	direct_schedule_detail_id BIGINT
	,	purchase_slip_no TEXT NOT NULL
	,	detail_no SMALLINT NOT NULL
	,	item_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	configuration_parts_div TEXT NOT NULL
	,	lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_quantity NUMERIC NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT shp_direct_result_details_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_direct_result_details_history OWNER to expa_apps;

COMMENT ON TABLE shp_direct_result_details_history
	IS '[履歴]直送出荷実績明細テーブル';
COMMENT ON COLUMN shp_direct_result_details_history.id IS '履歴ID';
COMMENT ON COLUMN shp_direct_result_details_history.direct_result_detail_id IS '直送出荷実績明細ID';
COMMENT ON COLUMN shp_direct_result_details_history.history_count IS '更新回数';
COMMENT ON COLUMN shp_direct_result_details_history.direct_result_id IS '直送出荷実績ID';
COMMENT ON COLUMN shp_direct_result_details_history.direct_schedule_detail_id IS '直送出荷予定明細ID';
COMMENT ON COLUMN shp_direct_result_details_history.purchase_slip_no IS '直送発注番号';
COMMENT ON COLUMN shp_direct_result_details_history.detail_no IS '直送発注明細番号';
COMMENT ON COLUMN shp_direct_result_details_history.item_code IS '商品コード';
COMMENT ON COLUMN shp_direct_result_details_history.product_code IS '製品コード';
COMMENT ON COLUMN shp_direct_result_details_history.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN shp_direct_result_details_history.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN shp_direct_result_details_history.lot_quantity IS '入数';
COMMENT ON COLUMN shp_direct_result_details_history.shipment_unit_quantity IS '出荷実績単位数';
COMMENT ON COLUMN shp_direct_result_details_history.shipment_quantity IS '出荷実績数';
COMMENT ON COLUMN shp_direct_result_details_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_direct_result_details_history.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_direct_result_details_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_direct_result_details_history.created_at IS '作成日時';
COMMENT ON COLUMN shp_direct_result_details_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_direct_result_details_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_direct_result_details_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_direct_result_details_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_direct_result_details FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_shp_direct_result_details_trigger AFTER INSERT OR UPDATE ON shp_direct_result_details FOR EACH ROW EXECUTE FUNCTION insert_shp_direct_result_details_history();