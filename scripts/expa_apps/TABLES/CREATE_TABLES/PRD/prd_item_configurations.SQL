-- Table: prd_item_configurations;
-- Table: prd_item_configurations_history;

DROP TABLE IF EXISTS prd_item_configurations;
DROP TABLE IF EXISTS prd_item_configurations_history;

CREATE TABLE IF NOT EXISTS prd_item_configurations
(
		id BIGSERIAL
	,	item_code TEXT NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	configuration_parts_div TEXT NOT NULL
	,	sales_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	rank SMALLINT
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
	,	CONSTRAINT prd_item_configurations_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS prd_item_configurations OWNER to expa_apps;

COMMENT ON TABLE prd_item_configurations
	IS '商品構成マスタ';
COMMENT ON COLUMN prd_item_configurations.id IS '商品構成ID';
COMMENT ON COLUMN prd_item_configurations.item_code IS '商品コード';
COMMENT ON COLUMN prd_item_configurations.product_code IS '構成製品コード';
COMMENT ON COLUMN prd_item_configurations.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN prd_item_configurations.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN prd_item_configurations.sales_unit_quantity IS '販売単位入数';
COMMENT ON COLUMN prd_item_configurations.rank IS '表示順';
COMMENT ON COLUMN prd_item_configurations.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_item_configurations.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_item_configurations.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_item_configurations.created_at IS '作成日時';
COMMENT ON COLUMN prd_item_configurations.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_item_configurations.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_item_configurations.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_item_configurations.updated_at IS '更新日時';
COMMENT ON COLUMN prd_item_configurations.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_item_configurations.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_item_configurations.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_item_configurations.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_item_configurations.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_item_configurations.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS prd_item_configurations_history
(
		id BIGSERIAL
	,	item_code TEXT NOT NULL
	,	history_count INTEGER NOT NULL
	,	product_code TEXT NOT NULL
	,	inventory_seq INTEGER NOT NULL DEFAULT 0
	,	configuration_parts_div TEXT NOT NULL
	,	sales_unit_quantity NUMERIC NOT NULL DEFAULT 0
	,	rank SMALLINT
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
	,	CONSTRAINT prd_item_configurations_history_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prd_item_configurations_history
	IS '[履歴]商品構成マスタ';
COMMENT ON COLUMN prd_item_configurations_history.id IS '履歴ID';
COMMENT ON COLUMN prd_item_configurations_history.item_code IS '商品コード';
COMMENT ON COLUMN prd_item_configurations_history.history_count IS '更新回数';
COMMENT ON COLUMN prd_item_configurations_history.product_code IS '製品コード';
COMMENT ON COLUMN prd_item_configurations_history.inventory_seq IS '在庫管理番号';
COMMENT ON COLUMN prd_item_configurations_history.configuration_parts_div IS '構成製品パーツ区分';
COMMENT ON COLUMN prd_item_configurations_history.sales_unit_quantity IS '販売単位入数';
COMMENT ON COLUMN prd_item_configurations_history.rank IS '表示順';
COMMENT ON COLUMN prd_item_configurations_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN prd_item_configurations_history.created_terminal IS '作成端末';
COMMENT ON COLUMN prd_item_configurations_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN prd_item_configurations_history.created_at IS '作成日時';
COMMENT ON COLUMN prd_item_configurations_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN prd_item_configurations_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN prd_item_configurations_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN prd_item_configurations_history.updated_at IS '更新日時';
COMMENT ON COLUMN prd_item_configurations_history.is_deleted IS '削除区分';
COMMENT ON COLUMN prd_item_configurations_history.deleted_description IS '削除備考';
COMMENT ON COLUMN prd_item_configurations_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN prd_item_configurations_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN prd_item_configurations_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN prd_item_configurations_history.deleted_at IS '削除日時';

ALTER TABLE IF EXISTS prd_item_configurations_history OWNER to expa_apps;

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON prd_item_configurations FOR EACH ROW EXECUTE FUNCTION set_updated_at();
--テーブル更新トリガーー
CREATE TRIGGER update_prd_item_configurations_trigger AFTER INSERT OR UPDATE ON prd_item_configurations FOR EACH ROW EXECUTE FUNCTION insert_prd_item_configurations_history();