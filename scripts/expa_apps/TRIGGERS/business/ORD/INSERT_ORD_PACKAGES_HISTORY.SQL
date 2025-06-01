-- 受注送付先テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_PACKAGES_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slips_history
	WHERE	order_id	=	NEW.order_id;
	

	INSERT INTO ord_packages_history
	(
			order_id
		,	package_id
		,	history_count
		,	package_seq
		,	store_basket_id
		,	delivery_method_code
		,	delivery_method
		,	is_isolated_island
		,	package_postage_price
		,	package_postage_tax_rate
		,	package_postage_tax_price
		,	package_delivery_charge
		,	package_delivery_charge_tax_rate
		,	package_delivery_charge_tax_price
		,	package_item_price
		,	package_total_price
		,	package_description
		,	is_required_print_delivery_slip
		,	delivery_message01
		,	delivery_message02
		,	delivery_message03
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	created_at
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		,	updated_at
	) VALUES (
			NEW.order_id
		,	NEW.id
		,	historyCount
		,	NEW.package_seq
		,	NEW.store_basket_id
		,	NEW.delivery_method_code
		,	NEW.delivery_method
		,	NEW.is_isolated_island
		,	NEW.package_postage_price
		,	NEW.package_postage_tax_rate
		,	NEW.package_postage_tax_price
		,	NEW.package_delivery_charge
		,	NEW.package_delivery_charge_tax_rate
		,	NEW.package_delivery_charge_tax_price
		,	NEW.package_item_price
		,	NEW.package_total_price
		,	NEW.package_description
		,	NEW.is_required_print_delivery_slip
		,	NEW.delivery_message01
		,	NEW.delivery_message02
		,	NEW.delivery_message03
		,	NEW.created_user_code
		,	NEW.created_terminal
		,	NEW.created_function_code
		,	NEW.created_at
		,	NEW.updated_user_code
		,	NEW.updated_terminal
		,	NEW.updated_function_code
		,	NEW.updated_at
	);

	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION INSERT_ORD_PACKAGES_HISTORY OWNER TO expa_apps;