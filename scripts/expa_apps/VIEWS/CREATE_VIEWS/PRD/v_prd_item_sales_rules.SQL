-- VIEW: v_prd_item_sales_rules;

DROP VIEW IF EXISTS v_prd_item_sales_rules;

CREATE VIEW v_prd_item_sales_rules AS 
SELECT		prd_items.item_code
,			prd_items.is_sales_ended		AS	item_is_sales_ended
,			CASE
				WHEN	prd_items.is_allowed_stock_unlimited = TRUE
				THEN	FALSE
				ELSE		TRUE
			END		AS	item_is_stock_limited
,			prd_products.product_is_sales_ended
,			prd_products.product_is_stock_limited
FROM		prd_items
INNER JOIN	(
				SELECT		prd_items.item_code
				,			CASE 
								WHEN	COUNT(sales_ended_div.sales_ended_count) > 0
								THEN	TRUE
								ELSE	FALSE
							END	AS	product_is_sales_ended
				,			CASE 
								WHEN	COUNT(stock_limited.limited_count) > 0
								THEN	TRUE
								ELSE	FALSE
							END	AS	product_is_stock_limited
				FROM		prd_items
				INNER JOIN	prd_item_configurations
				ON			prd_items.item_code					=	prd_item_configurations.item_code
				AND			prd_item_configurations.is_deleted		=	FALSE
				LEFT JOIN		(
								SELECT		product_code
								,			COUNT(*)				AS	sales_ended_count
								FROM		prd_products
								WHERE		is_deleted				=	FALSE
								AND			sales_ended_div			!=	''
								GROUP BY		product_code
							)	sales_ended_div
				ON			prd_item_configurations.product_code		=	sales_ended_div.product_code
				LEFT JOIN		(
								SELECT		product_code
								,			COUNT(*)				AS	limited_count
								FROM		prd_products
								WHERE		is_deleted				=	FALSE
								AND			is_allowed_stock_unlimited	=	FALSE
								GROUP BY		product_code
							)	stock_limited
				ON			prd_item_configurations.product_code		=	stock_limited.product_code
				WHERE		prd_items.is_deleted					=	FALSE
				GROUP BY		prd_items.item_code
			)	prd_products
ON			prd_products.item_code		=	prd_items.item_code
WHERE		prd_items.is_deleted			=	FALSE
ORDER BY		prd_items.item_code;

ALTER VIEW IF EXISTS v_prd_item_sales_rules OWNER to expa_apps;

COMMENT ON VIEW v_prd_item_sales_rules
	IS '【VIEW】商品販売条件マスタ';
COMMENT ON COLUMN v_prd_item_sales_rules.item_code IS '商品コード';
COMMENT ON COLUMN v_prd_item_sales_rules.item_is_sales_ended IS '商品販売終了フラグ';
COMMENT ON COLUMN v_prd_item_sales_rules.item_is_stock_limited IS '商品在庫制限フラグ';
COMMENT ON COLUMN v_prd_item_sales_rules.product_is_sales_ended IS '製品販売終了フラグ';
COMMENT ON COLUMN v_prd_item_sales_rules.product_is_stock_limited IS '製品在庫制限フラグ';