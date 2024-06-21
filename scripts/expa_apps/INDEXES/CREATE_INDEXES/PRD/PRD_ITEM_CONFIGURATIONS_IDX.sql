--DROP INDEX prd_item_configurations_idx;
CREATE INDEX prd_item_configurations_idx ON prd_item_configurations (item_code, product_code, is_deleted);
