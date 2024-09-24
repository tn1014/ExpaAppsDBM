-- Table: shp_result_tracking_numbers

DROP TABLE IF EXISTS shp_result_tracking_numbers;

CREATE TABLE IF NOT EXISTS shp_result_tracking_numbers
(
		id BIGSERIAL
	,	shipment_result_id BIGINT NOT NULL DEFAULT 0
	,	tracking_seq INTEGER NOT NULL DEFAULT 0
	,	tracking_number TEXT NOT NULL
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
	,	CONSTRAINT shp_result_tracking_numbers_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_result_tracking_numbers OWNER to expa_apps;

COMMENT ON TABLE shp_result_tracking_numbers
	IS '出荷実績配送伝票テーブル';
COMMENT ON COLUMN shp_result_tracking_numbers.id IS '出荷実績配送伝票ID';
COMMENT ON COLUMN shp_result_tracking_numbers.shipment_result_id IS '出荷予定ID';
COMMENT ON COLUMN shp_result_tracking_numbers.tracking_seq IS '配送伝票番号シーケンス';
COMMENT ON COLUMN shp_result_tracking_numbers.tracking_number IS '配送伝票番号';
COMMENT ON COLUMN shp_result_tracking_numbers.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_result_tracking_numbers.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_result_tracking_numbers.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_result_tracking_numbers.created_at IS '作成日時';
COMMENT ON COLUMN shp_result_tracking_numbers.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_result_tracking_numbers.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_result_tracking_numbers.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_result_tracking_numbers.updated_at IS '更新日時';
COMMENT ON COLUMN shp_result_tracking_numbers.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_result_tracking_numbers.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_result_tracking_numbers.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_result_tracking_numbers.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_result_tracking_numbers.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_result_tracking_numbers.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_result_tracking_numbers FOR EACH ROW EXECUTE FUNCTION set_updated_at();
