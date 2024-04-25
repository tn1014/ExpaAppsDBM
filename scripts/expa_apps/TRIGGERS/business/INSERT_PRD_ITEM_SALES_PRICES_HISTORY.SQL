-- 商品販売単価マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PRD_ITEM_SALES_PRICES_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO	historyCount
	FROM	prd_items_history
	WHERE	item_code	=	NEW.item_code;
	

	INSERT INTO prd_item_sales_prices_history
	(
			item_code
		,	history_count
		,	start_on
		,	tax_div
		,	tax_rate
		,	included_tax_div
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
			NEW.item_code
		,	historyCount
		,	NEW.start_on
		,	NEW.tax_div
		,	NEW.tax_rate
		,	NEW.included_tax_div
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

ALTER FUNCTION INSERT_PRD_ITEM_SALES_PRICES_HISTORY OWNER TO expa_apps;