-- 受注伝票注文者テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_SLIP_ORDERERS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slips_history
	WHERE	order_id	=	NEW.order_id;
	

	INSERT INTO ord_slip_orderers_history
	(
			order_id
		,	slip_orderer_id
		,	history_count
		,	order_name
		,	order_charge_name
		,	order_email
		,	order_tel01
		,	order_tel02
		,	order_tel03
		,	order_zip01
		,	order_zip02
		,	order_pref_code
		,	order_pref
		,	order_addr01
		,	order_addr02
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
		,	NEW.id
		,	historyCount
		,	NEW.order_name
		,	NEW.order_charge_name
		,	NEW.order_email
		,	NEW.order_tel01
		,	NEW.order_tel02
		,	NEW.order_tel03
		,	NEW.order_zip01
		,	NEW.order_zip02
		,	NEW.order_pref_code
		,	NEW.order_pref
		,	NEW.order_addr01
		,	NEW.order_addr02
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

ALTER FUNCTION INSERT_ORD_SLIP_ORDERERS_HISTORY OWNER TO expa_apps;