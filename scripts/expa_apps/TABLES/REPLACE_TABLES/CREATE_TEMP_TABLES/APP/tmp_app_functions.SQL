-- Table: app_functions

CREATE TABLE IF NOT EXISTS tmp_app_functions
(
		id BIGSERIAL
	,	function_code TEXT NOT NULL
	,	function_name TEXT NOT NULL
	,	function_version TEXT NOT NULL
	,	function_type TEXT NOT NULL
	,	function_summary TEXT NOT NULL
	,	is_required_authority BOOLEAN NOT NULL DEFAULT false
	,	is_displayed_menu BOOLEAN NOT NULL DEFAULT false
	,	controller TEXT NOT NULL
	,	context_path TEXT NOT NULL
	,	js_path TEXT
	,	function_icon TEXT
	,	destination_context_path01 TEXT NOT NULL
	,	destination_context_path02 TEXT NOT NULL
	,	destination_context_path03 TEXT NOT NULL
	,	destination_context_path04 TEXT NOT NULL
	,	destination_context_path05 TEXT NOT NULL
	,	destination_context_path06 TEXT NOT NULL
	,	destination_context_path07 TEXT NOT NULL
	,	destination_context_path08 TEXT NOT NULL
	,	destination_context_path09 TEXT NOT NULL
	,	destination_context_path10 TEXT NOT NULL
	,	rank INT
	,	is_enabled BOOLEAN NOT NULL DEFAULT false
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	is_deleted BOOLEAN NOT NULL DEFAULT FALSE
	,	deleted_user_code TEXT
	,	deleted_terminal TEXT
	,	deleted_function_code TEXT
	,	deleted_at TIMESTAMP(3) WITHOUT TIME ZONE
	,	deleted_description TEXT
);

ALTER TABLE IF EXISTS tmp_app_functions OWNER to expa_apps;

INSERT INTO tmp_app_functions SELECT * FROM app_functions;
