-- 発注パターン移動規則マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_MST_PURCHASE_PATTERN_CARRY_RULES_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	mst_purchase_patterns_history
	WHERE	purchase_pattern_id	=	NEW.purchase_pattern_id;

	INSERT INTO mst_purchase_pattern_carry_rules_history
	(
			purchase_pattern_carry_rule_id
		,	history_count
		,	purchase_pattern_id
		,	start_on
		,	stock_location_code
		,	carry_location_code01
		,	carry_location_code02
		,	carry_location_code03
		,	carry_location_code04
		,	carry_location_code05
		,	deliv_weekdays
		,	carry_lead_time
		,	carry_description01
		,	carry_description02
		,	created_user_code
		,	created_function_code
		,	created_terminal
		,	created_at
		,	updated_user_code
		,	updated_function_code
		,	updated_terminal
		,	updated_at
		,	is_deleted
		,	deleted_user_code
		,	deleted_function_code
		,	deleted_terminal
		,	deleted_at
		,	deleted_description
	) VALUES (
			NEW.id
		,	historyCount
		,	NEW.purchase_pattern_id
		,	NEW.start_on
		,	NEW.stock_location_code
		,	NEW.carry_location_code01
		,	NEW.carry_location_code02
		,	NEW.carry_location_code03
		,	NEW.carry_location_code04
		,	NEW.carry_location_code05
		,	NEW.deliv_weekdays
		,	NEW.carry_lead_time
		,	NEW.carry_description01
		,	NEW.carry_description02
		,	NEW.created_user_code
		,	NEW.created_function_code
		,	NEW.created_terminal
		,	NEW.created_at
		,	NEW.updated_user_code
		,	NEW.updated_function_code
		,	NEW.updated_terminal
		,	NEW.updated_at
		,	NEW.is_deleted
		,	NEW.deleted_user_code
		,	NEW.deleted_function_code
		,	NEW.deleted_terminal
		,	NEW.deleted_at
		,	NEW.deleted_description
	);

	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION INSERT_MST_PURCHASE_PATTERN_CARRY_RULES_HISTORY OWNER TO expa_apps;