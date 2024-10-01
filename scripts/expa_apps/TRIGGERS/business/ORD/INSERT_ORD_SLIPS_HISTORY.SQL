-- 受注伝票テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_SLIPS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slips_history
	WHERE	order_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO ord_slips_history
	(
			order_id
		,	history_count
		,	slip_no
		,	store_code
		,	store_order_no
		,	is_corrected
		,	correction_slip_no
		,	import_div
		,	shipment_instructed_on
		,	delivery_instructed_on
		,	remarks
		,	is_forced_cancel_invalid
		,	is_several_sender
		,	is_isolated_island
		,	is_sent_fax_invoice
		,	fax_email
		,	store_member_no
		,	payment_method_code
		,	payment_method
		,	order_item_price
		,	order_item_excluded_tax
		,	order_postage_price
		,	order_delivery_charge
		,	order_payment_charge
		,	order_payment_charge_tax_rate
		,	order_total_price
		,	coupon_price
		,	discount_price
		,	use_point
		,	payment_price
		,	payment_price_ini
		,	order_description
		,	receipt_name
		,	receipt_item
		,	reply_message
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	created_at
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		,	updated_at
		,	is_deleted
		,	deleted_user_code
		,	deleted_terminal
		,	deleted_function_code
		,	deleted_at
		,	deleted_description
	) VALUES (
			NEW.order_id
		,	historyCount
		,	NEW.slip_no
		,	NEW.store_code
		,	NEW.store_order_no
		,	NEW.is_corrected
		,	NEW.correction_slip_no
		,	NEW.import_div
		,	NEW.shipment_instructed_on
		,	NEW.delivery_instructed_on
		,	NEW.remarks
		,	NEW.is_forced_cancel_invalid
		,	NEW.is_several_sender
		,	NEW.is_isolated_island
		,	NEW.is_sent_fax_invoice
		,	NEW.fax_email
		,	NEW.store_member_no
		,	NEW.payment_method_code
		,	NEW.payment_method
		,	NEW.order_item_price
		,	NEW.order_item_excluded_tax
		,	NEW.order_postage_price
		,	NEW.order_delivery_charge
		,	NEW.order_payment_charge
		,	NEW.order_payment_charge_tax_rate
		,	NEW.order_total_price
		,	NEW.coupon_price
		,	NEW.discount_price
		,	NEW.use_point
		,	NEW.payment_price
		,	NEW.payment_price_ini
		,	NEW.order_description
		,	NEW.receipt_name
		,	NEW.receipt_item
		,	NEW.reply_message
		,	NEW.created_user_code
		,	NEW.created_terminal
		,	NEW.created_function_code
		,	NEW.created_at
		,	NEW.updated_user_code
		,	NEW.updated_terminal
		,	NEW.updated_function_code
		,	NEW.updated_at
		,	NEW.is_deleted
		,	NEW.deleted_user_code
		,	NEW.deleted_terminal
		,	NEW.deleted_function_code
		,	NEW.deleted_at
		,	NEW.deleted_description
	);

	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION INSERT_ORD_SLIPS_HISTORY OWNER TO expa_apps;