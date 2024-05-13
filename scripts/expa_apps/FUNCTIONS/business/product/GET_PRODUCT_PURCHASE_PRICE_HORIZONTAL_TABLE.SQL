DROP FUNCTION IF EXISTS GET_PRODUCT_PURCHASE_PRICE_HORIZONTAL_TABLE;
-- 製品仕入単価テーブル取得(横持ち)
CREATE OR REPLACE FUNCTION GET_PRODUCT_PURCHASE_PRICE_HORIZONTAL_TABLE(targetDate DATE) 
RETURNS TABLE (
		product_code			TEXT
	,	start_on				DATE
	,	id					BIGINT
	,	lot_seq1				SMALLINT
	,	lot_quantity1			INTEGER
	,	kiracs_purchase_unit_price1	NUMERIC
	,	expa_purchase_unit_price1	NUMERIC
	,	lot_seq2				SMALLINT
	,	lot_quantity2			INTEGER
	,	kiracs_purchase_unit_price2	NUMERIC
	,	expa_purchase_unit_price2	NUMERIC
	,	lot_seq3				SMALLINT
	,	lot_quantity3			INTEGER
	,	kiracs_purchase_unit_price3	NUMERIC
	,	expa_purchase_unit_price3	NUMERIC
	,	lot_seq4				SMALLINT
	,	lot_quantity4			INTEGER
	,	kiracs_purchase_unit_price4	NUMERIC
	,	expa_purchase_unit_price4	NUMERIC
) AS $BODY$
BEGIN
	RETURN QUERY
		SELECT		prd_products.product_code							AS	out_product_code
		,			prd_product_purchase_prices1.start_on					AS	out_start_on
		,			prd_product_purchase_prices1.id						AS	out_id
		,			prd_product_purchase_prices1.lot_seq					AS	out_lot_seq1
		,			prd_product_purchase_prices1.lot_quantity				AS	out_lot_quantity1
		,			prd_product_purchase_prices1.kiracs_purchase_unit_price	AS	out_kiracs_purchase_unit_price1
		,			prd_product_purchase_prices1.expa_purchase_unit_price	AS	out_expa_purchase_unit_price1
		,			prd_product_purchase_prices2.lot_seq					AS	out_lot_seq2
		,			prd_product_purchase_prices2.lot_quantity				AS	out_lot_quantity2
		,			prd_product_purchase_prices2.kiracs_purchase_unit_price	AS	out_kiracs_purchase_unit_price2
		,			prd_product_purchase_prices2.expa_purchase_unit_price	AS	out_expa_purchase_unit_price2
		,			prd_product_purchase_prices3.lot_seq					AS	out_lot_seq3
		,			prd_product_purchase_prices3.lot_quantity				AS	out_lot_quantity3
		,			prd_product_purchase_prices3.kiracs_purchase_unit_price	AS	out_kiracs_purchase_unit_price3
		,			prd_product_purchase_prices3.expa_purchase_unit_price	AS	out_expa_purchase_unit_price3
		,			prd_product_purchase_prices4.lot_seq					AS	out_lot_seq4
		,			prd_product_purchase_prices4.lot_quantity				AS	out_lot_quantity4
		,			prd_product_purchase_prices4.kiracs_purchase_unit_price	AS	out_kiracs_purchase_unit_price4
		,			prd_product_purchase_prices4.expa_purchase_unit_price	AS	out_expa_purchase_unit_price4
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
		LEFT JOIN		prd_product_purchase_prices	prd_product_purchase_prices1
		ON			target_purchase_price.product_code	=	prd_product_purchase_prices1.product_code
		AND			target_purchase_price.start_on		=	prd_product_purchase_prices1.start_on
		AND			prd_product_purchase_prices1.lot_seq	=	1
		LEFT JOIN		prd_product_purchase_prices	prd_product_purchase_prices2
		ON			target_purchase_price.product_code	=	prd_product_purchase_prices2.product_code
		AND			target_purchase_price.start_on		=	prd_product_purchase_prices2.start_on
		AND			prd_product_purchase_prices2.lot_seq	=	2
		LEFT JOIN		prd_product_purchase_prices	prd_product_purchase_prices3
		ON			target_purchase_price.product_code	=	prd_product_purchase_prices3.product_code
		AND			target_purchase_price.start_on		=	prd_product_purchase_prices3.start_on
		AND			prd_product_purchase_prices3.lot_seq	=	3
		LEFT JOIN		prd_product_purchase_prices	prd_product_purchase_prices4
		ON			target_purchase_price.product_code	=	prd_product_purchase_prices4.product_code
		AND			target_purchase_price.start_on		=	prd_product_purchase_prices4.start_on
		AND			prd_product_purchase_prices4.lot_seq	=	4
		WHERE		prd_products.is_deleted			=	FALSE
		ORDER BY		prd_products.product_code
		;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION GET_PRODUCT_PURCHASE_PRICE_HORIZONTAL_TABLE OWNER TO expa_apps;