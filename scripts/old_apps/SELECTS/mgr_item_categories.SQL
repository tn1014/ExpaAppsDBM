--カテゴリ一覧を取得する
SELECT		'NORMAL'						AS	"カテゴリ区分"
,			top_cat.category_id				AS	"親カテゴリID"
,			top_cat.category_name			AS	"親カテゴリ名"
,			child_cat.category_id				AS	"子カテゴリID"
,			child_cat.category_name			AS	"子カテゴリ名"
,			child_cat.r_category_id			AS	"楽天ジャンルID"
,			child_cat.r_shop_category_name		AS	"楽天店舗別カテゴリ名"
,			child_cat.y_category_id			AS	"Yahoo!ショッピングプロダクトカテゴリ"
,			child_cat.y_shop_category_name		AS	"Yahoo!ショッピング店舗別カテゴリ名"
,			top_cat.rank					AS	"親カテゴリ表示順"
,			child_cat.rank					AS	"子カテゴリ表示順"
FROM		dtb_category child_cat
LEFT JOIN		dtb_category top_cat
ON			child_cat.parent_category_id	=	top_cat.category_id
WHERE		child_cat.del_flg				=	0
AND			child_cat.level				=	2
UNION ALL	
SELECT		'SPECIAL'
,			99999999
,			'特集'
,			special_category_id
,			special_category_name
,			NULL
,			r_special_category_name
,			NULL
,			y_special_category_name
,			NULL
,			NULL
FROM		dtb_special_category
WHERE		del_flg		=	0
ORDER BY		"カテゴリ区分"
,			"親カテゴリ表示順" 	DESC
,			"子カテゴリ表示順"	DESC;