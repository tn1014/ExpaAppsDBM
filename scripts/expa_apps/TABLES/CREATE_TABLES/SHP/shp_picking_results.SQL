-- Table: shp_picking_results

DROP TABLE IF EXISTS shp_picking_results;

CREATE TABLE IF NOT EXISTS shp_picking_results
(
		id BIGSERIAL
	,	shipment_schedule_id BIGINT NOT NULL DEFAULT 0
	,	shipment_schedule_detail_id BIGINT NOT NULL DEFAULT 0
	,	picking_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	picking_employee_code TEXT NOT NULL
	,	picking_employee_name TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT shp_picking_results_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_picking_results OWNER to expa_apps;

COMMENT ON TABLE shp_picking_results
	IS '出荷ピッキング作業実績テーブル';
COMMENT ON COLUMN shp_picking_results.id IS '出荷ピッキング作業ID';
COMMENT ON COLUMN shp_picking_results.shipment_schedule_id IS '出荷予定ID';
COMMENT ON COLUMN shp_picking_results.shipment_schedule_detail_id IS '出荷予定明細ID';
COMMENT ON COLUMN shp_picking_results.picking_at IS 'ピッキング実施日時';
COMMENT ON COLUMN shp_picking_results.picking_employee_code IS 'ピッキング実施社員コード';
COMMENT ON COLUMN shp_picking_results.picking_employee_name IS 'ピッキング実施社員名';
COMMENT ON COLUMN shp_picking_results.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_picking_results.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_picking_results.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_picking_results.created_at IS '作成日時';
COMMENT ON COLUMN shp_picking_results.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_picking_results.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_picking_results.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_picking_results.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_picking_results FOR EACH ROW EXECUTE FUNCTION set_updated_at();
