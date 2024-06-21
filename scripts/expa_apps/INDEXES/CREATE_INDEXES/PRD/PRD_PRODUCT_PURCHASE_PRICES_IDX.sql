--DROP INDEX prd_product_purchase_prices_idx;
CREATE INDEX prd_product_purchase_prices_idx ON prd_product_purchase_prices (product_code, start_on, lot_seq);