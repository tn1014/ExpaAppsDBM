-- Table: prd_products;
-- Table: prd_products_history;

DROP TABLE IF EXISTS prd_products;
DROP TABLE IF EXISTS prd_products_history;

CREATE TABLE IF NOT EXISTS prd_products
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL UNIQUE
	,	product_name TEXT NOT NULL
	,	product_type TEXT NOT NULL
	,	is_allowed_stock_unlimited BOOLEAN NOT NULL DEFAULT TRUE
	,	sales_ended_div TEXT NOT NULL
	,	sales_ended_reason TEXT NOT NULL
	,	sales_ended_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	supplier_code TEXT NOT NULL
	,	supplier_item_code TEXT NOT NULL
	,	shelf_code01 TEXT NOT NULL
	,	shelf_code02 TEXT NOT NULL
	,	shelf_code03 TEXT NOT NULL
	,	shelf_code04 TEXT NOT NULL
	,	shelf_code05 TEXT NOT NULL
	,	case_size NUMERIC
	,	catalog_info TEXT NOT NULL
	,	catalog_serial_num TEXT NOT NULL
	,	purchase_point_quantity INTEGER
	,	carry_location_code TEXT NOT NULL
	,	kiracs_item_code TEXT NOT NULL
	,	kiracs_item_name01 TEXT NOT NULL
	,	kiracs_item_name02 TEXT NOT NULL
	,	kiracs_item_name_kana TEXT NOT NULL
	,	master_size TEXT NOT NULL
	,	master_weight TEXT NOT NULL
	,	division_l_code TEXT NOT NULL
	,	division_m_code TEXT NOT NULL
	,	division_s_code TEXT NOT NULL
	,	recycle_code TEXT NOT NULL
	,	jan_code TEXT NOT NULL
	,	itf_code TEXT NOT NULL
	,	purchase_unit_code TEXT NOT NULL
	,	order_unit_code TEXT NOT NULL
	,	kiracs_pricing_unit_code TEXT NOT NULL
	,	expa_pricing_unit_code TEXT NOT NULL
	,	picking_description TEXT NOT NULL
	,	purchase_description TEXT NOT NULL
	,	summary TEXT NOT NULL
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
	,	CONSTRAINT prd_products_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_products OWNER to expa_apps;

COMMENT ON TABLE prd_products
	IS '製品マスタ';
