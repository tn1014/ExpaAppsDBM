-- Table: shp_packing_results

DROP TABLE IF EXISTS shp_packing_results;

CREATE TABLE IF NOT EXISTS shp_packing_results
(
		id BIGSERIAL
	,	shipment_schedule_id BIGINT NOT NULL DEFAULT 0
	,	shipment_schedule_detail_id BIGINT NOT NULL DEFAULT 0
	,	packing_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	packing_employee_code TEXT NOT NULL
	,	packing_employee_name TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT shp_packing_results_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_packing_results OWNER to expa_apps;

COMMENT ON TABLE shp_packing_results
	IS '出荷梱包作業実績テーブル';
COMMENT ON COLUMN shp_packing_results.id IS '出荷梱包作業ID';
COMMENT ON COLUMN shp_packing_results.shipment_schedule_id IS '出荷予定ID';
COMMENT ON COLUMN shp_packing_results.shipment_schedule_detail_id IS '出荷予定明細ID';
COMMENT ON COLUMN shp_packing_results.packing_at IS '梱包実施日時';
COMMENT ON COLUMN shp_packing_results.packing_employee_code IS '梱包実施社員コード';
COMMENT ON COLUMN shp_packing_results.packing_employee_name IS '梱包実施社員名';
COMMENT ON COLUMN shp_packing_results.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_packing_results.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_packing_results.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_packing_results.created_at IS '作成日時';
COMMENT ON COLUMN shp_packing_results.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_packing_results.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_packing_results.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_packing_results.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_packing_results FOR EACH ROW EXECUTE FUNCTION set_updated_at();
