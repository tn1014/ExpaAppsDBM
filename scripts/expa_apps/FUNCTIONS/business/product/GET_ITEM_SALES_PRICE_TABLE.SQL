DROP FUNCTION IF EXISTS GET_ITEM_SALES_PRICE_TABLE;
-- 商品販売単価テーブル取得
CREATE OR REPLACE FUNCTION GET_ITEM_SALES_PRICE_TABLE(targetDate DATE) 
RETURNS TABLE (
		item_code				TEXT
	,	start_on				DATE
	,	tax_div				TEXT
	,	tax_rate				NUMERIC
	,	included_tax_div			TEXT
	,	min_sales_price			NUMERIC
	,	max_sales_price			NUMERIC
	,	min_sales_price_intax		NUMERIC
	,	max_sales_price_intax		NUMERIC
	,	honten_sales_price		NUMERIC
	,	honten_sales_price_intax	NUMERIC
	,	rakuten_sales_price		NUMERIC
	,	rakuten_sales_price_intax	NUMERIC
	,	yahoo_sales_price		NUMERIC
	,	yahoo_sales_price_intax	NUMERIC
	,	fax_sales_price			NUMERIC
	,	fax_sales_price_intax		NUMERIC
) AS $BODY$
BEGIN
	RETURN QUERY
		SELECT		prd_item_sales_prices.item_code					AS	out_item_code
		,			prd_item_sales_prices.start_on					AS	out_start_on
		,			prd_item_sales_prices.tax_div					AS	out_tax_div
		,			prd_item_sales_prices.tax_rate					AS	out_tax_rate
		,			prd_item_sales_prices.included_tax_div				AS	out_included_tax_div
		,			prd_item_sales_price_summary.min_sales_price		AS	out_min_sales_price
		,			prd_item_sales_price_summary.max_sales_price		AS	out_max_sales_price
		,			prd_item_sales_price_summary.min_sales_price_intax	AS	out_min_sales_price_intax
		,			prd_item_sales_price_summary.max_sales_price_intax	AS	out_max_sales_price_intax
		,			honten.sales_price							AS	out_honten_sales_price
		,			honten.sales_price_intax						AS	out_honten_sales_price_intax
		,			rakuten.sales_price							AS	out_rakuten_sales_price
		,			rakuten.sales_price_intax						AS	out_rakuten_sales_price_intax
		,			yahoo.sales_price							AS	out_yahoo_sales_price
		,			yahoo.sales_price_intax						AS	out_yahoo_sales_price_intax
		,			fax.sales_price								AS	out_fax_sales_price
		,			fax.sales_price_intax							AS	out_fax_sales_price_intax
		FROM		prd_item_sales_prices
		INNER JOIN	(
						SELECT		target_prices.item_code
						,			MAX(target_prices.start_on)			AS	start_on
						FROM		prd_item_sales_prices 				target_prices
						WHERE		target_prices.is_deleted			=	FALSE
						AND			target_prices.start_on				<=	targetDate
						GROUP BY		target_prices.item_code
					) target_prices
		ON			prd_item_sales_prices.item_code		=	target_prices.item_code
		AND			prd_item_sales_prices.start_on		=	target_prices.start_on
		LEFT JOIN		(
						SELECT		prd_item_sales_price_store_relations.item_code
						,			prd_item_sales_price_store_relations.start_on
						,			MAX(prd_item_sales_price_store_relations.sales_price)			AS	max_sales_price
						,			MIN(prd_item_sales_price_store_relations.sales_price)			AS	min_sales_price
						,			MAX(prd_item_sales_price_store_relations.sales_price_intax)		AS	max_sales_price_intax
						,			MIN(prd_item_sales_price_store_relations.sales_price_intax)		AS	min_sales_price_intax
						FROM		prd_item_sales_price_store_relations
						WHERE		prd_item_sales_price_store_relations.is_deleted				=	FALSE
						GROUP BY		prd_item_sales_price_store_relations.item_code
						,			prd_item_sales_price_store_relations.start_on
					)	prd_item_sales_price_summary
		ON			prd_item_sales_prices.item_code		=	prd_item_sales_price_summary.item_code
		AND			prd_item_sales_prices.start_on		=	prd_item_sales_price_summary.start_on
		LEFT JOIN		prd_item_sales_price_store_relations honten
		ON			prd_item_sales_prices.item_code		=	honten.item_code
		AND			prd_item_sales_prices.start_on		=	honten.start_on
		AND			honten.store_code				=	'01'
		AND			honten.is_deleted				=	FALSE
		LEFT JOIN		prd_item_sales_price_store_relations rakuten
		ON			prd_item_sales_prices.item_code		=	rakuten.item_code
		AND			prd_item_sales_prices.start_on		=	rakuten.start_on
		AND			rakuten.store_code				=	'02'
		AND			rakuten.is_deleted				=	FALSE
		LEFT JOIN		prd_item_sales_price_store_relations yahoo
		ON			prd_item_sales_prices.item_code		=	yahoo.item_code
		AND			prd_item_sales_prices.start_on		=	yahoo.start_on
		AND			yahoo.store_code				=	'03'
		AND			yahoo.is_deleted					=	FALSE
		LEFT JOIN		prd_item_sales_price_store_relations fax
		ON			prd_item_sales_prices.item_code		=	fax.item_code
		AND			prd_item_sales_prices.start_on		=	fax.start_on
		AND			fax.store_code					=	'99'
		AND			fax.is_deleted					=	FALSE
		WHERE		prd_item_sales_prices.is_deleted		=	FALSE
		ORDER BY		prd_item_sales_prices.item_code
		;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION GET_ITEM_SALES_PRICE_TABLE OWNER TO expa_apps;