COMMENT ON COLUMN prd_products.id IS '製品ID';
COMMENT ON COLUMN prd_products.product_code IS '製品コード';
COMMENT ON COLUMN prd_products.product_name IS '製品名';
COMMENT ON COLUMN prd_products.product_type IS '製品種別';
COMMENT ON COLUMN prd_products.is_allowed_stock_unlimited IS '在庫無制限フラグ';
COMMENT ON COLUMN prd_products.sales_ended_div IS '販売終了区分';
COMMENT ON COLUMN prd_products.sales_ended_reason IS '販売終了理由';
COMMENT ON COLUMN prd_products.sales_ended_at IS '販売終了日時';
COMMENT ON COLUMN prd_products.supplier_code IS '仕入先コード';
COMMENT ON COLUMN prd_products.supplier_item_code IS '仕入先商品コード';
COMMENT ON COLUMN prd_products.shelf_code01 IS '棚番1';
COMMENT ON COLUMN prd_products.shelf_code02 IS '棚番2';
COMMENT ON COLUMN prd_products.shelf_code03 IS '棚番3';
COMMENT ON COLUMN prd_products.shelf_code04 IS '棚番4';
COMMENT ON COLUMN prd_products.shelf_code05 IS '棚番5';
COMMENT ON COLUMN prd_products.case_size IS 'ケースサイズ';
COMMENT ON COLUMN prd_products.catalog_info IS 'カタログ情報';
COMMENT ON COLUMN prd_products.catalog_serial_num IS 'カタログシリアル番号';
COMMENT ON COLUMN prd_products.purchase_point_quantity IS '発注点数量';
COMMENT ON COLUMN prd_products.carry_location_code IS '移動元在庫場所コード';
COMMENT ON COLUMN prd_products.kiracs_item_code IS 'キラックス商品コード';
COMMENT ON COLUMN prd_products.kiracs_item_name01 IS 'キラックス商品名1';
COMMENT ON COLUMN prd_products.kiracs_item_name02 IS 'キラックス商品名2';
COMMENT ON COLUMN prd_products.kiracs_item_name_kana IS '(マスタ申請用)キラックス商品名カナ';
COMMENT ON COLUMN prd_products.master_size IS '(マスタ申請用)サイズ';
COMMENT ON COLUMN prd_products.master_weight IS '(マスタ申請用)重量';
COMMENT ON COLUMN prd_products.division_l_code IS '(マスタ申請用)大分類コード';
COMMENT ON COLUMN prd_products.division_m_code IS '(マスタ申請用)中分類コード';
COMMENT ON COLUMN prd_products.division_s_code IS '(マスタ申請用)小分類コード';
COMMENT ON COLUMN prd_products.recycle_code IS '(マスタ申請用)容器包装リサイクルコード';
COMMENT ON COLUMN prd_products.jan_code IS '(マスタ申請用)JANコード';
COMMENT ON COLUMN prd_products.itf_code IS '(マスタ申請用)ITFコード';
COMMENT ON COLUMN prd_products.purchase_unit_code IS '発注単位コード(キラックス→仕入先)';
COMMENT ON COLUMN prd_products.order_unit_code IS '(マスタ申請用)エクス→キラックス受注単位コード';
COMMENT ON COLUMN prd_products.kiracs_pricing_unit_code IS '(マスタ申請用)キラックス→仕入先値決め単位コード';
COMMENT ON COLUMN prd_products.expa_pricing_unit_code IS '(マスタ申請用)エクス→キラックス値決め単位コード';
COMMENT ON COLUMN prd_products.expa_pricing_unit_code IS '(マスタ申請用)エクス→キラックス値決め単位コード';
COMMENT ON COLUMN prd_products.picking_description IS 'ピッキング備考';
COMMENT ON COLUMN prd_products.purchase_description IS '発注備考';
COMMENT ON COLUMN prd_products.summary IS '製品概要';
COMMENT ON COLUMN prd_products.note IS 'メモ';
COMMENT ON COLUMN prd_products.rank IS '表示順';
COMMENT ON COLUMN prd_products.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_products.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_products.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_products.created_at IS '作成日時';
COMMENT ON COLUMN prd_products.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_products.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_products.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_products.updated_at IS '更新日時';
COMMENT ON COLUMN prd_products.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_products.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_products.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_products.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_products.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_products.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_products_history
(
		id BIGSERIAL
	,	product_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL
	,	product_code TEXT NOT NULL
	,	product_name TEXT NOT NULL
	,	product_type TEXT NOT NULL
	,	is_allowed_stock_unlimited BOOLEAN NOT NULL DEFAULT TRUE
	,	sales_ended_div TEXT NOT NULL
	,	sales_ended_reason TEXT NOT NULL
	,	sales_ended_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	supplier_code TEXT NOT NULL
	,	supplier_item_code TEXT NOT NULL
	,	shelf_code01 TEXT NOT NULL
	,	shelf_code02 TEXT NOT NULL
	,	shelf_code03 TEXT NOT NULL
	,	shelf_code04 TEXT NOT NULL
	,	shelf_code05 TEXT NOT NULL
	,	case_size NUMERIC
	,	catalog_info TEXT NOT NULL
	,	catalog_serial_num TEXT NOT NULL
	,	purchase_point_quantity INTEGER
	,	carry_location_code TEXT NOT NULL
	,	kiracs_item_code TEXT NOT NULL
	,	kiracs_item_name01 TEXT NOT NULL
	,	kiracs_item_name02 TEXT NOT NULL
	,	kiracs_item_name_kana TEXT NOT NULL
	,	master_size TEXT NOT NULL
	,	master_weight TEXT NOT NULL
	,	division_l_code TEXT NOT NULL
	,	division_m_code TEXT NOT NULL
	,	division_s_code TEXT NOT NULL
	,	recycle_code TEXT NOT NULL
	,	jan_code TEXT NOT NULL
	,	itf_code TEXT NOT NULL
	,	purchase_unit_code TEXT NOT NULL
	,	order_unit_code TEXT NOT NULL
	,	kiracs_pricing_unit_code TEXT NOT NULL
	,	expa_pricing_unit_code TEXT NOT NULL
	,	picking_description TEXT NOT NULL
	,	purchase_description TEXT NOT NULL
	,	summary TEXT NOT NULL
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
	,	CONSTRAINT prd_products_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_products_history
	IS '[履歴]製品マスタ';
COMMENT ON COLUMN prd_products_history.id IS '履歴ID';
COMMENT ON COLUMN prd_products_history.product_id IS '製品ID';
COMMENT ON COLUMN prd_products_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_products_history.product_code IS '製品コード';
COMMENT ON COLUMN prd_products_history.product_name IS '製品名';
COMMENT ON COLUMN prd_products_history.product_type IS '製品種別';
COMMENT ON COLUMN prd_products_history.is_allowed_stock_unlimited IS '在庫無制限フラグ';
COMMENT ON COLUMN prd_products_history.sales_ended_div IS '販売終了区分';
COMMENT ON COLUMN prd_products_history.sales_ended_reason IS '販売終了理由';
COMMENT ON COLUMN prd_products_history.sales_ended_at IS '販売終了日時';
COMMENT ON COLUMN prd_products_history.supplier_code IS '仕入先コード';
COMMENT ON COLUMN prd_products_history.supplier_item_code IS '仕入先商品コード';
COMMENT ON COLUMN prd_products_history.shelf_code01 IS '棚番1';
COMMENT ON COLUMN prd_products_history.shelf_code02 IS '棚番2';
COMMENT ON COLUMN prd_products_history.shelf_code03 IS '棚番3';
COMMENT ON COLUMN prd_products_history.shelf_code04 IS '棚番4';
COMMENT ON COLUMN prd_products_history.shelf_code05 IS '棚番5';
COMMENT ON COLUMN prd_products_history.case_size IS 'ケースサイズ';
COMMENT ON COLUMN prd_products_history.catalog_info IS 'カタログ情報';
COMMENT ON COLUMN prd_products_history.catalog_serial_num IS 'カタログシリアル番号';
COMMENT ON COLUMN prd_products_history.purchase_point_quantity IS '発注点数量';
COMMENT ON COLUMN prd_products_history.carry_location_code IS '移動元在庫場所コード';
COMMENT ON COLUMN prd_products_history.kiracs_item_code IS 'キラックス商品コード';
COMMENT ON COLUMN prd_products_history.kiracs_item_name01 IS 'キラックス商品名1';
COMMENT ON COLUMN prd_products_history.kiracs_item_name02 IS 'キラックス商品名2';
COMMENT ON COLUMN prd_products_history.kiracs_item_name_kana IS '(マスタ申請用)キラックス商品名カナ';
COMMENT ON COLUMN prd_products_history.master_size IS '(マスタ申請用)サイズ';
COMMENT ON COLUMN prd_products_history.master_weight IS '(マスタ申請用)重量';
COMMENT ON COLUMN prd_products_history.division_l_code IS '(マスタ申請用)大分類コード';
COMMENT ON COLUMN prd_products_history.division_m_code IS '(マスタ申請用)中分類コード';
COMMENT ON COLUMN prd_products_history.division_s_code IS '(マスタ申請用)小分類コード';
COMMENT ON COLUMN prd_products_history.recycle_code IS '(マスタ申請用)容器包装リサイクルコード';
COMMENT ON COLUMN prd_products_history.jan_code IS '(マスタ申請用)JANコード';
COMMENT ON COLUMN prd_products_history.itf_code IS '(マスタ申請用)ITFコード';
COMMENT ON COLUMN prd_products_history.purchase_unit_code IS '発注単位コード(キラックス→仕入先)';
COMMENT ON COLUMN prd_products_history.order_unit_code IS '(マスタ申請用)エクス→キラックス受注単位コード';
COMMENT ON COLUMN prd_products_history.kiracs_pricing_unit_code IS '(マスタ申請用)キラックス→仕入先値決め単位コード';
COMMENT ON COLUMN prd_products_history.expa_pricing_unit_code IS '(マスタ申請用)エクス→キラックス値決め単位コード';
COMMENT ON COLUMN prd_products_history.picking_description IS 'ピッキング備考';
COMMENT ON COLUMN prd_products_history.purchase_description IS '発注備考';
COMMENT ON COLUMN prd_products_history.summary IS '製品概要';
COMMENT ON COLUMN prd_products_history.note IS 'メモ';
COMMENT ON COLUMN prd_products_history.rank IS '表示順';
COMMENT ON COLUMN prd_products_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_products_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_products_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_products_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_products_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_products_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_products_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_products_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_products_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_products_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_products_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_products_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_products_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_products_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_products_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_products FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_products_trigger AFTER INSERT OR UPDATE ON prd_products FOR EACH ROW EXECUTE FUNCTION insert_prd_products_history();