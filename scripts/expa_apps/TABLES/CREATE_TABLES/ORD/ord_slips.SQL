-- Table: ord_slips
-- Table: ord_slips_history

DROP TABLE IF EXISTS ord_slips;
DROP TABLE IF EXISTS ord_slips_history;

CREATE TABLE IF NOT EXISTS ord_slips
(
		id BIGSERIAL
	,	slip_no TEXT NOT NULL
	,	store_code TEXT NOT NULL
	,	store_order_no TEXT NOT NULL
	,	is_corrected BOOLEAN NOT NULL DEFAULT FALSE
	,	correction_slip_no TEXT
	,	import_div TEXT NOT NULL
	,	shipment_instructed_on DATE
	,	delivery_instructed_on DATE
	,	is_forced_cancel_invalid BOOLEAN NOT NULL DEFAULT FALSE
	,	is_several_sender BOOLEAN NOT NULL DEFAULT FALSE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	is_sent_fax_invoice BOOLEAN NOT NULL DEFAULT FALSE
	,	fax_email TEXT NOT NULL
	,	store_member_no TEXT
	,	payment_method_code TEXT NOT NULL
	,	payment_method TEXT NOT NULL
	,	order_item_price NUMERIC NOT NULL DEFAULT 0
	,	order_item_excluded_tax NUMERIC NOT NULL DEFAULT 0
	,	order_postage_price NUMERIC NOT NULL DEFAULT 0
	,	order_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	order_payment_charge NUMERIC NOT NULL DEFAULT 0
	,	order_payment_charge_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	order_total_price NUMERIC NOT NULL DEFAULT 0
	,	coupon_price NUMERIC NOT NULL DEFAULT 0
	,	discount_price NUMERIC NOT NULL DEFAULT 0
	,	use_point NUMERIC NOT NULL DEFAULT 0
	,	payment_price NUMERIC NOT NULL DEFAULT 0
	,	payment_price_ini NUMERIC NOT NULL DEFAULT 0
	,	order_description TEXT NOT NULL
	,	receipt_name TEXT NOT NULL
	,	receipt_item TEXT NOT NULL
	,	reply_message TEXT NOT NULL
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
	,	CONSTRAINT ord_slips_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_slips OWNER to expa_apps;

COMMENT ON TABLE ord_slips
	IS '受注伝票テーブル';
COMMENT ON COLUMN ord_slips.id IS '受注伝票ID';
COMMENT ON COLUMN ord_slips.slip_no IS '受注伝票No.';
COMMENT ON COLUMN ord_slips.store_code IS '店舗コード';
COMMENT ON COLUMN ord_slips.store_order_no IS '店舗別受注No.';
COMMENT ON COLUMN ord_slips.is_corrected IS '訂正伝票フラグ';
COMMENT ON COLUMN ord_slips.correction_slip_no IS '訂正元伝票No.';
COMMENT ON COLUMN ord_slips.import_div IS '受注取込区分(自動・手動)';
COMMENT ON COLUMN ord_slips.shipment_instructed_on IS '出荷日指定';
COMMENT ON COLUMN ord_slips.delivery_instructed_on IS '着日指定';
COMMENT ON COLUMN ord_slips.is_forced_cancel_invalid IS '強制キャンセル無効フラグ';
COMMENT ON COLUMN ord_slips.is_several_sender IS '複数送付先フラグ';
COMMENT ON COLUMN ord_slips.is_isolated_island IS '離島送付フラグ';
COMMENT ON COLUMN ord_slips.is_sent_fax_invoice IS '注文請書FAX送信フラグ';
COMMENT ON COLUMN ord_slips.fax_email IS 'FAX送信先メールアドレス';
COMMENT ON COLUMN ord_slips.store_member_no IS '店舗別会員No.';
COMMENT ON COLUMN ord_slips.payment_method_code IS '支払方法コード';
COMMENT ON COLUMN ord_slips.payment_method IS '支払方法';
COMMENT ON COLUMN ord_slips.order_item_price IS '商品合計金額';
COMMENT ON COLUMN ord_slips.order_item_excluded_tax IS '商品消費税額(外税)';
COMMENT ON COLUMN ord_slips.order_postage_price IS '送料合計金額';
COMMENT ON COLUMN ord_slips.order_delivery_charge IS '代引き手数料合計金額';
COMMENT ON COLUMN ord_slips.order_payment_charge IS '決済手数料合計金額';
COMMENT ON COLUMN ord_slips.order_payment_charge_tax_rate IS '決済手数料税率';
COMMENT ON COLUMN ord_slips.order_total_price IS '受注金額';
COMMENT ON COLUMN ord_slips.coupon_price IS 'クーポン利用額';
COMMENT ON COLUMN ord_slips.discount_price IS '値引金額';
COMMENT ON COLUMN ord_slips.use_point IS 'ポイント利用額';
COMMENT ON COLUMN ord_slips.payment_price IS '請求金額';
COMMENT ON COLUMN ord_slips.payment_price_ini IS '購入時請求金額';
COMMENT ON COLUMN ord_slips.order_description IS '受注備考';
COMMENT ON COLUMN ord_slips.receipt_name IS '領収書宛名';
COMMENT ON COLUMN ord_slips.receipt_item IS '領収書但書';
COMMENT ON COLUMN ord_slips.reply_message IS '返信メッセージ';
COMMENT ON COLUMN ord_slips.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slips.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slips.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slips.created_at IS '作成日時';
COMMENT ON COLUMN ord_slips.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slips.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slips.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slips.updated_at IS '更新日時';
COMMENT ON COLUMN ord_slips.is_deleted IS '削除区分';
COMMENT ON COLUMN ord_slips.deleted_description IS '削除備考';
COMMENT ON COLUMN ord_slips.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN ord_slips.deleted_terminal IS '削除端末';
COMMENT ON COLUMN ord_slips.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN ord_slips.deleted_at IS '削除日時';


--履歴テーブル
CREATE TABLE IF NOT EXISTS ord_slips_history
(
		id BIGSERIAL
	,	order_id BIGINT NOT NULL
	,	history_count INTEGER NOT NULL DEFAULT 0
	,	slip_no TEXT NOT NULL
	,	store_code TEXT NOT NULL
	,	store_order_no TEXT NOT NULL
	,	is_corrected BOOLEAN NOT NULL DEFAULT FALSE
	,	correction_slip_no TEXT
	,	import_div TEXT NOT NULL
	,	shipment_instructed_on DATE
	,	delivery_instructed_on DATE
	,	is_forced_cancel_invalid BOOLEAN NOT NULL DEFAULT FALSE
	,	is_several_sender BOOLEAN NOT NULL DEFAULT FALSE
	,	is_isolated_island BOOLEAN NOT NULL DEFAULT FALSE
	,	is_sent_fax_invoice BOOLEAN NOT NULL DEFAULT FALSE
	,	fax_email TEXT NOT NULL
	,	store_member_no TEXT
	,	payment_method_code TEXT NOT NULL
	,	payment_method TEXT NOT NULL
	,	order_item_price NUMERIC NOT NULL DEFAULT 0
	,	order_item_excluded_tax NUMERIC NOT NULL DEFAULT 0
	,	order_postage_price NUMERIC NOT NULL DEFAULT 0
	,	order_delivery_charge NUMERIC NOT NULL DEFAULT 0
	,	order_payment_charge NUMERIC NOT NULL DEFAULT 0
	,	order_payment_charge_tax_rate NUMERIC NOT NULL DEFAULT 0
	,	order_total_price NUMERIC NOT NULL DEFAULT 0
	,	coupon_price NUMERIC NOT NULL DEFAULT 0
	,	discount_price NUMERIC NOT NULL DEFAULT 0
	,	use_point NUMERIC NOT NULL DEFAULT 0
	,	payment_price NUMERIC NOT NULL DEFAULT 0
	,	payment_price_ini NUMERIC NOT NULL DEFAULT 0
	,	order_description TEXT NOT NULL
	,	receipt_name TEXT NOT NULL
	,	receipt_item TEXT NOT NULL
	,	reply_message TEXT NOT NULL
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
	,	CONSTRAINT ord_slips_history_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS ord_slips_history OWNER to expa_apps;

COMMENT ON TABLE ord_slips_history
	IS '[履歴]受注伝票テーブル';
COMMENT ON COLUMN ord_slips_history.id IS '履歴ID';
COMMENT ON COLUMN ord_slips_history.order_id IS '受注伝票ID';
COMMENT ON COLUMN ord_slips_history.history_count IS '更新回数';
COMMENT ON COLUMN ord_slips_history.slip_no IS '受注伝票No.';
COMMENT ON COLUMN ord_slips_history.store_code IS '店舗コード';
COMMENT ON COLUMN ord_slips_history.store_order_no IS '店舗別受注No.';
COMMENT ON COLUMN ord_slips_history.is_corrected IS '訂正伝票フラグ';
COMMENT ON COLUMN ord_slips_history.correction_slip_no IS '訂正元伝票No.';
COMMENT ON COLUMN ord_slips_history.import_div IS '受注取込区分(自動・手動)';
COMMENT ON COLUMN ord_slips_history.shipment_instructed_on IS '出荷日指定';
COMMENT ON COLUMN ord_slips_history.delivery_instructed_on IS '着日指定';
COMMENT ON COLUMN ord_slips_history.is_forced_cancel_invalid IS '強制キャンセル無効フラグ';
COMMENT ON COLUMN ord_slips_history.is_several_sender IS '複数送付先フラグ';
COMMENT ON COLUMN ord_slips_history.is_isolated_island IS '離島送付フラグ';
COMMENT ON COLUMN ord_slips_history.is_sent_fax_invoice IS '注文請書FAX送信フラグ';
COMMENT ON COLUMN ord_slips_history.fax_email IS 'FAX送信先メールアドレス';
COMMENT ON COLUMN ord_slips_history.store_member_no IS '店舗別会員No.';
COMMENT ON COLUMN ord_slips_history.payment_method_code IS '支払方法コード';
COMMENT ON COLUMN ord_slips_history.payment_method IS '支払方法';
COMMENT ON COLUMN ord_slips_history.order_item_price IS '商品合計金額';
COMMENT ON COLUMN ord_slips_history.order_item_excluded_tax IS '商品消費税額(外税)';
COMMENT ON COLUMN ord_slips_history.order_postage_price IS '送料合計金額';
COMMENT ON COLUMN ord_slips_history.order_delivery_charge IS '代引き手数料合計金額';
COMMENT ON COLUMN ord_slips_history.order_payment_charge IS '決済手数料合計金額';
COMMENT ON COLUMN ord_slips_history.order_payment_charge_tax_rate IS '決済手数料税率';
COMMENT ON COLUMN ord_slips_history.order_total_price IS '受注金額';
COMMENT ON COLUMN ord_slips_history.coupon_price IS 'クーポン利用額';
COMMENT ON COLUMN ord_slips_history.discount_price IS '値引金額';
COMMENT ON COLUMN ord_slips_history.use_point IS 'ポイント利用額';
COMMENT ON COLUMN ord_slips_history.payment_price IS '請求金額';
COMMENT ON COLUMN ord_slips_history.payment_price_ini IS '購入時請求金額';
COMMENT ON COLUMN ord_slips_history.order_description IS '受注備考';
COMMENT ON COLUMN ord_slips_history.receipt_name IS '領収書宛名';
COMMENT ON COLUMN ord_slips_history.receipt_item IS '領収書但書';
COMMENT ON COLUMN ord_slips_history.reply_message IS '返信メッセージ';
COMMENT ON COLUMN ord_slips_history.created_user_code IS '作成ユーザコード';
COMMENT ON COLUMN ord_slips_history.created_terminal IS '作成端末';
COMMENT ON COLUMN ord_slips_history.created_function_code IS '作成機能コード';
COMMENT ON COLUMN ord_slips_history.created_at IS '作成日時';
COMMENT ON COLUMN ord_slips_history.updated_user_code IS '更新ユーザコード';
COMMENT ON COLUMN ord_slips_history.updated_terminal IS '更新端末';
COMMENT ON COLUMN ord_slips_history.updated_function_code IS '更新機能コード';
COMMENT ON COLUMN ord_slips_history.updated_at IS '更新日時';
COMMENT ON COLUMN ord_slips_history.is_deleted IS '削除区分';
COMMENT ON COLUMN ord_slips_history.deleted_description IS '削除備考';
COMMENT ON COLUMN ord_slips_history.deleted_user_code IS '削除ユーザコード';
COMMENT ON COLUMN ord_slips_history.deleted_terminal IS '削除端末';
COMMENT ON COLUMN ord_slips_history.deleted_function_code IS '削除機能コード';
COMMENT ON COLUMN ord_slips_history.deleted_at IS '削除日時';

--更新日時更新トリガー
CREATE TRIGGER set_updated_at_trigger BEFORE INSERT OR UPDATE ON ord_slips FOR EACH ROW EXECUTE FUNCTION set_updated_at();


--テーブル更新トリガーー
CREATE TRIGGER update_ord_slips_trigger AFTER INSERT OR UPDATE ON ord_slips FOR EACH ROW EXECUTE FUNCTION insert_ord_slips_history();