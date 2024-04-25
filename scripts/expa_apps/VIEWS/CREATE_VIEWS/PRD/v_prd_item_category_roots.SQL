-- VIEW: v_prd_item_category_roots;

DROP VIEW IF EXISTS v_prd_item_category_roots;

CREATE VIEW v_prd_item_category_roots AS 
SELECT		prd_item_category_types.id					AS	item_category_type_id
,			prd_item_category_types.item_category_type
,			prd_maincategories.id						AS	maincategory_id
,			prd_maincategories.maincategory_name
,			prd_subcategories.id						AS	subcategory_id
,			prd_subcategories.subcategory_name
,			'【' || prd_item_category_types.item_category_type || '】' || '>>' || prd_maincategories.maincategory_name || '>>' || prd_subcategories.subcategory_name	AS category_root
,			prd_item_category_types.is_selected			AS	category_type_is_selected
,			prd_item_category_types.rank				AS	category_type_rank
,			prd_maincategory_orders.rank				AS	maincategory_rank
FROM		prd_item_category_types
INNER JOIN	prd_maincategories
ON			prd_item_category_types.id				=	prd_maincategories.item_category_type_id
AND			prd_maincategories.is_deleted			=	FALSE
INNER JOIN	prd_subcategories
ON			prd_maincategories.id					=	prd_subcategories.maincategory_id
AND			prd_subcategories.is_deleted			=	FALSE
LEFT JOIN		prd_maincategory_orders
ON			prd_maincategories.item_category_type_id	=	prd_maincategory_orders.item_category_type_id
AND			prd_maincategories.id					=	prd_maincategory_orders.maincategory_id
AND			prd_maincategory_orders.is_deleted		=	FALSE
WHERE		prd_item_category_types.is_deleted		=	FALSE
ORDER BY		prd_item_category_types.is_selected
,			prd_item_category_types.rank
,			prd_maincategory_orders.rank NULLS LAST
;

ALTER VIEW IF EXISTS v_prd_item_category_roots OWNER to expa_apps;

COMMENT ON VIEW v_prd_item_category_roots
	IS '【VIEW】商品カテゴリマスタ';
COMMENT ON COLUMN v_prd_item_category_roots.item_category_type_id IS 'カテゴリ分類ID';
COMMENT ON COLUMN v_prd_item_category_roots.item_category_type IS 'カテゴリ分類';
COMMENT ON COLUMN v_prd_item_category_roots.maincategory_id IS '大カテゴリID';
COMMENT ON COLUMN v_prd_item_category_roots.maincategory_name IS '大カテゴリ名';
COMMENT ON COLUMN v_prd_item_category_roots.subcategory_id IS '小カテゴリID';
COMMENT ON COLUMN v_prd_item_category_roots.subcategory_name IS '小カテゴリ名';
COMMENT ON COLUMN v_prd_item_category_roots.category_root IS 'カテゴリルート';
COMMENT ON COLUMN v_prd_item_category_roots.category_type_is_selected IS 'カテゴリ分類選択';
COMMENT ON COLUMN v_prd_item_category_roots.category_type_rank IS 'カテゴリ分類表示順';
COMMENT ON COLUMN v_prd_item_category_roots.maincategory_rank IS '大カテゴリ表示順';