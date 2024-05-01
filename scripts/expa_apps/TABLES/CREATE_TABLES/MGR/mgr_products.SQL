-- Table: mgr_products;

DROP TABLE IF EXISTS mgr_products;

CREATE TABLE IF NOT EXISTS mgr_products
(
		product_id INTEGER
	,	is_enabled BOOLEAN
	,	store_status TEXT
	,	product_name TEXT
	,	product_code TEXT
	,	product_category TEXT
	,	special_category01 TEXT
	,	special_category02 TEXT
	,	special_category03 TEXT
	,	special_category04 TEXT
	,	special_category05 TEXT
	,	unit01 TEXT
	,	unit_code01 TEXT
	,	unit_quantity01 NUMERIC
	,	is_used01 BOOLEAN
	,	unit02 TEXT
	,	unit_code02 TEXT
	,	unit_quantity02 NUMERIC
	,	is_used02 BOOLEAN
	,	unit03 TEXT
	,	unit_code03 TEXT
	,	unit_quantity03 NUMERIC
	,	is_used03 BOOLEAN
	,	unit04 TEXT
	,	unit_code04 TEXT
	,	unit_quantity04 NUMERIC
	,	is_used04 BOOLEAN
	,	sales_price NUMERIC
	,	quantity_send NUMERIC
	,	is_allowed_minus_stock BOOLEAN
	,	tax_div TEXT
	,	purchase_point NUMERIC
	,	expa_purchase_unit_price NUMERIC
	,	kiracs_purchase_unit_price NUMERIC
	,	is_no_sales BOOLEAN
	,	deliv_type TEXT
	,	main_comment TEXT
	,	rakuten_pc_description TEXT
	,	rakuten_sp_description TEXT
	,	rakuten_sales_description TEXT
	,	search_keyword TEXT
	,	yahoo_relations TEXT
	,	shelf_code TEXT
	,	supplier_name TEXT
	,	supplier_code TEXT
	,	supplier_item_code TEXT
	,	purchase_unit TEXT
	,	purchase_unit_code TEXT
	,	order_unit TEXT
	,	order_unit_code TEXT
	,	expa_pricing_unit TEXT
	,	expa_pricing_unit_code TEXT
	,	kiracs_pricing_unit TEXT
	,	kiracs_pricing_unit_code TEXT
	,	purchase_order_type TEXT
	,	kiracs_item_name01 TEXT
	,	kiracs_item_name02 TEXT
	,	kiracs_item_name_kana TEXT
	,	kiracs_item_code TEXT
	,	spec TEXT
	,	master_size TEXT
	,	master_weight NUMERIC
	,	case_size  INTEGER
	,	itf_code TEXT
	,	jan_code TEXT
	,	division_l TEXT
	,	division_m TEXT
	,	division_s TEXT
	,	recycle_div TEXT
	,	picking_memo TEXT
	,	catalog_info TEXT
	,	catalog_serial_num TEXT
	,	stock_product_id INTEGER
	,	description TEXT
	,	CONSTRAINT mgr_products_pkey PRIMARY KEY (product_id)
);

ALTER TABLE IF EXISTS mgr_products OWNER to expa_apps;

COMMENT ON TABLE mgr_products
	IS '【データ移行用】旧商品マスタ';
