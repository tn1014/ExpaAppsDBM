-- 製品テキストスペックマスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PRD_PRODUCT_TEXT_SPECS_HISTORY() RETURNS TRIGGER AS $BODY$
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

	INSERT INTO prd_product_text_specs_history
	(
			product_code
		,	history_count
		,	spec_seq
		,	text_spec_code
		,	text_value
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
		,	NEW.text_spec_code
		,	NEW.text_value
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

ALTER FUNCTION INSERT_PRD_PRODUCT_TEXT_SPECS_HISTORY OWNER TO expa_apps;