-- 製品仕入単価マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PRD_PRODUCT_PURCHASE_PRICES_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	prd_products_history
	WHERE	product_code	=	NEW.product_code;
	

	INSERT INTO prd_product_purchase_prices_history
	(
			product_code
		,	history_count
		,	start_on
		,	lot_seq
		,	lot_quantity
		,	kiracs_purchase_unit_price
		,	expa_purchase_unit_price
		,	recommend_unit_price
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
			NEW.product_code
		,	historyCount
		,	NEW.start_on
		,	NEW.lot_seq
		,	NEW.lot_quantity
		,	NEW.kiracs_purchase_unit_price
		,	NEW.expa_purchase_unit_price
		,	NEW.recommend_unit_price
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

ALTER FUNCTION INSERT_PRD_PRODUCT_PURCHASE_PRICES_HISTORY OWNER TO expa_apps;