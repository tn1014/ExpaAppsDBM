DROP FUNCTION IF EXISTS GET_PRODUCT_PURCHASE_PRICE_TABLE;
-- 製品仕入単価テーブル取得(縦持ち)
CREATE OR REPLACE FUNCTION GET_PRODUCT_PURCHASE_PRICE_TABLE(targetDate DATE) 
RETURNS TABLE (
		product_code			TEXT
	,	start_on				DATE
	,	id					BIGINT
	,	lot_seq				SMALLINT
	,	lot_quantity			INTEGER
	,	kiracs_purchase_unit_price	NUMERIC
	,	expa_purchase_unit_price	NUMERIC
	,	recommend_unit_price	NUMERIC
) AS $BODY$
BEGIN
	RETURN QUERY
		SELECT		prd_products.product_code							AS	out_product_code
		,			prd_product_purchase_prices.start_on					AS	out_start_on
		,			prd_product_purchase_prices.id						AS	out_id
		,			prd_product_purchase_prices.lot_seq					AS	out_lot_seq
		,			prd_product_purchase_prices.lot_quantity				AS	out_lot_quantity
		,			prd_product_purchase_prices.kiracs_purchase_unit_price	AS	out_kiracs_purchase_unit_price
		,			prd_product_purchase_prices.expa_purchase_unit_price		AS	out_expa_purchase_unit_price
		,			prd_product_purchase_prices.recommend_unit_price		AS	out_recommend_unit_price
		FROM		prd_products
		INNER JOIN	(
						SELECT		prd_product_purchase_prices.product_code
						,			MAX(prd_product_purchase_prices.start_on)	AS	start_on
						FROM		prd_product_purchase_prices
						WHERE		prd_product_purchase_prices.is_deleted	=	FALSE
						AND			prd_product_purchase_prices.start_on		<=	targetDate
						GROUP BY		prd_product_purchase_prices.product_code
					) target_purchase_price
		ON			prd_products.product_code			=	target_purchase_price.product_code
		INNER JOIN	prd_product_purchase_prices
		ON			target_purchase_price.product_code	=	prd_product_purchase_prices.product_code
		AND			target_purchase_price.start_on		=	prd_product_purchase_prices.start_on
		WHERE		prd_products.is_deleted			=	FALSE
		ORDER BY		prd_products.product_code
		,			prd_product_purchase_prices.lot_quantity
		;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION GET_PRODUCT_PURCHASE_PRICE_TABLE OWNER TO expa_apps;