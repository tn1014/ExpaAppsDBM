-- 発注明細テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PUR_ORDER_DETAILS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	pur_orders_history
	WHERE	slip_no	=	NEW.slip_no;
	

	INSERT INTO pur_order_details_history
	(
			slip_no
		,	detail_no
		,	history_count
		,	product_code
		,	inventory_seq
		,	purchase_quantity
		,	purchase_unit_code
		,	purchase_unit_quantity
		,	purchase_unit_price
		,	detail_description
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
		,	NEW.detail_no
		,	historyCount
		,	NEW.product_code
		,	NEW.inventory_seq
		,	NEW.purchase_quantity
		,	NEW.purchase_unit_code
		,	NEW.purchase_unit_quantity
		,	NEW.purchase_unit_price
		,	NEW.detail_description
		,	NEW.created_user_code
		,	NEW.created_function_code
		,	NEW.created_terminal
		,	NEW.created_at
		,	NEW.updated_user_code
		,	NEW.updated_function_code
		,	NEW.updated_terminal
		,	NEW.updated_at
	);

	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION INSERT_PUR_ORDER_DETAILS_HISTORY OWNER TO expa_apps;