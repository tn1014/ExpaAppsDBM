-- Table: ord_package_items
-- Table: ord_package_items_history

DROP TABLE IF EXISTS ord_package_items;
DROP TABLE IF EXISTS ord_package_items_history;

CREATE TABLE IF NOT EXISTS ord_package_items
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	package_id BIGINT NOT NULL
	,	store_item_detail_id BIGINT
	,	detail_no INTEGER NOT NULL
	,	item_code TEXT NOT NULL
	,	item_name TEXT NOT NULL
	,	price NUMERIC NOT NULL DEFAULT 0
	,	included_tax_div TEXT NOT NULL
	,	tax_rate NUMERIC NOT NULL DEFAULT 0
	,	quantity NUMERIC NOT NULL DEFAULT 0
	,	is_included_postage_price BOOLEAN NOT NULL DEFAULT FALSE
	,	is_included_delivery_charge BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT ord_package_items_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_items OWNER to expa_apps;

COMMENT ON TABLE ord_package_items
	IS '受注送付先商品明細テーブル';
COMMENT ON COLUMN ord_package_items.id IS '受注送付先商品明細ID';
COMMENT ON COLUMN ord_package_items.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_package_items.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_package_items.store_item_detail_id IS '店舗別受注商品明細ID';
COMMENT ON COLUMN ord_package_items.detail_no IS '明細No.';
COMMENT ON COLUMN ord_package_items.item_code IS '商品コード';
COMMENT ON COLUMN ord_package_items.item_name IS '商品名';
COMMENT ON COLUMN ord_package_items.price IS '受注単価';
COMMENT ON COLUMN ord_package_items.included_tax_div IS '内税外税区分';
COMMENT ON COLUMN ord_package_items.tax_rate IS '消費税率';
COMMENT ON COLUMN ord_package_items.quantity IS '受注数';
COMMENT ON COLUMN ord_package_items.is_included_postage_price IS '送料込フラグ';
COMMENT ON COLUMN ord_package_items.is_included_delivery_charge IS '代引き手数料込フラグ';
COMMENT ON COLUMN ord_package_items.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_items.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_items.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_items.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_items.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_items.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_items.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_items.updated_at IS '更新日時';
COMMENT ON COLUMN ord_package_items.is_deleted IS '削除区分';
COMMENT ON COLUMN ord_package_items.deleted_description IS '削除備考';
COMMENT ON COLUMN ord_package_items.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN ord_package_items.deleted_terminal IS '削除端末';
COMMENT ON COLUMN ord_package_items.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN ord_package_items.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_package_items_history
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	package_item_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	package_id BIGINT NOT NULL
	,	store_item_detail_id BIGINT
	,	detail_no INTEGER NOT NULL
	,	item_code TEXT NOT NULL
	,	item_name TEXT NOT NULL
	,	price NUMERIC NOT NULL DEFAULT 0
	,	included_tax_div TEXT NOT NULL
	,	tax_rate NUMERIC NOT NULL DEFAULT 0
	,	quantity NUMERIC NOT NULL DEFAULT 0
	,	is_included_postage_price BOOLEAN NOT NULL DEFAULT FALSE
	,	is_included_delivery_charge BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT ord_package_items_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_package_items_history OWNER to expa_apps;

COMMENT ON TABLE ord_package_items_history
	IS '[ 履歴]受注送付先商品明細テーブル';
COMMENT ON COLUMN ord_package_items_history.id IS '履歴ID';
COMMENT ON COLUMN ord_package_items_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_package_items_history.package_item_id IS '受注送付先商品明細ID';
COMMENT ON COLUMN ord_package_items_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_package_items_history.package_id IS '受注送付先ID';
COMMENT ON COLUMN ord_package_items_history.store_item_detail_id IS '店舗別受注商品明細ID';
COMMENT ON COLUMN ord_package_items_history.detail_no IS '明細No.';
COMMENT ON COLUMN ord_package_items_history.item_code IS '商品コード';
COMMENT ON COLUMN ord_package_items_history.item_name IS '商品名';
COMMENT ON COLUMN ord_package_items_history.price IS '受注単価';
COMMENT ON COLUMN ord_package_items_history.included_tax_div IS '内税外税区分';
COMMENT ON COLUMN ord_package_items_history.tax_rate IS '消費税率';
COMMENT ON COLUMN ord_package_items_history.quantity IS '受注数';
COMMENT ON COLUMN ord_package_items_history.is_included_postage_price IS '送料込フラグ';
COMMENT ON COLUMN ord_package_items_history.is_included_delivery_charge IS '代引き手数料込フラグ';
COMMENT ON COLUMN ord_package_items_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_package_items_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_package_items_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_package_items_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_package_items_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_package_items_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_package_items_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_package_items_history.updated_at IS '更新日時';
COMMENT ON COLUMN ord_package_items_history.is_deleted IS '削除区分';
COMMENT ON COLUMN ord_package_items_history.deleted_description IS '削除備考';
COMMENT ON COLUMN ord_package_items_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN ord_package_items_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN ord_package_items_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN ord_package_items_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_package_items FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_package_items_trigger AFTER INSERT OR UPDATE ON ord_package_items FOR EACH ROW EXECUTE FUNCTION insert_ord_package_items_history();