--DROP INDEX mst_product_units_idx;
CREATE INDEX mst_product_units_idx ON mst_product_units (unit_code, is_deleted);
