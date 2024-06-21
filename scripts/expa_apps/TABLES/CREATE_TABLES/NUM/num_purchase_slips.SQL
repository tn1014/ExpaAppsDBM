-- Table: num_purchase_slips

DROP TABLE IF EXISTS num_purchase_slips;

CREATE TABLE IF NOT EXISTS num_purchase_slips
(
	slip_div TEXT NOT NULL
,	no BIGINT NOT NULL
);

ALTER TABLE IF EXISTS num_purchase_slips OWNER to expa_apps;

COMMENT ON TABLE num_purchase_slips
	IS '発注番号採番テーブル';
COMMENT ON COLUMN num_purchase_slips.slip_div IS '伝票区分(2:発注、5:メーカー直送、8:使用依頼)';
COMMENT ON COLUMN num_purchase_slips.no IS '発注番号';

INSERT INTO num_purchase_slips VALUES(
	'PURCHASE'
,	2000000001
);

INSERT INTO num_purchase_slips VALUES(
	'DIRECTLY_DELIV_PURCHASE'
,	5000000001
);

INSERT INTO num_purchase_slips VALUES(
	'USE_REQUEST_PURCHASE'
,	3000000001
);
