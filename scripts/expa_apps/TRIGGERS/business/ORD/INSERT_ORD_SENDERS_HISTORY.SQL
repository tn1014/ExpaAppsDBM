-- 受注送付者テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_SENDERS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slips_history
	WHERE	order_id	=	NEW.order_id;
	

	INSERT INTO ord_senders_history
	(
			order_id
		,	sender_id
		,	history_count
		,	package_id
		,	sender_name
		,	sender_charge_name
		,	sender_tel01
		,	sender_tel02
		,	sender_tel03
		,	sender_zip01L
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
			NEW.order_id
		,	NEW.id
		,	historyCount
		,	NEW.package_id
		,	NEW.sender_name
		,	NEW.sender_charge_name
		,	NEW.sender_tel01
		,	NEW.sender_tel02
		,	NEW.sender_tel03
		,	NEW.sender_zip01L
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

ALTER FUNCTION INSERT_ORD_SENDERS_HISTORY OWNER TO expa_apps;