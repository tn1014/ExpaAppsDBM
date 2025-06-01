-- Table: ord_package_shipments
-- Table: ord_package_shipments_history

DROP TABLE IF EXISTS ord_package_shipments;
DROP TABLE IF EXISTS ord_package_shipments_history;

CREATE TABLE IF NOT EXISTS ord_package_shipments
(
		id BIGSERIAL
	,	order_id BIGINT
	,	package_id BIGINT
	,	packages_count SMALLINT NOT NULL DEFAULT 1
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipments_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipments OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipments
	IS '受注送付先出荷テーブル';
COMMENT ON COLUMN ord_package_shipments.id IS '受注送付先出荷ID';
COMMENT ON COLUMN ord_package_shipments.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_package_shipments.package_id IS '送付先ID';
COMMENT ON COLUMN ord_package_shipments.packages_count IS '出荷個口数';
COMMENT ON COLUMN ord_package_shipments.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipments.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipments.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipments.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipments.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipments.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipments.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipments.updated_at IS '更新日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_package_shipments_history
(
		id BIGSERIAL
	,	package_shipment_id BIGINT NOT NULL
	,	order_id BIGINT NOT NULL
	,	package_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	packages_count SMALLINT NOT NULL DEFAULT 1
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipments_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipments_history OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipments_history
	IS '[履歴]受注送付先出荷テーブル';
COMMENT ON COLUMN ord_package_shipments_history.id IS '履歴ID';
COMMENT ON COLUMN ord_package_shipments_history.package_shipment_id IS '受注送付先出荷ID';
COMMENT ON COLUMN ord_package_shipments_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_package_shipments_history.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_package_shipments_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_package_shipments_history.packages_count IS '出荷個口数';
COMMENT ON COLUMN ord_package_shipments_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipments_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipments_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipments_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipments_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipments_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipments_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipments_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_shipments FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_package_shipments_trigger AFTER INSERT OR UPDATE ON ord_package_shipments FOR EACH ROW EXECUTE FUNCTION insert_ord_package_shipments_history();