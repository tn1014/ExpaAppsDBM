-- VIEW: v_prd_item_store_statuses;

DROP VIEW IF EXISTS v_prd_item_store_statuses;

CREATE VIEW v_prd_item_store_statuses AS 
SELECT		DISTINCT prd_item_store_statuses.item_code
,			honten.store_sales_status			AS	honten_store_sales_status
,			rakuten.store_sales_status			AS	rakuten_store_sales_status
,			yahoo.store_sales_status			AS	yahoo_store_sales_status
FROM		prd_item_store_statuses
LEFT JOIN		prd_item_store_statuses honten
ON			prd_item_store_statuses.item_code	=	honten.item_code
AND			honten.store_code				=	'01'
AND			honten.is_deleted				=	FALSE
LEFT JOIN		prd_item_store_statuses rakuten
ON			prd_item_store_statuses.item_code	=	rakuten.item_code
AND			rakuten.store_code				=	'02'
AND			rakuten.is_deleted				=	FALSE
LEFT JOIN		prd_item_store_statuses yahoo
ON			prd_item_store_statuses.item_code	=	yahoo.item_code
AND			yahoo.store_code				=	'03'
AND			yahoo.is_deleted					=	FALSE
WHERE		prd_item_store_statuses.is_deleted	=	FALSE
ORDER BY		item_code;

ALTER VIEW IF EXISTS v_prd_item_store_statuses OWNER to expa_apps;

COMMENT ON VIEW v_prd_item_store_statuses
	IS '【VIEW】商品店舗別販売ステータスマスタ';
COMMENT ON COLUMN v_prd_item_store_statuses.item_code IS '商品コード';
COMMENT ON COLUMN v_prd_item_store_statuses.honten_store_sales_status IS '本店販売ステータス';
COMMENT ON COLUMN v_prd_item_store_statuses.rakuten_store_sales_status IS '楽天市場販売ステータス';
COMMENT ON COLUMN v_prd_item_store_statuses.yahoo_store_sales_status IS 'Yahoo!ショッピング販売ステータス';