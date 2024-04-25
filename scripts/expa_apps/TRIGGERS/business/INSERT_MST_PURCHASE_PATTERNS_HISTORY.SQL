-- 発注パターンマスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_MST_PURCHASE_PATTERNS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	mst_purchase_patterns_history
	WHERE	purchase_pattern_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO mst_purchase_patterns_history
	(
			purchase_pattern_id
		,	history_count
		,	purchase_pattern_name
		,	purchase_method_div
		,	last_arrival_location_code
		,	rank
		,	is_enabled
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
		,	NEW.purchase_pattern_name
		,	NEW.purchase_method_div
		,	NEW.last_arrival_location_code
		,	NEW.rank
		,	NEW.is_enabled
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

ALTER FUNCTION INSERT_MST_PURCHASE_PATTERNS_HISTORY OWNER TO expa_apps;