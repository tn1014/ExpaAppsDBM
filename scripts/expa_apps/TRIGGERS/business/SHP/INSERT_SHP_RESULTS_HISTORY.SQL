-- 出荷実績テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_SHP_RESULTS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	shp_results_history
	WHERE	shipment_result_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;
	

	INSERT INTO shp_result_history
	(
			shipment_result_id
		,	history_count
		,	shipment_schedule_id
		,	shipment_location_code
		,	shipment_location_name
		,	shipment_at
		,	is_isolated_island
		,	is_partical_shipment
		,	packages_count
		,	delivery_method_code
		,	delivery_method
		,	delivery_slip_printed_count
		,	invoice_slip_printed_count
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
		,	NEW.shipment_schedule_id
		,	NEW.shipment_location_code
		,	NEW.shipment_location_name
		,	NEW.shipment_at
		,	NEW.is_isolated_island
		,	NEW.is_partical_shipment
		,	NEW.packages_count
		,	NEW.delivery_method_code
		,	NEW.delivery_method
		,	NEW.delivery_slip_printed_count
		,	NEW.invoice_slip_printed_count
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

ALTER FUNCTION INSERT_SHP_RESULTS_HISTORY OWNER TO expa_apps;