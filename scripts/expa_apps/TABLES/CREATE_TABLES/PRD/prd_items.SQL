-- Table: prd_items;
-- Table: prd_items_history;

DROP TABLE IF EXISTS prd_items;
DROP TABLE IF EXISTS prd_items_history;

CREATE TABLE IF NOT EXISTS prd_items
(
		id BIGSERIAL
	,	item_code TEXT NOT NULL UNIQUE
	,	item_name TEXT NOT NULL
	,	item_type TEXT NOT NULL
	,	is_sales_ended BOOLEAN NOT NULL DEFAULT FALSE
	,	is_allowed_stock_unlimited BOOLEAN NOT NULL DEFAULT FALSE
	,	is_kiracs_csv_disabled BOOLEAN NOT NULL DEFAULT FALSE
	,	order_limit_count NUMERIC
	,	set_div TEXT NOT NULL
	,	catch_copy TEXT NOT NULL
	,	sales_description TEXT NOT NULL
	,	shipment_size_div TEXT NOT NULL
	,	shipment_div TEXT NOT NULL
	,	shipment_packing_quantity NUMERIC
	,	note TEXT NOT NULL
	,	rank INT
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
	,	CONSTRAINT prd_items_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_items OWNER to expa_apps;

COMMENT ON TABLE prd_items
	IS '商品マスタ';
COMMENT ON COLUMN prd_items.id IS '商品ID';
COMMENT ON COLUMN prd_items.item_code IS '商品コード';
COMMENT ON COLUMN prd_items.item_name IS '商品名';
COMMENT ON COLUMN prd_items.item_type IS '商品種別';
COMMENT ON COLUMN prd_items.is_sales_ended IS '販売終了フラグ';
COMMENT ON COLUMN prd_items.is_allowed_stock_unlimited IS '在庫無制限フラグ';
COMMENT ON COLUMN prd_items.is_kiracs_csv_disabled IS 'キラックス売上CSV無効フラグ';
COMMENT ON COLUMN prd_items.order_limit_count IS '購入制限件数';
COMMENT ON COLUMN prd_items.catch_copy IS 'キャッチコピー';
COMMENT ON COLUMN prd_items.sales_description IS '商品販売説明文';
COMMENT ON COLUMN prd_items.shipment_size_div IS '出荷サイズ区分';
COMMENT ON COLUMN prd_items.shipment_div IS '出荷区分';
COMMENT ON COLUMN prd_items.shipment_packing_quantity IS '出荷単送個口数';
COMMENT ON COLUMN prd_items.note IS 'メモ';
COMMENT ON COLUMN prd_items.rank IS '表示順';
COMMENT ON COLUMN prd_items.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_items.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_items.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_items.created_at IS '作成日時';
COMMENT ON COLUMN prd_items.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_items.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_items.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_items.updated_at IS '更新日時';
COMMENT ON COLUMN prd_items.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_items.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_items.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_items.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_items.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_items.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_items_history
(
		id BIGSERIAL
	,	item_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL
	,	item_code TEXT NOT NULL
	,	item_name TEXT NOT NULL
	,	item_type TEXT NOT NULL
	,	is_sales_ended  BOOLEAN NOT NULL
	,	is_allowed_stock_unlimited BOOLEAN NOT NULL
	,	is_kiracs_csv_disabled BOOLEAN NOT NULL
	,	order_limit_count NUMERIC
	,	set_div TEXT NOT NULL
	,	catch_copy TEXT NOT NULL
	,	sales_description TEXT NOT NULL
	,	shipment_size_div TEXT NOT NULL
	,	shipment_div TEXT NOT NULL
	,	shipment_packing_quantity NUMERIC
	,	note TEXT NOT NULL
	,	rank INT
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
	,	CONSTRAINT prd_items_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_items_history
	IS '[履歴]商品マスタ';
COMMENT ON COLUMN prd_items_history.id IS '履歴ID';
COMMENT ON COLUMN prd_items_history.item_id IS '商品ID';
COMMENT ON COLUMN prd_items_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_items_history.item_code IS '製品コード';
COMMENT ON COLUMN prd_items_history.item_name IS '商品名';
COMMENT ON COLUMN prd_items_history.item_type IS '商品種別';
COMMENT ON COLUMN prd_items_history.is_sales_ended IS '販売終了フラグ';
COMMENT ON COLUMN prd_items_history.is_allowed_stock_unlimited IS '在庫無制限フラグ';
COMMENT ON COLUMN prd_items_history.is_kiracs_csv_disabled IS 'キラックス売上CSV無効フラグ';
COMMENT ON COLUMN prd_items_history.order_limit_count IS '購入制限件数';
COMMENT ON COLUMN prd_items_history.catch_copy IS 'キャッチコピー';
COMMENT ON COLUMN prd_items_history.sales_description IS '商品販売説明文';
COMMENT ON COLUMN prd_items_history.shipment_size_div IS '出荷サイズ区分';
COMMENT ON COLUMN prd_items_history.shipment_div IS '出荷区分';
COMMENT ON COLUMN prd_items_history.shipment_packing_quantity IS '出荷単送個口数';
COMMENT ON COLUMN prd_items_history.note IS 'メモ';
COMMENT ON COLUMN prd_items_history.rank IS '表示順';
COMMENT ON COLUMN prd_items_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_items_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_items_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_items_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_items_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_items_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_items_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_items_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_items_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_items_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_items_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_items_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_items_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_items_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_items_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_items FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_items_trigger AFTER INSERT OR UPDATE ON prd_items FOR EACH ROW EXECUTE FUNCTION insert_prd_items_history();