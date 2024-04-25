-- 仕入先マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_MST_SUPPLIERS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO	historyCount
	FROM	mst_suppliers_history
	WHERE	supplier_code	=	NEW.supplier_code;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO mst_suppliers_history
	(
			supplier_code
		,	history_count
		,	kiracs_supplier_code
		,	contract_type
		,	supplier_name
		,	kiracs_supplier_name
		,	short_name
		,	short_name_kana
		,	office_zip_code01
		,	office_zip_code02
		,	office_pref_code
		,	office_addr01
		,	office_addr02
		,	office_addr03
		,	office_tel01
		,	office_tel02
		,	office_tel03
		,	office_fax01
		,	office_fax02
		,	office_fax03
		,	office_email
		,	site_url
		,	order_closing_time
		,	order_type
		,	order_conditions
		,	shipment_location
		,	products
		,	open_time
		,	close_time
		,	regular_holidays
		,	charge_person
		,	charge_person_kana
		,	charge_position
		,	charge_dept
		,	charge_tel01
		,	charge_tel02
		,	charge_tel03
		,	charge_email
		,	rank
		,	is_enabled
		,	created_user_code
		,	created_function_code
		,	created_terminal
		,	created_at
		,	updated_user_code
		,	updated_function_code
		,	updated_terminal
		,	updated_at
		,	is_deleted
		,	deleted_user_code
		,	deleted_function_code
		,	deleted_terminal
		,	deleted_at
		,	deleted_description
	) VALUES (
			NEW.supplier_code
		,	historyCount
		,	NEW.kiracs_supplier_code
		,	NEW.contract_type
		,	NEW.supplier_name
		,	NEW.kiracs_supplier_name
		,	NEW.short_name
		,	NEW.short_name_kana
		,	NEW.office_zip_code01
		,	NEW.office_zip_code02
		,	NEW.office_pref_code
		,	NEW.office_addr01
		,	NEW.office_addr02
		,	NEW.office_addr03
		,	NEW.office_tel01
		,	NEW.office_tel02
		,	NEW.office_tel03
		,	NEW.office_fax01
		,	NEW.office_fax02
		,	NEW.office_fax03
		,	NEW.office_email
		,	NEW.site_url
		,	NEW.order_closing_time
		,	NEW.order_type
		,	NEW.order_conditions
		,	NEW.shipment_location
		,	NEW.products
		,	NEW.open_time
		,	NEW.close_time
		,	NEW.regular_holidays
		,	NEW.charge_person
		,	NEW.charge_person_kana
		,	NEW.charge_position
		,	NEW.charge_dept
		,	NEW.charge_tel01
		,	NEW.charge_tel02
		,	NEW.charge_tel03
		,	NEW.charge_email
		,	NEW.rank
		,	NEW.is_enabled
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

ALTER FUNCTION INSERT_MST_SUPPLIERS_HISTORY OWNER TO expa_apps;