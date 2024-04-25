-- Table: mst_deliv_companies;

DROP TABLE IF EXISTS mst_deliv_companies;

CREATE TABLE IF NOT EXISTS mst_deliv_companies
(
		id BIGSERIAL
	,	company_code TEXT NOT NULL
	,	company_name TEXT NOT NULL
	,	short_name TEXT NOT NULL
	,	short_name_kana TEXT NOT NULL
	,	tel01 TEXT NOT NULL
	,	tel02 TEXT NOT NULL
	,	tel03 TEXT NOT NULL
	,	fax01 TEXT NOT NULL
	,	fax02 TEXT NOT NULL
	,	fax03 TEXT NOT NULL
	,	email TEXT NOT NULL
	,	open_time INTEGER
	,	close_time INTEGER
	,	carry_out_closing_time INTEGER
	,	carry_in_closing_time INTEGER
	,	site_url TEXT NOT NULL
	,	system_url TEXT NOT NULL
	,	inquiry_url TEXT NOT NULL
	,	rakuten_relation_code TEXT NOT NULL
	,	yahoo_relation_code TEXT NOT NULL
	,	honten_relation_code TEXT NOT NULL
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
	,	CONSTRAINT mst_deliv_companies_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS mst_deliv_companies OWNER to expa_apps;

COMMENT ON TABLE mst_deliv_companies
	IS '配送業者マスタ';
COMMENT ON COLUMN mst_deliv_companies.id IS '配送業者ID';
COMMENT ON COLUMN mst_deliv_companies.company_code IS '配送業者コード';
COMMENT ON COLUMN mst_deliv_companies.company_name IS '配送業者名';
COMMENT ON COLUMN mst_deliv_companies.short_name IS '略称名';
COMMENT ON COLUMN mst_deliv_companies.short_name_kana IS '略称名(カナ)';
COMMENT ON COLUMN mst_deliv_companies.tel01 IS '電話番号1';
COMMENT ON COLUMN mst_deliv_companies.tel02 IS '電話番号2';
COMMENT ON COLUMN mst_deliv_companies.tel03 IS '電話番号3';
COMMENT ON COLUMN mst_deliv_companies.fax01 IS 'FAX番号1';
COMMENT ON COLUMN mst_deliv_companies.fax02 IS 'FAX番号2';
COMMENT ON COLUMN mst_deliv_companies.fax03 IS 'FAX番号3';
COMMENT ON COLUMN mst_deliv_companies.email IS 'メールアドレス';
COMMENT ON COLUMN mst_deliv_companies.open_time IS '営業開始時間';
COMMENT ON COLUMN mst_deliv_companies.close_time IS '営業終了時間';
COMMENT ON COLUMN mst_deliv_companies.carry_out_closing_time IS '集荷締め切り時間';
COMMENT ON COLUMN mst_deliv_companies.carry_in_closing_time IS '持ち込み締め切り時間';
COMMENT ON COLUMN mst_deliv_companies.site_url IS 'ホームページURL';
COMMENT ON COLUMN mst_deliv_companies.system_url IS '出荷システムURL';
COMMENT ON COLUMN mst_deliv_companies.inquiry_url IS '配送伝票問い合わせURL';
COMMENT ON COLUMN mst_deliv_companies.rakuten_relation_code IS '楽天市場配送業者コード';
COMMENT ON COLUMN mst_deliv_companies.yahoo_relation_code IS 'Yahoo!ショッピング配送業者コード';
COMMENT ON COLUMN mst_deliv_companies.honten_relation_code IS '本店グ配送業者コード';
COMMENT ON COLUMN mst_deliv_companies.rank IS '表示順';
COMMENT ON COLUMN mst_deliv_companies.is_enabled IS '使用可能区分';
COMMENT ON COLUMN mst_deliv_companies.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN mst_deliv_companies.created_terminal IS '作成端末';
COMMENT ON COLUMN mst_deliv_companies.created_function_code IS '作成機能コード';
COMMENT ON COLUMN mst_deliv_companies.created_at IS '作成日時';
COMMENT ON COLUMN mst_deliv_companies.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN mst_deliv_companies.updated_terminal IS '更新端末';
COMMENT ON COLUMN mst_deliv_companies.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN mst_deliv_companies.updated_at IS '更新日時';
COMMENT ON COLUMN mst_deliv_companies.is_deleted IS '削除区分';
COMMENT ON COLUMN mst_deliv_companies.deleted_description IS '削除備考';
COMMENT ON COLUMN mst_deliv_companies.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN mst_deliv_companies.deleted_terminal IS '削除端末';
COMMENT ON COLUMN mst_deliv_companies.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN mst_deliv_companies.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON mst_deliv_companies FOR EACH ROW EXECUTE FUNCTION set_updated_at();