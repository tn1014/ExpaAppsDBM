-- 製品マスタ更新履歴登録
CREATE OR REPLACE FUNCTION INSERT_PRD_PRODUCTS_HISTORY() RETURNS TRIGGER AS $BODY$
DECLARE
	historyCount INTEGER;
BEGIN
	--更新回数を取得
	SELECT	MAX(history_count)
	INTO	historyCount
	FROM	prd_products_history
	WHERE	product_id	=	NEW.id;
	
	IF historyCount IS NULL OR historyCount = 0 THEN
		historyCount := 1;
	ELSE
		historyCount := historyCount + 1;
	END IF;

	INSERT INTO prd_products_history
	(
			product_id
		,	history_count
		,	product_code
		,	product_name
		,	product_type
		,	is_allowed_stock_unlimited
		,	sales_ended_div
		,	sales_ended_reason
		,	sales_ended_at
		,	supplier_code
		,	supplier_item_code
		,	shelf_code01
		,	shelf_code02
		,	shelf_code03
		,	shelf_code04
		,	shelf_code05
		,	case_size
		,	catalog_info
		,	catalog_serial_num
		,	purchase_point_quantity
		,	carry_location_code
		,	kiracs_item_code
		,	kiracs_item_name01
		,	kiracs_item_name02
		,	kiracs_item_name_kana
		,	master_size
		,	division_l_code
		,	division_m_code
		,	division_s_code
		,	recycle_code
		,	jan_code
		,	itf_code
		,	purchase_unit_code
		,	order_unit_code
		,	kiracs_pricing_unit_code
		,	expa_pricing_unit_code
		,	picking_description
		,	purchase_description
		,	body_depth_outer
		,	body_width_outer
		,	body_height_outer
		,	body_length_outer
		,	body_depth_inner
		,	body_width_inner
		,	body_height_inner
		,	body_length_inner
		,	top_height_outer
		,	top_length_outer
		,	top_height_inner
		,	top_length_inner
		,	thickness
		,	capacity
		,	capacity_unit
		,	materials
		,	weight
		,	is_heat_resisted
		,	heat_resist_degrees
		,	note
		,	rank
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
		,	NEW.product_code
		,	NEW.product_name
		,	NEW.product_type
		,	NEW.is_allowed_stock_unlimited
		,	NEW.sales_ended_div
		,	NEW.sales_ended_reason
		,	NEW.sales_ended_at
		,	NEW.supplier_code
		,	NEW.supplier_item_code
		,	NEW.shelf_code01
		,	NEW.shelf_code02
		,	NEW.shelf_code03
		,	NEW.shelf_code04
		,	NEW.shelf_code05
		,	NEW.case_size
		,	NEW.catalog_info
		,	NEW.catalog_serial_num
		,	NEW.purchase_point_quantity
		,	NEW.carry_location_code
		,	NEW.kiracs_item_code
		,	NEW.kiracs_item_name01
		,	NEW.kiracs_item_name02
		,	NEW.kiracs_item_name_kana
		,	NEW.master_size
		,	NEW.division_l_code
		,	NEW.division_m_code
		,	NEW.division_s_code
		,	NEW.recycle_code
		,	NEW.jan_code
		,	NEW.itf_code
		,	NEW.purchase_unit_code
		,	NEW.order_unit_code
		,	NEW.kiracs_pricing_unit_code
		,	NEW.expa_pricing_unit_code
		,	NEW.picking_description
		,	NEW.purchase_description
		,	NEW.body_depth_outer
		,	NEW.body_width_outer
		,	NEW.body_height_outer
		,	NEW.body_length_outer
		,	NEW.body_depth_inner
		,	NEW.body_width_inner
		,	NEW.body_height_inner
		,	NEW.body_length_inner
		,	NEW.top_height_outer
		,	NEW.top_length_outer
		,	NEW.top_height_inner
		,	NEW.top_length_inner
		,	NEW.thickness
		,	NEW.capacity
		,	NEW.capacity_unit
		,	NEW.materials
		,	NEW.weight
		,	NEW.is_heat_resisted
		,	NEW.heat_resist_degrees
		,	NEW.note
		,	NEW.rank
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

ALTER FUNCTION INSERT_PRD_PRODUCTS_HISTORY OWNER TO expa_apps;