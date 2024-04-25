-- Table: prd_rakuten_genre_ids;

DROP TABLE IF EXISTS prd_rakuten_genre_ids;

CREATE TABLE IF NOT EXISTS prd_rakuten_genre_ids
(
		id BIGSERIAL
	,	genre_id TEXT NOT NULL
	,	genre_path TEXT NOT NULL
	,	rank INT
	,	created_user_code TEXT NOT NULL
	,	created_terminal TEXT NOT NULL
	,	created_function_code TEXT NOT NULL
	,	created_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
	,	updated_user_code TEXT NOT NULL
	,	updated_terminal TEXT NOT NULL
	,	updated_function_code TEXT NOT NULL
	,	updated_at TIMESTAMP(3) WITHOUT TIME ZONE NOT NULL
	,	CONSTRAINT prd_rakuten_genre_ids_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_rakuten_genre_ids OWNER to expa_apps;

COMMENT ON TABLE prd_rakuten_genre_ids
	IS '楽天市場ジャンルIDマスタ';
COMMENT ON COLUMN prd_rakuten_genre_ids.id IS 'ジャンルID';
COMMENT ON COLUMN prd_rakuten_genre_ids.genre_id IS '楽天市場ジャンルID';
COMMENT ON COLUMN prd_rakuten_genre_ids.genre_path IS '楽天市場ジャンルパス';
COMMENT ON COLUMN prd_rakuten_genre_ids.rank IS '表示順';
COMMENT ON COLUMN prd_rakuten_genre_ids.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_rakuten_genre_ids.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_rakuten_genre_ids.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_rakuten_genre_ids.created_at IS '作成日時';
COMMENT ON COLUMN prd_rakuten_genre_ids.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_rakuten_genre_ids.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_rakuten_genre_ids.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_rakuten_genre_ids.updated_at IS '更新日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_rakuten_genre_ids FOR EACH ROW EXECUTE FUNCTION set_updated_at();