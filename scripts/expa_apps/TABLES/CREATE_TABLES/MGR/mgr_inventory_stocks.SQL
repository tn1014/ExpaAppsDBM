-- Table: mgr_inventory_stocks;

DROP TABLE IF EXISTS mgr_inventory_stocks;

CREATE TABLE IF NOT EXISTS mgr_inventory_stocks
(
		stock_product_id		INTEGER
	,	product_name		TEXT
	,	current_stock		NUMERIC
	,	order_quantity		NUMERIC
	,	registered_on		DATE
	,	CONSTRAINT mgr_inventory_stocks_pkey PRIMARY KEY (stock_product_id)
);

ALTER TABLE IF EXISTS mgr_inventory_stocks OWNER to expa_apps;

COMMENT ON TABLE mgr_inventory_stocks
	IS '【データ移行用】現在倉庫在庫データ';
COMMENT ON COLUMN mgr_inventory_stocks.stock_product_id IS '在庫商品ID';
COMMENT ON COLUMN mgr_inventory_stocks.product_name IS '商品名';
COMMENT ON COLUMN mgr_inventory_stocks.current_stock IS '倉庫在庫数';
COMMENT ON COLUMN mgr_inventory_stocks.order_quantity IS '内受注数';
COMMENT ON COLUMN mgr_inventory_stocks.registered_on IS '在庫登録日';