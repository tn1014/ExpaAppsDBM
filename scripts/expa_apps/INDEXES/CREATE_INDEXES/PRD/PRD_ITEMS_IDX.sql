--DROP INDEX prd_items_idx;
CREATE INDEX prd_items_idx ON prd_items (item_code, is_deleted);