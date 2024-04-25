--退避テーブルから実テーブルにデータ移行
INSERT INTO app_functions
SELECT
	id
,	function_code
,	function_name
,	function_version
,	function_type
,	function_summary
,	is_required_authority
,	is_displayed_menu
,	controller
,	context_path
,	js_path
,	function_icon
,	destination_context_path01
,	destination_context_path02
,	destination_context_path03
,	destination_context_path04
,	destination_context_path05
,	destination_context_path06
,	destination_context_path07
,	destination_context_path08
,	destination_context_path09
,	destination_context_path10
,	rank
,	is_enabled
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
FROM tmp_app_functions;

--退避テーブル削除
DROP TABLE tmp_app_functions;

--シーケンス更新
SELECT setval('app_functions_id_seq',(SELECT max(id) FROM app_functions));