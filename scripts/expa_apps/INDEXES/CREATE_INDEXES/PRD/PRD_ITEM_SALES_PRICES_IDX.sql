--DROP INDEX prd_item_sales_prices_idx;
CREATE INDEX prd_item_sales_prices_idx ON prd_item_sales_prices (item_code, start_on, is_deleted);