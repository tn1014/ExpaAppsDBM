-- Table: mng_business_days;

DROP TABLE IF EXISTS mng_business_days;

CREATE TABLE IF NOT EXISTS mng_business_days
(
		business_date	DATE
	,	weekday		SMALLINT
);

ALTER TABLE IF EXISTS mng_business_days OWNER to expa_apps;

COMMENT ON TABLE mng_business_days
	IS '営業日マスタ';
COMMENT ON COLUMN mng_business_days.business_date IS '営業日';
COMMENT ON COLUMN mng_business_days.weekday IS '曜日番号';