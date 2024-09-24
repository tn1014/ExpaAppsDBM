SELECT		dtb_order.order_id					AS	"管理ID"
,			dtb_order.order_no					AS	"受注No"
,			dtb_order.status						AS	"受注ステータス"
,			dtb_order.shop_id					AS	"店舗ID"
,			dtb_order.create_date					AS	"購入日時"
,			dtb_order.shipment_confirm_date			AS	"出荷承認日時"
,			dtb_order.commit_date				AS	"出荷日時"
,			dtb_order.payment_date				AS	"入金日時"
,			dtb_order.cancel_date					AS	"キャンセル日"
,			dtb_order.kira_print_flg				AS	"キラックス売上CSV出力済フラグ"
,			dtb_order.customer_id					AS	"本店会員ID"
,			dtb_order.message					AS	"購入者備考"
,			dtb_order.customer_memo_flg			AS	"購入者備考有無フラグ"
,			dtb_order.receipt_name				AS	"領収書宛名"
,			dtb_order.receipt_item					AS	"領収書但書"
,			dtb_order.reply_message				AS	"返信メッセージ"
,			dtb_order.note						AS	"店舗備考"
,			dtb_order.order_company				AS	"購入者名"
,			dtb_order.order_name01				AS	"購入担当者名"
,			dtb_order.order_email					AS	"購入者メールアドレス"
,			dtb_order.fax_send_mail_flg				AS	"受注FAX送信フラグ"
,			dtb_order.order_tel01					AS	"購入者TEL1"
,			dtb_order.order_tel02					AS	"購入者TEL2"
,			dtb_order.order_tel03					AS	"購入者TEL3"
,			dtb_order.order_zip01					AS	"購入者郵便番号1"
,			dtb_order.order_zip02					AS	"購入者郵便番号2"
,			dtb_order.order_pref					AS	"購入者都道府県コード"
,			dtb_order.order_addr01				AS	"購入者住所1"
,			dtb_order.order_addr02				AS	"購入者住所2"
,			dtb_order.maker_deliv_destination_code	AS	"キラックス納品先コード"
,			dtb_shipping.rank					AS	"バスケットID"
,			dtb_shipping.shipping_company			AS	"送付者名"
,			dtb_shipping.shipping_name01			AS	"送付先担当者名"
,			dtb_shipping.shipping_tel01				AS	"送付先TEL1"
,			dtb_shipping.shipping_tel02				AS	"送付先TEL2"
,			dtb_shipping.shipping_tel03				AS	"送付先TEL3"
,			dtb_shipping.shipping_zip01				AS	"送付先郵便番号1"
,			dtb_shipping.shipping_zip02				AS	"送付先郵便番号2"
,			dtb_shipping.shipping_pref				AS	"送付先都道府県コード"
,			dtb_shipping.shipping_addr01			AS	"送付先住所1"
,			dtb_shipping.shipping_addr02			AS	"送付先住所2"
,			dtb_order.payment_id					AS	"支払方法"
,			dtb_order.payment_method				AS	"支払方法ID"
,			dtb_order.subtotal					AS	"商品小計"
,			dtb_order.deliv_fee					AS	"送料"
,			dtb_order.charge						AS	"手数料"
,			dtb_order.discount					AS	"値引き"
,			dtb_order.use_point					AS	"本店使用ポイント"
,			dtb_order.other_use_point				AS	"他店舗使用ポイント"
,			dtb_order.tax						AS	"消費税(外税)"
,			dtb_order.total						AS	"合計金額"
,			dtb_order.payment_total				AS	"請求金額"
,			dtb_order.payment_total_ini				AS	"請求金額(購入時)"
,			dtb_order_detail.detail_no				AS	"明細No"
,			dtb_products_class.product_code			AS	"商品コード"
,			dtb_order_detail.product_name			AS	"商品名"
,			dtb_order_detail.price					AS	"単価"
,			dtb_order_detail.quantity				AS	"購入数"
,			dtb_products_class.quantity_send			AS	"入数"
,			dtb_order_detail.maker_deliv_flg			AS	"直送フラグ"
,			dtb_order_detail.order_detail_cost			AS	"仕入金額"
,			dtb_order_detail.pay_billing_year_month	AS	"仕入請求年月"
FROM		dtb_order
INNER JOIN	dtb_shipping
ON			dtb_order.order_id			=	dtb_shipping.order_id
AND			dtb_shipping.shipping_id		=	0
INNER JOIN	dtb_order_detail
ON			dtb_order.order_id			=	dtb_order_detail.order_id
INNER JOIN	dtb_products
ON			dtb_order_detail.product_id		=	dtb_products.product_id
INNER JOIN	dtb_products_class
ON			dtb_products.product_id		=	dtb_products_class.product_id
WHERE		dtb_order.del_flg				=	0
AND			dtb_order.status				IN	(5, 14, 13)
AND			dtb_order.create_date			>=	'2019-04-01'
ORDER BY		b_order.order_id	
,			dtb_order_detail.detail_no