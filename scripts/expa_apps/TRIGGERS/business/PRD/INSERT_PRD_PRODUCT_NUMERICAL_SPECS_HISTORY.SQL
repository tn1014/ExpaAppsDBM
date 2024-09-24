-- 製品数値スペックマスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PRD_PRODUCT_NUMERICAL_SPECS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO		historyCount
	FROM	prd_products_history
	WHERE	product_code	=	NEW.product_code;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO prd_product_numerical_specs_history
	(
			product_code
		,	history_count
		,	spec_seq
		,	numerical_spec_code
		,	numerical_value01
		,	numerical_value02
		,	numerical_value03
		,	unit01
		,	unit02
		,	unit03
		,	spec_description
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
		,	NEW.spec_seq
		,	NEW.numerical_spec_code
		,	NEW.numerical_value01
		,	NEW.numerical_value02
		,	NEW.numerical_value03
		,	NEW.unit01
		,	NEW.unit02
		,	NEW.unit03
		,	NEW.spec_description
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

ALTER FUNCTION INSERT_PRD_PRODUCT_NUMERICAL_SPECS_HISTORY OWNER TO expa_apps;