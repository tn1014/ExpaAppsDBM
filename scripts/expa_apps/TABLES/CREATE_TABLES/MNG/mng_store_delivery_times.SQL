-- Table: mng_store_delivery_times

DROP TABLE IF EXISTS mng_store_delivery_times;

CREATE TABLE IF NOT EXISTS mng_store_delivery_times
(
		delivery_time_code TEXT NOT NULL
	,	delivery_time TEXT NOT NULL
	,	honten_relation_code TEXT NOT NULL
	,	rakuten_relation_code TEXT NOT NULL
	,	yahoo_relation_code TEXT NOT NULL
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
	,	CONSTRAINT mng_store_delivery_times_pkey PRIMARY KEY (delivery_time_code)
);

ALTER TABLE IF EXISTS mng_store_delivery_times OWNER to expa_apps;

COMMENT ON TABLE mng_store_delivery_times
	IS '店舗用配送時間帯マスタ';
COMMENT ON COLUMN mng_store_delivery_times.delivery_time_code IS '配送方法コード';
COMMENT ON COLUMN mng_store_delivery_times.delivery_time IS '配送方法';
COMMENT ON COLUMN mng_store_delivery_times.honten_relation_code IS '本店連携コード';
COMMENT ON COLUMN mng_store_delivery_times.rakuten_relation_code IS '楽天市場連携コード';
COMMENT ON COLUMN mng_store_delivery_times.yahoo_relation_code IS 'Yahoo!ショッピング連携コード';
COMMENT ON COLUMN mng_store_delivery_times.rank IS '表示順';
COMMENT ON COLUMN mng_store_delivery_times.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mng_store_delivery_times.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mng_store_delivery_times.created_terminal IS '作成端末';
COMMENT ON COLUMN mng_store_delivery_times.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mng_store_delivery_times.created_at IS '作成日時';
COMMENT ON COLUMN mng_store_delivery_times.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mng_store_delivery_times.updated_terminal IS '更新端末';
COMMENT ON COLUMN mng_store_delivery_times.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mng_store_delivery_times.updated_at IS '更新日時';
--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mng_store_delivery_times FOR EACH ROW EXECUTE FUNCTION set_updated_at();