COMMENT ON COLUMN mgr_products.product_id IS '商品ID';
COMMENT ON COLUMN mgr_products.is_enabled IS '公開・非公開';
COMMENT ON COLUMN mgr_products.store_status IS '他店舗登録状況';
COMMENT ON COLUMN mgr_products.product_name IS '商品名';
COMMENT ON COLUMN mgr_products.product_code IS '商品コード';
COMMENT ON COLUMN mgr_products.product_category IS '商品カテゴリ';
COMMENT ON COLUMN mgr_products.special_category01 IS '特集カテゴリ1';
COMMENT ON COLUMN mgr_products.special_category02 IS '特集カテゴリ2';
COMMENT ON COLUMN mgr_products.special_category03 IS '特集カテゴリ3';
COMMENT ON COLUMN mgr_products.special_category04 IS '特集カテゴリ4';
COMMENT ON COLUMN mgr_products.special_category05 IS '特集カテゴリ5';
COMMENT ON COLUMN mgr_products.unit01 IS '単位名1';
COMMENT ON COLUMN mgr_products.unit_code01 IS '単位コード1';
COMMENT ON COLUMN mgr_products.unit_quantity01 IS '単位入数1';
COMMENT ON COLUMN mgr_products.is_used01 IS '出力フラグ1';
COMMENT ON COLUMN mgr_products.unit02 IS '単位名2';
COMMENT ON COLUMN mgr_products.unit_code02 IS '単位コード2';
COMMENT ON COLUMN mgr_products.unit_quantity02 IS '単位入数2';
COMMENT ON COLUMN mgr_products.is_used02 IS '出力フラグ2';
COMMENT ON COLUMN mgr_products.unit03 IS '単位名3';
COMMENT ON COLUMN mgr_products.unit_code03 IS '単位コード3';
COMMENT ON COLUMN mgr_products.unit_quantity03 IS '単位入数3';
COMMENT ON COLUMN mgr_products.is_used03 IS '出力フラグ3';
COMMENT ON COLUMN mgr_products.unit04 IS '単位名4';
COMMENT ON COLUMN mgr_products.unit_code04 IS '単位コード4';
COMMENT ON COLUMN mgr_products.unit_quantity04 IS '単位入数4';
COMMENT ON COLUMN mgr_products.is_used04 IS '出力フラグ4';
COMMENT ON COLUMN mgr_products.sales_price IS '販売価格';
COMMENT ON COLUMN mgr_products.quantity_send IS '販売入数';
COMMENT ON COLUMN mgr_products.is_allowed_minus_stock IS 'マイナス在庫許可';
COMMENT ON COLUMN mgr_products.tax_div IS '消費税区分';
COMMENT ON COLUMN mgr_products.purchase_point IS '発注点';
COMMENT ON COLUMN mgr_products.expa_purchase_unit_price IS 'エクス発注単価';
COMMENT ON COLUMN mgr_products.kiracs_purchase_unit_price IS 'キラックス発注単価';
COMMENT ON COLUMN mgr_products.is_no_sales IS 'キラックス売上データ渡さない';
COMMENT ON COLUMN mgr_products.deliv_type IS '出荷個口区分(単送・2個口)';
COMMENT ON COLUMN mgr_products.main_comment IS 'メインコメント';
COMMENT ON COLUMN mgr_products.rakuten_pc_description IS '楽天PC説明文';
COMMENT ON COLUMN mgr_products.rakuten_sp_description IS '楽天SP説明文';
COMMENT ON COLUMN mgr_products.rakuten_sales_description IS '楽天販売説明文';
COMMENT ON COLUMN mgr_products.search_keyword IS '検索キーワード';
COMMENT ON COLUMN mgr_products.yahoo_relations IS 'Yahoo関連商品コード';
COMMENT ON COLUMN mgr_products.shelf_code IS '棚番';
COMMENT ON COLUMN mgr_products.supplier_name IS '仕入先名';
COMMENT ON COLUMN mgr_products.supplier_code IS '仕入先コード';
COMMENT ON COLUMN mgr_products.supplier_item_code IS '仕入先商品コード';
COMMENT ON COLUMN mgr_products.purchase_unit IS '発注単位';
COMMENT ON COLUMN mgr_products.purchase_unit_code IS '発注単位コード';
COMMENT ON COLUMN mgr_products.order_unit IS '受注単位';
COMMENT ON COLUMN mgr_products.order_unit_code IS '受注単位コード';
COMMENT ON COLUMN mgr_products.expa_pricing_unit IS 'エクス値決め単位';
COMMENT ON COLUMN mgr_products.expa_pricing_unit_code IS 'エクス値決め単位コード';
COMMENT ON COLUMN mgr_products.kiracs_pricing_unit IS 'キラックス値決め単位';
COMMENT ON COLUMN mgr_products.kiracs_pricing_unit_code IS 'キラックス値決め単位コード';
COMMENT ON COLUMN mgr_products.purchase_order_type IS '発注書出力形式';
COMMENT ON COLUMN mgr_products.kiracs_item_name01 IS 'キラックス商品名';
COMMENT ON COLUMN mgr_products.kiracs_item_name02 IS 'キラックス規格名';
COMMENT ON COLUMN mgr_products.kiracs_item_name_kana IS 'キラックス商品名(カナ)';
COMMENT ON COLUMN mgr_products.kiracs_item_code IS 'キラックス商品コード';
COMMENT ON COLUMN mgr_products.spec IS 'スペック';
COMMENT ON COLUMN mgr_products.master_size IS 'マスタ登録票サイズ';
COMMENT ON COLUMN mgr_products.master_weight IS 'マスタ登録票重量';
COMMENT ON COLUMN mgr_products.case_size IS 'ケースサイズ';
COMMENT ON COLUMN mgr_products.itf_code IS 'ITFコード';
COMMENT ON COLUMN mgr_products.jan_code IS 'JANコード';
COMMENT ON COLUMN mgr_products.division_l IS '大分類';
COMMENT ON COLUMN mgr_products.division_m IS '中分類';
COMMENT ON COLUMN mgr_products.division_s IS '小分類';
COMMENT ON COLUMN mgr_products.recycle_div IS '容器包装リサイクル区分';
COMMENT ON COLUMN mgr_products.picking_memo IS 'ピッキング備考';
COMMENT ON COLUMN mgr_products.catalog_info IS 'カタログ情報';
COMMENT ON COLUMN mgr_products.catalog_serial_num IS 'カタログ連番';
COMMENT ON COLUMN mgr_products.stock_product_id IS '在庫管理商品ID';
COMMENT ON COLUMN mgr_products.description IS '備考';
