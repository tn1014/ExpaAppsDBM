--現在の倉庫在庫数を取得
SELECT		dtb_products_stock.stock_product_id									AS	"在庫商品ID"
,			dtb_products.name												AS	"商品名"
,			dtb_products_stock.stock + COALESCE(unshipped_order.order_quantity, 0)		AS	"現在倉庫在庫数"
,			COALESCE(unshipped_order.order_quantity, 0)							AS	"内受注数"
FROM		dtb_products_stock
INNER JOIN	dtb_products
ON			dtb_products_stock.stock_product_id		=	dtb_products.product_id
AND			dtb_products.del_flg					=	0
LEFT JOIN		(
				SELECT		dtb_products_class.stock_product_id
				,			SUM(dtb_products_class.quantity_send * dtb_order_detail.quantity)		AS	order_quantity
				FROM		dtb_order
				INNER JOIN	dtb_order_detail
				ON			dtb_order.order_id				=	dtb_order_detail.order_id
				AND			dtb_order_detail.maker_deliv_flg		=	0
				INNER JOIN	dtb_products
				ON			dtb_order_detail.product_id			=	dtb_products.product_id
				AND			dtb_products.del_flg				=	0
				INNER JOIN	dtb_products_class
				ON			dtb_products.product_id			=	dtb_products_class.product_id
				WHERE		dtb_order.del_flg					=	0
				AND			dtb_order.status					IN	(
																SELECT		order_status_id
																FROM		grp_order_status
																WHERE		delete_flg		=	0
																AND			group_category	=	'ORDER_STATUS_GROUP_WAITING_FOR_SHIPPING'
															)
				GROUP BY	dtb_products_class.stock_product_id
			)	unshipped_order
ON			dtb_products_stock.stock_product_id								=	unshipped_order.stock_product_id
WHERE		dtb_products_stock.stock + COALESCE(unshipped_order.order_quantity, 0)	!=	0