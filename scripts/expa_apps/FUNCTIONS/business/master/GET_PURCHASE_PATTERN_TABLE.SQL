DROP FUNCTION IF EXISTS GET_PURCHASE_PATTERN_TABLE;
-- 発注パターンテーブル
CREATE OR REPLACE FUNCTION GET_PURCHASE_PATTERN_TABLE(targetDate DATE) 
RETURNS TABLE (
		purchase_pattern_id			BIGINT
	,	start_on					DATE
	,	purchase_pattern_name		TEXT
	,	purchase_method_div			TEXT
	,	last_arrival_location_code		TEXT
	,	is_enabled					BOOLEAN
	,	rank						INTEGER
	,	stock_location_code			TEXT
	,	carry_location_code01			TEXT
	,	carry_location_code02			TEXT
	,	carry_location_code03			TEXT
	,	carry_location_code04			TEXT
	,	carry_location_code05			TEXT
	,	deliv_weekdays				TEXT
	,	carry_lead_time				INTEGER
	,	carry_description01			TEXT
	,	carry_description02			TEXT
) AS $BODY$
BEGIN
	RETURN QUERY
		SELECT		mst_purchase_patterns.id
		,			mst_purchase_pattern_carry_rules.start_on
		,			mst_purchase_patterns.purchase_pattern_name
		,			mst_purchase_patterns.purchase_method_div
		,			mst_purchase_patterns.last_arrival_location_code
		,			mst_purchase_patterns.is_enabled
		,			mst_purchase_patterns.rank
		,			mst_purchase_pattern_carry_rules.stock_location_code
		,			mst_purchase_pattern_carry_rules.carry_location_code01
		,			mst_purchase_pattern_carry_rules.carry_location_code02
		,			mst_purchase_pattern_carry_rules.carry_location_code03
		,			mst_purchase_pattern_carry_rules.carry_location_code04
		,			mst_purchase_pattern_carry_rules.carry_location_code05
		,			mst_purchase_pattern_carry_rules.deliv_weekdays
		,			mst_purchase_pattern_carry_rules.carry_lead_time
		,			mst_purchase_pattern_carry_rules.carry_description01
		,			mst_purchase_pattern_carry_rules.carry_description02
		FROM		mst_purchase_patterns
		LEFT JOIN	(
						SELECT		mst_purchase_pattern_carry_rules.purchase_pattern_id
						,			MAX(mst_purchase_pattern_carry_rules.start_on)		AS	start_on
						FROM		mst_purchase_pattern_carry_rules
						WHERE		mst_purchase_pattern_carry_rules.is_deleted			=	FALSE
						AND			mst_purchase_pattern_carry_rules.start_on			<=	targetDate
						GROUP BY		mst_purchase_pattern_carry_rules.purchase_pattern_id
					)	target
		ON			mst_purchase_patterns.id					=	target.purchase_pattern_id
		LEFT JOIN		mst_purchase_pattern_carry_rules
		ON			target.purchase_pattern_id					=	mst_purchase_pattern_carry_rules.purchase_pattern_id
		AND			target.start_on								=	mst_purchase_pattern_carry_rules.start_on
		AND			mst_purchase_pattern_carry_rules.is_deleted	=	FALSE
		WHERE		mst_purchase_patterns.is_deleted			=	FALSE
		ORDER BY		mst_purchase_patterns.id
		;
END;
$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION GET_PURCHASE_PATTERN_TABLE OWNER TO expa_apps;