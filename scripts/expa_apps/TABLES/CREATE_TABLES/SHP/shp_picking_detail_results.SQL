-- Table: shp_picking_detail_results

DROP TABLE IF EXISTS shp_picking_detail_results;

CREATE TABLE IF NOT EXISTS shp_picking_detail_results
(
		id BIGSERIAL
	,	picking_result_id BIGINT NOT NULL DEFAULT 0
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
	,	is_deleted BOOLEAN NOT NULL DEFAULT FALSE
	,	deleted_user_code TEXT
	,	deleted_terminal TEXT
	,	deleted_function_code TEXT
	,	deleted_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	deleted_description TEXT
	,	CONSTRAINT shp_picking_detail_results_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_picking_detail_results OWNER to expa_apps;

COMMENT ON TABLE shp_picking_detail_results
	IS '出荷ピッキング作業実績明細テーブル';
COMMENT ON COLUMN shp_picking_detail_results.id IS '出荷ピッキング作業明細ID';
COMMENT ON COLUMN shp_picking_detail_results.picking_result_id IS '出荷ピッキング作業実績ID';
COMMENT ON COLUMN shp_picking_detail_results.shipment_schedule_detail_id IS '出荷予定明細ID';
COMMENT ON COLUMN shp_picking_detail_results.picking_at IS 'ピッキング実施日時';
COMMENT ON COLUMN shp_picking_detail_results.picking_employee_code IS 'ピッキング実施社員コード';
COMMENT ON COLUMN shp_picking_detail_results.picking_employee_name IS 'ピッキング実施社員名';
COMMENT ON COLUMN shp_picking_detail_results.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_picking_detail_results.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_picking_detail_results.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_picking_detail_results.created_at IS '作成日時';
COMMENT ON COLUMN shp_picking_detail_results.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_picking_detail_results.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_picking_detail_results.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_picking_detail_results.updated_at IS '更新日時';
COMMENT ON COLUMN shp_picking_detail_results.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_picking_detail_results.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_picking_detail_results.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_picking_detail_results.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_picking_detail_results.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_picking_detail_results.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_picking_detail_results FOR EACH ROW EXECUTE FUNCTION set_updated_at();
