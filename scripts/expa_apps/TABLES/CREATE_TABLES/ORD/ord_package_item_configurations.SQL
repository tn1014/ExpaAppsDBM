-- Table: ord_package_item_configurations
-- Table: ord_package_item_configurations_history

DROP TABLE IF EXISTS ord_package_item_configurations;
DROP TABLE IF EXISTS ord_package_item_configurations_history;

CREATE TABLE IF NOT EXISTS ord_package_item_configurations
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	package_id BIGINT NOT NULL
	,	package_item_id BIGINT NOT NULL
	,	item_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	configuration_parts_div TEXT NOT NULL
	,	sales_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	rank INTEGER NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_item_configurations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_item_configurations OWNER to expa_apps;

COMMENT ON TABLE ord_package_item_configurations
	IS '受注送付先商品構成テーブル';
COMMENT ON COLUMN ord_package_item_configurations.id IS '受注送付先商品構成ID';
COMMENT ON COLUMN ord_package_item_configurations.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_package_item_configurations.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_package_item_configurations.package_item_id IS '店舗別受注商品明細ID';
COMMENT ON COLUMN ord_package_item_configurations.item_code IS '商品コード';
COMMENT ON COLUMN ord_package_item_configurations.product_code IS '製品コード';
COMMENT ON COLUMN ord_package_item_configurations.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN ord_package_item_configurations.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN ord_package_item_configurations.sales_unit_quantity IS '販売入数';
COMMENT ON COLUMN ord_package_item_configurations.rank IS '表示順';
COMMENT ON COLUMN ord_package_item_configurations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_item_configurations.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_item_configurations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_item_configurations.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_item_configurations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_item_configurations.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_item_configurations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_item_configurations.updated_at IS '更新日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_package_item_configurations_history
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	package_item_configuration_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	package_id BIGINT NOT NULL
	,	package_item_id BIGINT NOT NULL
	,	item_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	configuration_parts_div TEXT NOT NULL
	,	sales_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	rank INTEGER NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_item_configurations_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_item_configurations_history OWNER to expa_apps;

COMMENT ON TABLE ord_package_item_configurations_history
	IS '[履歴]受注送付先商品構成テーブル';
COMMENT ON COLUMN ord_package_item_configurations_history.id IS '履歴ID';
COMMENT ON COLUMN ord_package_item_configurations_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_package_item_configurations_history.package_item_configuration_id IS '受注送付先商品構成ID';
COMMENT ON COLUMN ord_package_item_configurations_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_package_item_configurations_history.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_package_item_configurations_history.package_item_id IS '店舗別受注商品明細ID';
COMMENT ON COLUMN ord_package_item_configurations_history.item_code IS '商品コード';
COMMENT ON COLUMN ord_package_item_configurations_history.product_code IS '製品コード';
COMMENT ON COLUMN ord_package_item_configurations_history.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN ord_package_item_configurations_history.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN ord_package_item_configurations_history.sales_unit_quantity IS '入数';
COMMENT ON COLUMN ord_package_item_configurations_history.rank IS '表示順';
COMMENT ON COLUMN ord_package_item_configurations_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_item_configurations_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_item_configurations_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_item_configurations_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_item_configurations_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_item_configurations_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_item_configurations_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_item_configurations_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_item_configurations FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_package_item_configurations_trigger AFTER INSERT OR UPDATE ON ord_package_item_configurations FOR EACH ROW EXECUTE FUNCTION insert_ord_package_item_configurations_history();