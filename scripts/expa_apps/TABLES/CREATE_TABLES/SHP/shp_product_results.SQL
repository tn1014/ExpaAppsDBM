-- Table: shp_product_results
-- Table: shp_product_results_history

DROP TABLE IF EXISTS shp_product_results;
DROP TABLE IF EXISTS shp_product_results_history;

CREATE TABLE IF NOT EXISTS shp_product_results
(
		id BIGSERIAL
	,	package_shipment_product_id BIGINT NOT NULL
	,	stock_transaction_id BIGINT NOT NULL
	,	shipped_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	shipped_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipped_lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipped_quantity NUMERIC NOT NULL DEFAULT 0
	,	is_directly_shipping BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT shp_product_results_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_product_results OWNER to expa_apps;

COMMENT ON TABLE shp_product_results
	IS '製品出荷実績テーブル';
COMMENT ON COLUMN shp_product_results.id IS '出荷実績ID';
COMMENT ON COLUMN shp_product_results.package_shipment_product_id IS '送付先出荷製品ID';
COMMENT ON COLUMN shp_product_results.stock_transaction_id IS '受払ID';
COMMENT ON COLUMN shp_product_results.shipped_at IS '出荷日時';
COMMENT ON COLUMN shp_product_results.shipped_unit_quantity IS '出荷入数';
COMMENT ON COLUMN shp_product_results.shipped_lot_quantity IS '出荷ロット数';
COMMENT ON COLUMN shp_product_results.shipped_quantity IS '出荷数';
COMMENT ON COLUMN shp_product_results.is_directly_shipping IS 'メーカー直送フラグ';
COMMENT ON COLUMN shp_product_results.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_product_results.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_product_results.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_product_results.created_at IS '作成日時';
COMMENT ON COLUMN shp_product_results.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_product_results.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_product_results.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_product_results.updated_at IS '更新日時';
COMMENT ON COLUMN shp_product_results.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_product_results.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_product_results.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_product_results.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_product_results.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_product_results.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS shp_product_results_history
(
		id BIGSERIAL
	,	shipment_result_id BIGINT
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	package_shipment_product_id BIGINT
	,	stock_transaction_id BIGINT
	,	shipped_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	shipped_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipped_lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipped_quantity NUMERIC NOT NULL DEFAULT 0
	,	is_directly_shipping BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT shp_product_results_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS shp_product_results_history OWNER to expa_apps;

COMMENT ON TABLE shp_product_results_history
	IS '[ 履歴]製品出荷実績テーブル';
COMMENT ON COLUMN shp_product_results_history.id IS '履歴ID';
COMMENT ON COLUMN shp_product_results_history.shipment_result_id IS '出荷実績ID';
COMMENT ON COLUMN shp_product_results_history.history_count IS '更新回数';
COMMENT ON COLUMN shp_product_results_history.package_shipment_product_id IS '送付先出荷製品ID';
COMMENT ON COLUMN shp_product_results_history.stock_transaction_id IS '受払ID';
COMMENT ON COLUMN shp_product_results_history.shipped_at IS '出荷日時';
COMMENT ON COLUMN shp_product_results_history.shipped_unit_quantity IS '出荷入数';
COMMENT ON COLUMN shp_product_results_history.shipped_lot_quantity IS '出荷ロット数';
COMMENT ON COLUMN shp_product_results_history.shipped_quantity IS '出荷数';
COMMENT ON COLUMN shp_product_results_history.is_directly_shipping IS 'メーカー直送フラグ';
COMMENT ON COLUMN shp_product_results_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN shp_product_results_history.created_terminal IS '作成端末';
COMMENT ON COLUMN shp_product_results_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN shp_product_results_history.created_at IS '作成日時';
COMMENT ON COLUMN shp_product_results_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN shp_product_results_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN shp_product_results_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN shp_product_results_history.updated_at IS '更新日時';
COMMENT ON COLUMN shp_product_results_history.is_deleted IS '削除区分';
COMMENT ON COLUMN shp_product_results_history.deleted_description IS '削除備考';
COMMENT ON COLUMN shp_product_results_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN shp_product_results_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN shp_product_results_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN shp_product_results_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON shp_product_results FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_shp_product_results_trigger AFTER INSERT OR UPDATE ON shp_product_results FOR EACH ROW EXECUTE FUNCTION insert_shp_product_results_history();