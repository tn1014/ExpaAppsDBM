-- 受注送付先商品明細テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_ORD_PACKAGE_ITEMS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	ord_slips_history
	WHERE	order_id	=	NEW.order_id;
	

	INSERT INTO ord_package_items_history
	(
			order_id
		,	package_item_id
		,	history_count
		,	package_id
		,	store_item_detail_id
		,	detail_no
		,	item_code
		,	item_name
		,	price
		,	included_tax_div
		,	tax_rate
		,	tax_price
		,	quantity
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
		,	NEW.package_id
		,	NEW.store_item_detail_id
		,	NEW.detail_no
		,	NEW.item_code
		,	NEW.item_name
		,	NEW.price
		,	NEW.included_tax_div
		,	NEW.tax_rate
		,	NEW.tax_price
		,	NEW.quantity
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

ALTER FUNCTION INSERT_ORD_PACKAGE_ITEMS_HISTORY OWNER TO expa_apps;