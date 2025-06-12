DELETE FROM	pur_arrival_results;
DELETE FROM	pur_arrival_results_history;

DELETE FROM	pur_arrival_schedules;
DELETE FROM	pur_arrival_schedules_history;

DELETE FROM 	pur_direct_order_delivery_destinations;

DELETE FROM	pur_direct_orders;
DELETE FROM	pur_direct_orders_history;
DELETE FROM	pur_direct_order_details;
DELETE FROM	pur_direct_order_details_history;

DELETE FROM 	pur_direct_order_supplier_delivery_destinations;

DELETE FROM	pur_direct_order_temporaries;

DELETE FROM	pur_orders;
DELETE FROM	pur_orders_history;
DELETE FROM	pur_order_details;
DELETE FROM	pur_order_details_history;

DELETE FROM	pur_order_temporaries;

DELETE FROM	pur_output_delivery_destination_slips;

DELETE FROM	inv_stock_transaction_quantities
WHERE		stock_transaction_id	IN	(
									SELECT	id
									FROM	inv_stock_transactions
									WHERE	inout_div		=	'IN'
								);

DELETE FROM	inv_stock_transactions
WHERE		inout_div		=	'IN';

DELETE FROM	inv_stock_transaction_temporaries
WHERE		inout_div		=	'IN';

DELETE FROM	inv_stocks;
DELETE FROM	inv_stock_quantities;