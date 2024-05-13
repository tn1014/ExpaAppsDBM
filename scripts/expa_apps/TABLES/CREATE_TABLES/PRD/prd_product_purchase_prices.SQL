-- Table: prd_product_purchase_prices;
-- Table: prd_product_purchase_prices_history;

DROP TABLE IF EXISTS prd_product_purchase_prices;
DROP TABLE IF EXISTS prd_product_purchase_prices_history;

CREATE TABLE IF NOT EXISTS prd_product_purchase_prices
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	start_on DATE NOT NULL
	,	lot_seq SMALLINT NOT NULL
	,	lot_quantity INTEGER
	,	kiracs_purchase_unit_price NUMERIC
	,	expa_purchase_unit_price NUMERIC
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
	,	CONSTRAINT prd_product_purchase_prices_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_product_purchase_prices OWNER to expa_apps;

COMMENT ON TABLE prd_product_purchase_prices
	IS '製品仕入単価マスタ';
COMMENT ON COLUMN prd_product_purchase_prices.id IS '仕入単価ID';
COMMENT ON COLUMN prd_product_purchase_prices.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_purchase_prices.start_on IS '適用日';
COMMENT ON COLUMN prd_product_purchase_prices.lot_seq IS 'ロット管理番号';
COMMENT ON COLUMN prd_product_purchase_prices.lot_quantity IS 'ロット数';
COMMENT ON COLUMN prd_product_purchase_prices.kiracs_purchase_unit_price IS 'キラックス仕入単価';
COMMENT ON COLUMN prd_product_purchase_prices.expa_purchase_unit_price IS 'エクス仕入単価';
COMMENT ON COLUMN prd_product_purchase_prices.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_purchase_prices.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_purchase_prices.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_purchase_prices.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_purchase_prices.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_purchase_prices.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_purchase_prices.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_purchase_prices.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_purchase_prices.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_purchase_prices.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_purchase_prices.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_purchase_prices.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_purchase_prices.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_purchase_prices.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_product_purchase_prices_history
(
		id BIGSERIAL
	,	product_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	start_on DATE NOT NULL
	,	lot_seq SMALLINT NOT NULL
	,	lot_quantity INTEGER
	,	kiracs_purchase_unit_price NUMERIC
	,	expa_purchase_unit_price NUMERIC
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
	,	CONSTRAINT prd_product_purchase_prices_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_product_purchase_prices_history
	IS '[履歴]製品仕入単価マスタ';
COMMENT ON COLUMN prd_product_purchase_prices_history.id IS '履歴ID';
COMMENT ON COLUMN prd_product_purchase_prices_history.product_code IS '製品コード';
COMMENT ON COLUMN prd_product_purchase_prices_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_product_purchase_prices_history.start_on IS '適用日';
COMMENT ON COLUMN prd_product_purchase_prices_history.lot_seq IS 'ロット管理番号';
COMMENT ON COLUMN prd_product_purchase_prices_history.lot_quantity IS 'ロット数';
COMMENT ON COLUMN prd_product_purchase_prices_history.kiracs_purchase_unit_price IS 'キラックス仕入単価';
COMMENT ON COLUMN prd_product_purchase_prices_history.expa_purchase_unit_price IS 'エクス仕入単価';
COMMENT ON COLUMN prd_product_purchase_prices_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_product_purchase_prices_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_product_purchase_prices_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_product_purchase_prices_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_product_purchase_prices_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_product_purchase_prices_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_product_purchase_prices_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_product_purchase_prices_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_product_purchase_prices_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_product_purchase_prices_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_product_purchase_prices_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_product_purchase_prices_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_product_purchase_prices_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_product_purchase_prices_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_product_purchase_prices_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_product_purchase_prices FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_product_purchase_prices_trigger AFTER INSERT OR UPDATE ON prd_product_purchase_prices FOR EACH ROW EXECUTE FUNCTION insert_prd_product_purchase_prices_history();