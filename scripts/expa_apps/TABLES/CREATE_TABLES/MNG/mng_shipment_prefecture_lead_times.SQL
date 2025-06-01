-- Table: mng_shipment_prefecture_lead_times

DROP TABLE IF EXISTS mng_shipment_prefecture_lead_times;

CREATE TABLE IF NOT EXISTS mng_shipment_prefecture_lead_times
(
		pref_code TEXT NOT NULL
	,	lead_time SMALLINT NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT mng_shipment_prefecture_lead_times_pkey PRIMARY KEY (pref_code)
);

ALTER TABLE IF EXISTS mng_shipment_prefecture_lead_times OWNER to expa_apps;

COMMENT ON TABLE mng_shipment_prefecture_lead_times
	IS '都道府県別出荷リードタイム情報';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.pref_code IS '都道府県コード';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.lead_time IS '出荷リードタイム';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.created_at IS '作成日時';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_shipment_prefecture_lead_times.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_shipment_prefecture_lead_times FOR EACH ROW EXECUTE FUNCTION set_updated_at();