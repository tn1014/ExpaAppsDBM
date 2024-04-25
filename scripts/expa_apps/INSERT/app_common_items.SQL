DELETE FROM app_common_items;

INSERT INTO app_common_items (
		common_item_category_code
	,	common_item_code
	,	common_item_name
	,	common_item_value
	,	common_item_num
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
	,	'FULLTIME'
	,	'正社員'
	,	''
	,	''
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

INSERT INTO app_common_items (
		common_item_category_code
	,	common_item_code
	,	common_item_name
	,	common_item_value
	,	common_item_num
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
	,	'PARTTIME'
	,	'パート・アルバイト'
	,	''
	,	NULL
	,	2
	,	TRUE
	,	'SYSTEM'
	,	'localhost'
	,	'SYS0000'
	,	'SYSTEM'
	,	'localhost'
	,	'SYS0000'
	,	FALSE
);

INSERT INTO app_common_items (
		common_item_category_code
	,	common_item_code
	,	common_item_name
	,	common_item_value
	,	common_item_num
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
	,	'TEMPORARY'
	,	'嘱託'
	,	''
	,	NULL
	,	3
	,	TRUE
	,	'SYSTEM'
	,	'localhost'
	,	'SYS0000'
	,	'SYSTEM'
	,	'localhost'
	,	'SYS0000'
	,	FALSE
);