-- 製品コードから単位リストを取得する
CREATE OR REPLACE FUNCTION GET_PRODUCT_UNIT_LIST(productCode TEXT) RETURNS TEXT AS $BODY$
DECLARE
	--戻り値
	returnStr TEXT;
	--発注単位
	purchaseUnitCode TEXT;
	purchaseUnitName TEXT;
	--受注単位コード
	orderUnitCode TEXT;
	orderUnitName TEXT;
	
	--製品別単位取得
	unitCursor CURSOR 
	FOR
		SELECT		prd_product_unit_relations.unit_code
		,			mst_product_units.unit_name
		,			prd_product_unit_relations.unit_quantity
		FROM		mst_product_units
		INNER JOIN	prd_product_unit_relations
		ON			mst_product_units.unit_code					=	prd_product_unit_relations.unit_code
		AND			prd_product_unit_relations.is_deleted		=	FALSE
		AND			prd_product_unit_relations.product_code		=	productCode
		WHERE		mst_product_units.is_deleted				=	FALSE
		ORDER BY	prd_product_unit_relations.unit_quantity
	;
	unitRec RECORD;
BEGIN
	returnStr := '';

	SELECT	purchase_unit_code
	,		order_unit_code
	INTO	purchaseUnitCode
	,		orderUnitCode
	FROM	prd_products
	WHERE	is_deleted			=	FALSE
	AND		product_code		=	productCode
	;
	RAISE INFO '発注単位 = %', purchaseUnitCode;
	RAISE INFO '受注単位 = %', orderUnitCode;

	OPEN unitCursor;
	LOOP FETCH unitCursor INTO unitRec;
		EXIT WHEN NOT FOUND;
		
		purchaseUnitName := '';
		orderUnitName := '';
		
		IF returnStr <> '' THEN
			returnStr := returnStr || '\n';
		END IF;
		
		IF purchaseUnitCode IS NOT NULL AND purchaseUnitCode = unitRec.unit_code THEN
			purchaseUnitName := '発　';
		END IF;
		
		IF orderUnitCode IS NOT NULL AND orderUnitCode = unitRec.unit_code THEN
			orderUnitName := '受　';
		END IF;
		
		--リストに追加
		returnStr := returnStr || orderUnitName || purchaseUnitName || TO_CHAR(unitRec.unit_quantity, 'FM999,999,999');
	END LOOP;
	CLOSE unitCursor;
	
	return returnStr;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION GET_PRODUCT_UNIT_LIST OWNER TO expa_apps;