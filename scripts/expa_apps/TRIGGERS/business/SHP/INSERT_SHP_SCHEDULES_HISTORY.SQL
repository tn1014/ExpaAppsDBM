-- 出荷予定テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_SHP_SCHEDULES_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	shp_schedules_history
	WHERE	shipment_schedule_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;
	

	INSERT INTO shp_schedules_history
	(
			shipment_schedule_id
		,	history_count
		,	order_id
		,	package_id
		,	shipment_location_code
		,	shipment_location_name
		,	shipment_instructed_on
		,	delivery_instructed_on
		,	delivery_time_id
		,	delivery_time
		,	shipment_recerenced_on
		,	approved_at
		,	completed_at
		,	is_isolated_island
		,	is_partical_shipment
		,	packages_count
		,	deliv_company_code
		,	deliv_company_name
		,	is_required_delivery_slip
		,	is_required_invoice_slip
		,	picking_description
		,	packing_description
		,	sender_name
		,	sender_charge_name
		,	sender_tel01
		,	sender_tel02
		,	sender_tel03
		,	sender_zip01
		,	sender_zip02
		,	sender_pref_code
		,	sender_pref
		,	sender_addr01
		,	sender_addr02
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
			NEW.id
		,	historyCount
		,	NEW.order_id
		,	NEW.package_id
		,	NEW.shipment_location_code
		,	NEW.shipment_location_name
		,	NEW.shipment_instructed_on
		,	NEW.delivery_instructed_on
		,	NEW.delivery_time_id
		,	NEW.delivery_time
		,	NEW.shipment_recerenced_on
		,	NEW.approved_at
		,	NEW.completed_at
		,	NEW.is_isolated_island
		,	NEW.is_partical_shipment
		,	NEW.packages_count
		,	NEW.deliv_company_code
		,	NEW.deliv_company_name
		,	NEW.is_required_delivery_slip
		,	NEW.is_required_invoice_slip
		,	NEW.picking_description
		,	NEW.packing_description
		,	NEW.sender_name
		,	NEW.sender_charge_name
		,	NEW.sender_tel01
		,	NEW.sender_tel02
		,	NEW.sender_tel03
		,	NEW.sender_zip01
		,	NEW.sender_zip02
		,	NEW.sender_pref_code
		,	NEW.sender_pref
		,	NEW.sender_addr01
		,	NEW.sender_addr02
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

ALTER FUNCTION INSERT_SHP_SCHEDULES_HISTORY OWNER TO expa_apps;