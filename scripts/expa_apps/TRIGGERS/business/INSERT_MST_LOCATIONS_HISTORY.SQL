-- 拠点マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_MST_LOCATIONS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO	historyCount
	FROM	mst_locations_history
	WHERE	location_code	=	NEW.location_code;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO mst_locations_history
	(
			location_code
		,	history_count
		,	location_name
		,	short_name
		,	short_name_kana
		,	location_type
		,	zip_code01
		,	zip_code02
		,	pref_code
		,	addr01
		,	addr02
		,	tel01
		,	tel02
		,	tel03
		,	fax01
		,	fax02
		,	fax03
		,	email
		,	carry_closing_time
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
			NEW.location_code
		,	historyCount
		,	NEW.location_name
		,	NEW.short_name
		,	NEW.short_name_kana
		,	NEW.location_type
		,	NEW.zip_code01
		,	NEW.zip_code02
		,	NEW.pref_code
		,	NEW.addr01
		,	NEW.addr02
		,	NEW.tel01
		,	NEW.tel02
		,	NEW.tel03
		,	NEW.fax01
		,	NEW.fax02
		,	NEW.fax03
		,	NEW.email
		,	NEW.carry_closing_time
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

ALTER FUNCTION INSERT_MST_LOCATIONS_HISTORY OWNER TO expa_apps;