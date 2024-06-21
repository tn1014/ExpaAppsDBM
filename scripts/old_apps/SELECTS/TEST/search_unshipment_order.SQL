SELECT		dtb_order.order_id												AS	"受注ID"
,			dtb_order.status													AS	"受注ステータス"
,			TO_CHAR(dtb_order.shipment_confirm_date, 'YYYY-MM-DD HH24:MI:SS')			AS	"出荷確定日時"
,			dtb_shipping.deliv_schedule_date										AS	"指定出荷日"
,			dtb_order_detail.product_id											AS	"商品ID"
,			dtb_order_detail.product_name										AS	"商品名"
,			dtb_products_class.quantity_send										AS	"販売入数"
,			dtb_order_detail.quantity											AS	"受注数"
FROM		dtb_order
INNER JOIN	dtb_order_detail
ON			dtb_order.order_id			=	dtb_order_detail.order_id
INNER JOIN	dtb_products
ON			dtb_order_detail.product_id		=	dtb_products.product_id
INNER JOIN	dtb_products_class
ON			dtb_products.product_id		=	dtb_products_class.product_id
INNER JOIN	dtb_shipping
ON			dtb_order.order_id			=	dtb_shipping.order_id
AND			dtb_shipping.shipping_id 		= 0
WHERE		dtb_order.del_flg				=	0
AND			dtb_order.status				IN	(
											SELECT		order_status_id
											FROM		grp_order_status
											WHERE		delete_flg = 0
											AND			group_category = 'ORDER_STATUS_GROUP_WAITING_FOR_SHIPPING'
										)
ORDER BY		dtb_order.order_id
,			dtb_order_detail.order_detail_id;

--取得後
--EXCELにて「出荷確定日時」の書式設定を[yyyy/mm/dd hh:mm:ss.000]に変更する