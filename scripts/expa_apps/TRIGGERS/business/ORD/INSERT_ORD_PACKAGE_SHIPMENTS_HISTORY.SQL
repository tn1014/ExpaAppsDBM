-- 受注送付先出荷テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_PACKAGE_SHIPMENTS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slips_history
	WHERE	order_id	=	NEW.order_id;
	

	INSERT INTO ord_package_shipments_history
	(
			package_shipment_id
		,	order_id
		,	package_id
		,	history_count
		,	packages_count
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
		,	NEW.order_id
		,	NEW.package_id
		,	historyCount
		,	NEW.packages_count
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

ALTER FUNCTION INSERT_ORD_PACKAGE_SHIPMENTS_HISTORY OWNER TO expa_apps;