-- Table: mst_locations;
-- Table: mst_locations_history;

DROP TABLE IF EXISTS mst_locations;
DROP TABLE IF EXISTS mst_locations_history;

CREATE TABLE IF NOT EXISTS mst_locations
(
		id BIGSERIAL
	,	location_code TEXT NOT NULL
	,	location_name TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	short_name_kana TEXT NOT NULL
	,	location_type TEXT NOT NULL
	,	zip_code01 TEXT NOT NULL
	,	zip_code02 TEXT NOT NULL
	,	pref_code TEXT NOT NULL
	,	addr01 TEXT NOT NULL
	,	addr02 TEXT NOT NULL
	,	tel01 TEXT NOT NULL
	,	tel02 TEXT NOT NULL
	,	tel03 TEXT NOT NULL
	,	fax01 TEXT NOT NULL
	,	fax02 TEXT NOT NULL
	,	fax03 TEXT NOT NULL
	,	email TEXT NOT NULL
	,	carry_closing_time INTEGER
	,	rank INT
	,	is_enabled BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT mst_locations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_locations OWNER to expa_apps;

COMMENT ON TABLE mst_locations
	IS '拠点マスタ';
COMMENT ON COLUMN mst_locations.id IS '拠点ID';
COMMENT ON COLUMN mst_locations.location_code IS '拠点コード';
COMMENT ON COLUMN mst_locations.location_name IS '拠点名';
COMMENT ON COLUMN mst_locations.short_name IS '略称名';
COMMENT ON COLUMN mst_locations.short_name_kana IS '略称名(カナ)';
COMMENT ON COLUMN mst_locations.location_type IS '拠点形式';
COMMENT ON COLUMN mst_locations.zip_code01 IS '郵便番号1';
COMMENT ON COLUMN mst_locations.zip_code02 IS '郵便番号2';
COMMENT ON COLUMN mst_locations.pref_code IS '都道府県コード';
COMMENT ON COLUMN mst_locations.addr01 IS '住所1';
COMMENT ON COLUMN mst_locations.addr02 IS '住所2';
COMMENT ON COLUMN mst_locations.tel01 IS '電話番号1';
COMMENT ON COLUMN mst_locations.tel02 IS '電話番号2';
COMMENT ON COLUMN mst_locations.tel03 IS '電話番号3';
COMMENT ON COLUMN mst_locations.fax01 IS 'FAX番号1';
COMMENT ON COLUMN mst_locations.fax02 IS 'FAX番号2';
COMMENT ON COLUMN mst_locations.fax03 IS 'FAX番号3';
COMMENT ON COLUMN mst_locations.email IS 'メールアドレス';
COMMENT ON COLUMN mst_locations.carry_closing_time IS '移動依頼締め切り時間';
COMMENT ON COLUMN mst_locations.rank IS '表示順';
COMMENT ON COLUMN mst_locations.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_locations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_locations.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_locations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_locations.created_at IS '作成日時';
COMMENT ON COLUMN mst_locations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_locations.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_locations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_locations.updated_at IS '更新日時';
COMMENT ON COLUMN mst_locations.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_locations.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_locations.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_locations.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_locations.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_locations.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS mst_locations_history
(
		id BIGSERIAL
	,	location_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	location_name TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	short_name_kana TEXT NOT NULL
	,	location_type TEXT NOT NULL
	,	zip_code01 TEXT NOT NULL
	,	zip_code02 TEXT NOT NULL
	,	pref_code TEXT NOT NULL
	,	addr01 TEXT NOT NULL
	,	addr02 TEXT NOT NULL
	,	tel01 TEXT NOT NULL
	,	tel02 TEXT NOT NULL
	,	tel03 TEXT NOT NULL
	,	fax01 TEXT NOT NULL
	,	fax02 TEXT NOT NULL
	,	fax03 TEXT NOT NULL
	,	email TEXT NOT NULL
	,	carry_closing_time INTEGER
	,	rank INT
	,	is_enabled BOOLEAN NOT NULL DEFAULT FALSE
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
	,	CONSTRAINT mst_locations_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE mst_locations_history
	IS '[履歴]拠点マスタ';
COMMENT ON COLUMN mst_locations_history.id IS '拠点ID';
COMMENT ON COLUMN mst_locations_history.location_code IS '拠点コード';
COMMENT ON COLUMN mst_locations_history.location_name IS '拠点名';
COMMENT ON COLUMN mst_locations_history.short_name IS '略称名';
COMMENT ON COLUMN mst_locations_history.short_name_kana IS '略称名(カナ)';
COMMENT ON COLUMN mst_locations_history.location_type IS '拠点形式';
COMMENT ON COLUMN mst_locations_history.zip_code01 IS '郵便番号1';
COMMENT ON COLUMN mst_locations_history.zip_code02 IS '郵便番号2';
COMMENT ON COLUMN mst_locations_history.pref_code IS '都道府県コード';
COMMENT ON COLUMN mst_locations_history.addr01 IS '住所1';
COMMENT ON COLUMN mst_locations_history.addr02 IS '住所2';
COMMENT ON COLUMN mst_locations_history.tel01 IS '電話番号1';
COMMENT ON COLUMN mst_locations_history.tel02 IS '電話番号2';
COMMENT ON COLUMN mst_locations_history.tel03 IS '電話番号3';
COMMENT ON COLUMN mst_locations_history.fax01 IS 'FAX番号1';
COMMENT ON COLUMN mst_locations_history.fax02 IS 'FAX番号2';
COMMENT ON COLUMN mst_locations_history.fax03 IS 'FAX番号3';
COMMENT ON COLUMN mst_locations_history.email IS 'メールアドレス';
COMMENT ON COLUMN mst_locations_history.carry_closing_time IS '移動依頼締め切り時間';
COMMENT ON COLUMN mst_locations_history.rank IS '表示順';
COMMENT ON COLUMN mst_locations_history.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_locations_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_locations_history.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_locations_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_locations_history.created_at IS '作成日時';
COMMENT ON COLUMN mst_locations_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_locations_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_locations_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_locations_history.updated_at IS '更新日時';
COMMENT ON COLUMN mst_locations_history.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_locations_history.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_locations_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_locations_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_locations_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_locations_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS mst_locations_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_locations FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_mst_locations_trigger AFTER INSERT OR UPDATE ON mst_locations FOR EACH ROW EXECUTE FUNCTION insert_mst_locations_history();