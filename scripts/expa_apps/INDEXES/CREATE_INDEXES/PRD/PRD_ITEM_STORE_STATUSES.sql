--DROP INDEX prd_item_store_statuses_idx;
CREATE INDEX prd_item_store_statuses_idx ON prd_item_store_statuses (item_code, is_deleted);