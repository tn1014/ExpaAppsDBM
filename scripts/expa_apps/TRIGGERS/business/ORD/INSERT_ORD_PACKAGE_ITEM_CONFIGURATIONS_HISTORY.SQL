-- 受注送付先商品構成テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_PACKAGE_ITEM_CONFIGURATIONS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slips_history
	WHERE	order_id	=	NEW.order_id;
	

	INSERT INTO ord_package_item_configurations_history
	(
			order_id
		,	package_item_configuration_id
		,	history_count
		,	package_id
		,	package_item_id
		,	item_code
		,	product_code
		,	inventory_seq
		,	configuration_parts_div
		,	lot_quantity
		,	rank
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
		,	NEW.id
		,	historyCount
		,	NEW.package_id
		,	NEW.package_item_id
		,	NEW.item_code
		,	NEW.product_code
		,	NEW.inventory_seq
		,	NEW.configuration_parts_div
		,	NEW.lot_quantity
		,	NEW.rank
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

ALTER FUNCTION INSERT_ORD_PACKAGE_ITEM_CONFIGURATIONS_HISTORY OWNER TO expa_apps;