DELETE FROM app_common_item_categories;

INSERT INTO app_common_item_categories (
		common_item_category_code
	,	common_item_category_name
	,	rank
	,	is_enabled
	,	created_user_code
	,	created_terminal
	,	created_function_code
	,	updated_user_code
	,	updated_terminal
	,	updated_function_code
	,	is_deleted
) VALUES (
		'EMPLOYMENT_TYPE'
	,	'雇用形態'
	,	1
	,	TRUE
	,	'SYSTEM'
	,	'localhost'
	,	'SYS0000'
	,	'SYSTEM'
	,	'localhost'
	,	'SYS0000'
	,	FALSE
);