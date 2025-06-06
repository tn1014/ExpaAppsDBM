-- 受注伝票入金状況テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_SLIP_PAYMENT_STATES_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slip_payment_states_history
	WHERE	order_id	=	NEW.order_id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO ord_slip_payment_states_history
	(
			order_id
		,	history_count
		,	payment_state_code
		,	payment_state
		,	charge_employee_code
		,	charge_employee_name
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
		,	historyCount
		,	NEW.payment_state_code
		,	NEW.payment_state
		,	NEW.charge_employee_code
		,	NEW.charge_employee_name
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

ALTER FUNCTION INSERT_ORD_SLIP_PAYMENT_STATES_HISTORY OWNER TO expa_apps;