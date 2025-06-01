DELETE FROM	ord_slips;
DELETE FROM	ord_slips_history;

DELETE FROM	ord_slip_timestamps;

DELETE FROM	ord_slip_shipment_states;
DELETE FROM	ord_slip_shipment_states_history;

DELETE FROM	ord_slip_payment_states;
DELETE FROM	ord_slip_payment_states_history;

DELETE FROM	ord_slip_orderers;
DELETE FROM	ord_slip_orderers_history;

DELETE FROM	ord_slip_customer_descriptions;

DELETE FROM	ord_senders;
DELETE FROM	ord_senders_history;

DELETE FROM	ord_packages;
DELETE FROM	ord_packages_history;

DELETE FROM	ord_package_shipments;
DELETE FROM	ord_package_shipments_history;

DELETE FROM	ord_package_shipment_timestamps;

DELETE FROM	ord_package_shipment_tracking_numbers;

DELETE FROM	ord_package_shipment_products;
DELETE FROM	ord_package_shipment_products_history;

DELETE FROM	ord_package_shipment_preparations;

DELETE FROM	ord_package_shipment_recordings;
DELETE FROM	ord_package_shipment_product_purchase_costs;

DELETE FROM	ord_package_items;
DELETE FROM	ord_package_items_history;

DELETE FROM	ord_package_item_configurations;
DELETE FROM	ord_package_item_configurations_history;

DELETE FROM	ord_package_address_divisions;

DELETE FROM	inv_stock_transaction_quantities
WHERE		stock_transaction_id	IN	(
									SELECT	id
									FROM	inv_stock_transactions
									WHERE	inout_div		=	'OUT'
								);

DELETE FROM	inv_stock_transactions
WHERE		inout_div		=	'OUT';

DELETE FROM	inv_stock_transaction_temporaries
WHERE		inout_div		=	'OUT';

DELETE FROM	inv_stocks;
DELETE FROM	inv_stock_quantities;