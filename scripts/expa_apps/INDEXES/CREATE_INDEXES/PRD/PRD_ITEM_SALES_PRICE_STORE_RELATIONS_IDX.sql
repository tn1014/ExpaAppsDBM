--DROP INDEX prd_item_sales_price_store_relations_idx;
CREATE INDEX prd_item_sales_price_store_relations_idx ON prd_item_sales_price_store_relations (item_code, start_on, store_code, is_deleted);