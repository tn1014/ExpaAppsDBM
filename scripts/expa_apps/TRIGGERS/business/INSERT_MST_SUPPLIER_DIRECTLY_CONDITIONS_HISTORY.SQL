-- 仕入先直送条件マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_MST_SUPPLIER_DIRECTLY_CONDITIONS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO	historyCount
	FROM	mst_suppliers_history
	WHERE	supplier_code	=	NEW.supplier_code;
	

	INSERT INTO mst_supplier_directly_conditions_history
	(
			supplier_code
		,	history_count
		,	start_on
		,	enable_type
		,	case_rules
		,	amount_rules
		,	postage_price
		,	deliv_company_code01
		,	deliv_company_code02
		,	deliv_company_code03
		,	deliv_company_code04
		,	deliv_company_code05
		,	description
		,	is_required_customer_voucher
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
			NEW.supplier_code
		,	historyCount
		,	NEW.start_on
		,	NEW.enable_type
		,	NEW.case_rules
		,	NEW.amount_rules
		,	NEW.postage_price
		,	NEW.deliv_company_code01
		,	NEW.deliv_company_code02
		,	NEW.deliv_company_code03
		,	NEW.deliv_company_code04
		,	NEW.deliv_company_code05
		,	NEW.description
		,	NEW.is_required_customer_voucher
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

ALTER FUNCTION INSERT_MST_SUPPLIER_DIRECTLY_CONDITIONS_HISTORY OWNER TO expa_apps;