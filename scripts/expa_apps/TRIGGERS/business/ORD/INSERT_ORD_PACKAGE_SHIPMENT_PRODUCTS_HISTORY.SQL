-- 送付先出荷製品テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_PACKAGE_SHIPMENT_PRODUCTS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_package_shipments_history
	WHERE	package_shipment_id	=	NEW.package_shipment_id;
	

	INSERT INTO ord_package_shipment_products_history
	(
			package_shipment_product_id
		,	history_count
		,	package_shipment_id
		,	package_item_id
		,	package_item_configuration_id
		,	order_detail_no
		,	package_detail_no
		,	product_code
		,	inventory_seq
		,	shipment_unit_quantity
		,	shipment_lot_quantity
		,	shipment_quantity
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	created_at
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		,	updated_at
	) VALUES (
			NEW.id
		,	historyCount
		,	NEW.package_shipment_id
		,	NEW.package_item_id
		,	NEW.package_item_configuration_id
		,	NEW.order_detail_no
		,	NEW.package_detail_no
		,	NEW.product_code
		,	NEW.inventory_seq
		,	NEW.shipment_unit_quantity
		,	NEW.shipment_lot_quantity
		,	NEW.shipment_quantity
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

ALTER FUNCTION INSERT_ORD_PACKAGE_SHIPMENT_PRODUCTS_HISTORY OWNER TO expa_apps;