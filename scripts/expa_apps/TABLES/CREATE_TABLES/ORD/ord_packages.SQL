-- Table: ord_packages
-- Table: ord_packages_history

DROP TABLE IF EXISTS ord_packages;
DROP TABLE IF EXISTS ord_packages_history;

CREATE TABLE IF NOT EXISTS ord_packages
(
		id BIGSERIAL
	,	order_id BIGINT
	,	package_seq INTEGER NOT NULL DEFAULT 0
	,	store_basket_id BIGINT
	,	shipment_instructed_on DATE
	,	delivery_instructed_on DATE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	package_postage_price NUMERIC NOT NULL DEFAULT 0
	,	package_postage_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	package_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	package_delivery_charge_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	package_item_price NUMERIC NOT NULL DEFAULT 0
	,	package_item_excluded_tax NUMERIC NOT NULL DEFAULT 0
	,	package_total_price NUMERIC NOT NULL DEFAULT 0
	,	package_description TEXT NOT NULL
	,	delivery_message01 TEXT NOT NULL
	,	delivery_message02 TEXT NOT NULL
	,	delivery_message03 TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_packages_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_packages OWNER to expa_apps;

COMMENT ON TABLE ord_packages
	IS '受注送付先テーブル';
COMMENT ON COLUMN ord_packages.id IS '受注送付先ID';
COMMENT ON COLUMN ord_packages.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_packages.package_seq IS '送付先シーケンス';
COMMENT ON COLUMN ord_packages.store_basket_id IS '店舗別送付先ID';
COMMENT ON COLUMN ord_packages.shipment_instructed_on IS '出荷日指定';
COMMENT ON COLUMN ord_packages.delivery_instructed_on IS '着日指定';
COMMENT ON COLUMN ord_packages.is_isolated_island IS '離島送付先フラグ';
COMMENT ON COLUMN ord_packages.package_postage_price IS '送料';
COMMENT ON COLUMN ord_packages.package_postage_tax_rate IS '送料税率';
COMMENT ON COLUMN ord_packages.package_delivery_charge IS '代引き手数料';
COMMENT ON COLUMN ord_packages.package_delivery_charge_tax_rate IS '代引き手数料税率';
COMMENT ON COLUMN ord_packages.package_item_price IS '商品合計金額';
COMMENT ON COLUMN ord_packages.package_item_excluded_tax IS '商品消費税額(外税)';
COMMENT ON COLUMN ord_packages.package_total_price IS '合計金額';
COMMENT ON COLUMN ord_packages.package_description IS '送付先備考';
COMMENT ON COLUMN ord_packages.delivery_message01 IS '送り状メッセージ1';
COMMENT ON COLUMN ord_packages.delivery_message02 IS '送り状メッセージ2';
COMMENT ON COLUMN ord_packages.delivery_message03 IS '送り状メッセージ3';
COMMENT ON COLUMN ord_packages.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_packages.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_packages.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_packages.created_at IS '作成日時';
COMMENT ON COLUMN ord_packages.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_packages.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_packages.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_packages.updated_at IS '更新日時';

--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_packages_history
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	package_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	package_seq INTEGER NOT NULL DEFAULT 0
	,	store_basket_id BIGINT
	,	shipment_instructed_on DATE
	,	delivery_instructed_on DATE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	package_postage_price NUMERIC NOT NULL DEFAULT 0
	,	package_postage_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	package_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	package_delivery_charge_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	package_item_price NUMERIC NOT NULL DEFAULT 0
	,	package_item_excluded_tax NUMERIC NOT NULL DEFAULT 0
	,	package_total_price NUMERIC NOT NULL DEFAULT 0
	,	package_description TEXT NOT NULL
	,	delivery_message01 TEXT NOT NULL
	,	delivery_message02 TEXT NOT NULL
	,	delivery_message03 TEXT NOT NULL
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT ord_packages_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_packages_history OWNER to expa_apps;

COMMENT ON TABLE ord_packages_history
	IS '[履歴]受注送付先テーブル';
COMMENT ON COLUMN ord_packages_history.id IS '履歴ID';
COMMENT ON COLUMN ord_packages_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_packages_history.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_packages_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_packages_history.package_seq IS '送付先シーケンス';
COMMENT ON COLUMN ord_packages_history.store_basket_id IS '店舗別送付先ID';
COMMENT ON COLUMN ord_packages_history.shipment_instructed_on IS '出荷日指定';
COMMENT ON COLUMN ord_packages_history.delivery_instructed_on IS '着日指定';
COMMENT ON COLUMN ord_packages_history.is_isolated_island IS '離島送付先フラグ';
COMMENT ON COLUMN ord_packages_history.package_postage_price IS '送料';
COMMENT ON COLUMN ord_packages_history.package_postage_tax_rate IS '送料税率';
COMMENT ON COLUMN ord_packages_history.package_delivery_charge IS '代引き手数料';
COMMENT ON COLUMN ord_packages_history.package_delivery_charge_tax_rate IS '代引き手数料税率';
COMMENT ON COLUMN ord_packages_history.package_item_price IS '商品合計金額';
COMMENT ON COLUMN ord_packages_history.package_item_excluded_tax IS '商品消費税額(外税)';
COMMENT ON COLUMN ord_packages_history.package_total_price IS '合計金額';
COMMENT ON COLUMN ord_packages_history.package_description IS '送付先備考';
COMMENT ON COLUMN ord_packages_history.delivery_message01 IS '送り状メッセージ1';
COMMENT ON COLUMN ord_packages_history.delivery_message02 IS '送り状メッセージ2';
COMMENT ON COLUMN ord_packages_history.delivery_message03 IS '送り状メッセージ3';
COMMENT ON COLUMN ord_packages_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_packages_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_packages_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_packages_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_packages_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_packages_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_packages_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_packages_history.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_packages FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_packages_trigger AFTER INSERT OR UPDATE ON ord_packages FOR EACH ROW EXECUTE FUNCTION insert_ord_packages_history();