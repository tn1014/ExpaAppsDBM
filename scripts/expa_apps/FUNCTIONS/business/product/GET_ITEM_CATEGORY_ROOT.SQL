-- 商品コードからカテゴリルートを取得する
CREATE OR REPLACE FUNCTION GET_ITEM_CATEGORY_ROOT(itemCode TEXT) RETURNS TEXT AS $BODY$
DECLARE
	--戻り値
	returnStr TEXT;

	--商品カテゴリ取得
	categoryCursor CURSOR 
	FOR
		SELECT		prd_item_category_relations.item_code
		,			v_prd_item_category_roots.item_category_type
		,			v_prd_item_category_roots.maincategory_name
		,			v_prd_item_category_roots.subcategory_name
		,			v_prd_item_category_roots.category_root
		FROM		v_prd_item_category_roots
		INNER JOIN	prd_item_category_relations
		ON			v_prd_item_category_roots.subcategory_id	=	prd_item_category_relations.subcategory_id
		AND			prd_item_category_relations.is_deleted		=	FALSE
		AND			prd_item_category_relations.item_code		=	itemCode
		ORDER BY		v_prd_item_category_roots.category_type_is_selected
		,			v_prd_item_category_roots.category_type_rank
		,			v_prd_item_category_roots.maincategory_rank
	;
	categoryRec RECORD;
BEGIN
	returnStr := '';

	OPEN categoryCursor;
	LOOP FETCH categoryCursor INTO categoryRec;
		EXIT WHEN NOT FOUND;
		
		IF returnStr <> '' THEN
			returnStr := returnStr || '\n';
		END IF;
		
		returnStr := returnStr || categoryRec.category_root;
	END LOOP;
	CLOSE categoryCursor;
	
	return returnStr;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION GET_ITEM_CATEGORY_ROOT OWNER TO expa_apps;