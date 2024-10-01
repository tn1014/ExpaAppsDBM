-- 直送発注テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PUR_DIRECT_ORDERS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	pur_direct_orders_history
	WHERE	slip_no	=	NEW.slip_no;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO pur_direct_orders_history
	(
			slip_no
		,	history_count
		,	direct_schedule_id
		,	purchase_on
		,	delivery_instructed_on
		,	delivery_time_id
		,	delivery_time
		,	purchase_employee_code
		,	supplier_code
		,	delivery_destination_code
		,	slip_description
		,	internal_description
		,	supplier_slip_no01
		,	supplier_slip_no02
		,	is_canceled
		,	cancel_reason
		,	slip_closing_on
		,	is_correction_slip
		,	correct_slip_no
		,	is_required_print_purchase_form
		,	is_required_print_request_form
		,	purchase_slip_printed_count
		,	request_slip_printed_count
		,	created_user_code
		,	created_terminal
		,	created_function_code
		,	created_at
		,	updated_user_code
		,	updated_terminal
		,	updated_function_code
		,	updated_at
	) VALUES (
			NEW.slip_no
		,	historyCount
		,	NEW.direct_schedule_id
		,	NEW.purchase_on
		,	NEW.delivery_instructed_on
		,	NEW.delivery_time_id
		,	NEW.delivery_time
		,	NEW.purchase_employee_code
		,	NEW.supplier_code
		,	NEW.delivery_destination_code
		,	NEW.slip_description
		,	NEW.internal_description
		,	NEW.supplier_slip_no01
		,	NEW.supplier_slip_no02
		,	NEW.is_canceled
		,	NEW.cancel_reason
		,	NEW.slip_closing_on
		,	NEW.is_correction_slip
		,	NEW.correct_slip_no
		,	NEW.is_required_print_purchase_form
		,	NEW.is_required_print_request_form
		,	NEW.purchase_slip_printed_count
		,	NEW.request_slip_printed_count
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

ALTER FUNCTION INSERT_PUR_DIRECT_ORDERS_HISTORY OWNER TO expa_apps;