-- 直送出荷予定明細テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_SHP_DIRECT_SCHEDULE_DETAILS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	shp_direct_schedules_history
	WHERE	direct_schedule_id	=	NEW.direct_schedule_id;
	

	INSERT INTO shp_direct_schedule_details_history
	(
			direct_schedule_id
		,	direct_schedule_detail_id
		,	history_count
		,	package_item_configuration_id
		,	item_code
		,	product_code
		,	inventory_seq
		,	configuration_parts_div
		,	lot_quantity
		,	shipment_scheduled_unit_quantity
		,	shipment_scheduled_quantity
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	created_at
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		,	updated_at
	) VALUES (
			NEW.direct_schedule_id
		,	NEW.id
		,	historyCount
		,	NEW.package_item_configuration_id
		,	NEW.item_code
		,	NEW.product_code
		,	NEW.inventory_seq
		,	NEW.configuration_parts_div
		,	NEW.lot_quantity
		,	NEW.shipment_scheduled_unit_quantity
		,	NEW.shipment_scheduled_quantity
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

ALTER FUNCTION INSERT_SHP_DIRECT_SCHEDULE_DETAILS_HISTORY OWNER TO expa_apps;