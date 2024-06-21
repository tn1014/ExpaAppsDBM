-- 入荷予定テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PUR_ARRIVAL_SCHEDULES_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	pur_arrival_schedules_history
	WHERE	arrival_schedule_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO pur_arrival_schedules_history
	(
			arrival_schedule_id
		,	purchase_slip_no
		,	detail_no
		,	history_count
		,	stock_transaction_temporary_id
		,	purchase_pattern_id
		,	purchase_method_div
		,	supplier_code
		,	location_code
		,	product_code
		,	inventory_seq
		,	arrival_scheduled_on
		,	arrival_scheduled_quantity
		,	arrival_unit_code
		,	arrival_unit_quantity
		,	arrival_unit_price
		,	arrived_quantity
		,	is_arrived
		,	is_canceled
		,	cancel_reason
		,	arrival_description
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
		,	NEW.purchase_slip_no
		,	NEW.detail_no
		,	historyCount
		,	NEW.stock_transaction_temporary_id
		,	NEW.purchase_pattern_id
		,	NEW.purchase_method_div
		,	NEW.supplier_code
		,	NEW.location_code
		,	NEW.product_code
		,	NEW.inventory_seq
		,	NEW.arrival_scheduled_on
		,	NEW.arrival_scheduled_quantity
		,	NEW.arrival_unit_code
		,	NEW.arrival_unit_quantity
		,	NEW.arrival_unit_price
		,	NEW.arrived_quantity
		,	NEW.is_arrived
		,	NEW.is_canceled
		,	NEW.cancel_reason
		,	NEW.arrival_description
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

ALTER FUNCTION INSERT_PUR_ARRIVAL_SCHEDULES_HISTORY OWNER TO expa_apps;