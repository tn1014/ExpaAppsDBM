-- 出荷実績テーブル更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_SHP_PRODUCT_RESULTS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	shp_product_results_history
	WHERE	shipment_result_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO shp_product_results_history
	(
			shipment_result_id
		,	history_count
		,	package_shipment_product_id
		,	stock_transaction_id
		,	shipped_at
		,	shipped_unit_quantity
		,	shipped_lot_quantity
		,	shipped_quantity
		,	is_directly_shipping
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
		,	NEW.package_shipment_product_id
		,	NEW.stock_transaction_id
		,	NEW.shipped_at
		,	NEW.shipped_unit_quantity
		,	NEW.shipped_lot_quantity
		,	NEW.shipped_quantity
		,	NEW.is_directly_shipping
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

ALTER FUNCTION INSERT_SHP_PRODUCT_RESULTS_HISTORY() OWNER TO expa_apps;