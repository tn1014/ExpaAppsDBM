-- 製品単位リレーション更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PRD_PRODUCT_UNIT_RELATIONS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO	historyCount
	FROM	prd_products_history
	WHERE	product_code	=	NEW.product_code;
	

	INSERT INTO prd_product_unit_relations_history
	(
			product_code
		,	history_count
		,	unit_seq
		,	unit_code
		,	unit_quantity
		,	is_master_used
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
		,	NEW.unit_seq
		,	NEW.unit_code
		,	NEW.unit_quantity
		,	NEW.is_master_used
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

ALTER FUNCTION INSERT_PRD_PRODUCT_UNIT_RELATIONS_HISTORY OWNER TO expa_apps;