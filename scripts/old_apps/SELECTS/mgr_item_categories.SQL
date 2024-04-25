SELECT		top_cat.category_id				AS	"親カテゴリID"
,			top_cat.category_name			AS	"親カテゴリ名"
,			child_cat.category_id				AS	"子カテゴリID"
,			child_cat.category_name			AS	"子カテゴリ名"
,			child_cat.r_category_id			AS	"楽天ジャンルID"
,			child_cat.r_shop_category_name		AS	"楽天店舗別カテゴリ名"
,			child_cat.y_category_id			AS	"Yahoo!ショッピングプロダクトカテゴリ"
,			child_cat.y_shop_category_name		AS	"Yahoo!ショッピング店舗別カテゴリ名"
FROM		dtb_category child_cat
LEFT JOIN		dtb_category top_cat
ON			child_cat.parent_category_id	=	top_cat.category_id
WHERE		child_cat.del_flg				=	0
AND			child_cat.level				=	2
ORDER BY		top_cat.rank 	DESC
,			child_cat.rank	DESC;