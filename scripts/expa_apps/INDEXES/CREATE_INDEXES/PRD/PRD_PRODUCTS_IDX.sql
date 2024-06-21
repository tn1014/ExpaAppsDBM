--DROP INDEX prd_products_idx;
CREATE INDEX prd_products_idx ON prd_products (product_code, is_deleted);

