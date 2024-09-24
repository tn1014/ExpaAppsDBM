-- 出荷実績明細テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_SHP_RESULT_DETAILS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	shp_results_history
	WHERE	shipment_result_id	=	NEW.shipment_result_id;
	

	INSERT INTO shp_result_details_history
	(
			shipment_result_id
		,	shipment_result_detail_id
		,	history_count
		,	shipment_schedule_detail_id
		,	stock_transaction_id
		,	item_code
		,	product_code
		,	inventory_seq
		,	configuration_parts_div
		,	lot_quantity
		,	shipment_unit_quantity
		,	shipment_quantity
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
			NEW.shipment_result_id
		,	NEW.id
		,	historyCount
		,	NEW.shipment_schedule_detail_id
		,	NEW.stock_transaction_id
		,	NEW.item_code
		,	NEW.product_code
		,	NEW.inventory_seq
		,	NEW.configuration_parts_div
		,	NEW.lot_quantity
		,	NEW.shipment_unit_quantity
		,	NEW.shipment_quantity
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

ALTER FUNCTION INSERT_SHP_RESULT_DETAILS_HISTORY OWNER TO expa_apps;