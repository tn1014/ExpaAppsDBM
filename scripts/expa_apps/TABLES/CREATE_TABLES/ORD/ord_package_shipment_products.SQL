-- Table: ord_package_shipment_products
-- Table: ord_package_shipment_products_history

DROP TABLE IF EXISTS ord_package_shipment_products;
DROP TABLE IF EXISTS ord_package_shipment_products_history;

CREATE TABLE IF NOT EXISTS ord_package_shipment_products
(
		id BIGSERIAL
	,	package_shipment_id BIGINT NOT NULL
	,	package_item_id BIGINT NOT NULL
	,	package_item_configuration_id BIGINT NOT NULL
	,	order_detail_no INTEGER NOT NULL
	,	package_detail_no INTEGER NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	shipment_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_quantity NUMERIC NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipment_products_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipment_products OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipment_products
	IS '受注送付先出荷製品テーブル';
COMMENT ON COLUMN ord_package_shipment_products.id IS '受注送付先出荷製品ID';
COMMENT ON COLUMN ord_package_shipment_products.package_shipment_id IS '受注送付先出荷ID';
COMMENT ON COLUMN ord_package_shipment_products.package_item_id IS '送付先商品ID';
COMMENT ON COLUMN ord_package_shipment_products.package_item_configuration_id IS '送付先商品構成ID';
COMMENT ON COLUMN ord_package_shipment_products.order_detail_no IS '受注明細No.';
COMMENT ON COLUMN ord_package_shipment_products.package_detail_no IS '送付先明細No.';
COMMENT ON COLUMN ord_package_shipment_products.product_code IS '製品コード';
COMMENT ON COLUMN ord_package_shipment_products.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN ord_package_shipment_products.shipment_unit_quantity IS '出荷入数';
COMMENT ON COLUMN ord_package_shipment_products.shipment_lot_quantity IS '出荷ロット数';
COMMENT ON COLUMN ord_package_shipment_products.shipment_quantity IS '出荷数';
COMMENT ON COLUMN ord_package_shipment_products.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipment_products.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipment_products.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipment_products.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipment_products.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipment_products.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipment_products.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipment_products.updated_at IS '更新日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_package_shipment_products_history
(
		id BIGSERIAL
	,	package_shipment_product_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	package_shipment_id BIGINT NOT NULL
	,	package_item_id BIGINT NOT NULL
	,	package_item_configuration_id BIGINT NOT NULL
	,	order_detail_no INTEGER NOT NULL
	,	package_detail_no INTEGER NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL
	,	shipment_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_lot_quantity NUMERIC NOT NULL DEFAULT 0
	,	shipment_quantity NUMERIC NOT NULL DEFAULT 0
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_package_shipment_products_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_shipment_products_history OWNER to expa_apps;

COMMENT ON TABLE ord_package_shipment_products_history
	IS '[履歴]受注送付先出荷製品テーブル';
COMMENT ON COLUMN ord_package_shipment_products_history.id IS '履歴ID';
COMMENT ON COLUMN ord_package_shipment_products_history.package_shipment_product_id IS 'ID';
COMMENT ON COLUMN ord_package_shipment_products_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_package_shipment_products_history.package_shipment_id IS '送付先出荷ID';
COMMENT ON COLUMN ord_package_shipment_products_history.package_item_id IS '受注送付先商品明細ID';
COMMENT ON COLUMN ord_package_shipment_products_history.package_item_configuration_id IS '受注送付先商品明細ID';
COMMENT ON COLUMN ord_package_shipment_products_history.order_detail_no IS '受注明細No.';
COMMENT ON COLUMN ord_package_shipment_products_history.package_detail_no IS '送付先明細No.';
COMMENT ON COLUMN ord_package_shipment_products_history.product_code IS '製品コード';
COMMENT ON COLUMN ord_package_shipment_products_history.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN ord_package_shipment_products_history.shipment_unit_quantity IS '出荷入数';
COMMENT ON COLUMN ord_package_shipment_products_history.shipment_lot_quantity IS '出荷ロット数';
COMMENT ON COLUMN ord_package_shipment_products_history.shipment_quantity IS '出荷数';
COMMENT ON COLUMN ord_package_shipment_products_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_shipment_products_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_shipment_products_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_shipment_products_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_shipment_products_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_shipment_products_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_shipment_products_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_shipment_products_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_shipment_products FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_package_shipment_products_trigger AFTER INSERT OR UPDATE ON ord_package_shipment_products FOR EACH ROW EXECUTE FUNCTION insert_ord_package_shipment_products_history();