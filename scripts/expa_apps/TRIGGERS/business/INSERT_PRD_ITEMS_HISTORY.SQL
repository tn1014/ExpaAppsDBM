-- 商品マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PRD_ITEMS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO	historyCount
	FROM	prd_items_history
	WHERE	item_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO prd_items_history
	(
			item_id
		,	history_count
		,	item_code
		,	item_name
		,	item_type
		,	is_sales_ended
		,	is_allowed_stock_unlimited
		,	order_limit_count
		,	set_div
		,	catch_copy
		,	shipment_size_div
		,	shipment_div
		,	shipment_packing_quantity
		,	note
		,	rank
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
			NEW.id
		,	historyCount
		,	NEW.item_code
		,	NEW.item_name
		,	NEW.item_type
		,	NEW.is_sales_ended
		,	NEW.is_allowed_stock_unlimited
		,	NEW.order_limit_count
		,	NEW.set_div
		,	NEW.catch_copy
		,	NEW.shipment_size_div
		,	NEW.shipment_div
		,	NEW.shipment_packing_quantity
		,	NEW.note
		,	NEW.rank
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

ALTER FUNCTION INSERT_PRD_ITEMS_HISTORY OWNER TO expa_apps;