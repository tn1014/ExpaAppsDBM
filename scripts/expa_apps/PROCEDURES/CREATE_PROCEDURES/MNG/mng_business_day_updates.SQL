/* *******************************************
 * 営業日マスタ更新プロシージャ
 * *******************************************/
CREATE OR REPLACE PROCEDURE mng_business_day_updates() AS $$ 
DECLARE
	startDate			DATE := NULL;
	startYear			SMALLINT := NULL;
	endDate			DATE := NULL;
	currentDate		DATE := NULL;
	currentMd			TEXT := NULL;
	currentWd			SMALLINT := NULL;
	
	holidayWeekdays		TEXT := NULL;
	
	arrAnnualHolidays	TEXT[] := NULL;
	arrYearlyHolidays	DATE[] := NULL;
	isBusinessDay		BOOLEAN := FALSE;
BEGIN
	RAISE INFO '営業日マスタ更新開始';
	
	-- テーブルロック
	LOCK mng_business_days IN EXCLUSIVE MODE NOWAIT;
	
	--営業日マスタ一括削除
	DELETE FROM mng_business_days;
	
	-- 2年前の日付を取得
	SELECT TO_DATE(TO_CHAR(now() + '-2 year', 'YYYY-MM-DD'), 'YYYY-MM-DD') INTO startDate;
	RAISE INFO '開始日 = %', startDate;
	SELECT CAST(TO_CHAR(startDate, 'YYYY') AS SMALLINT) INTO startYear;
	
	-- 5年後の日付を取得
	SELECT TO_DATE(TO_CHAR(now() + '5 year', 'YYYY-MM-DD'), 'YYYY-MM-DD') INTO endDate;
	RAISE INFO '終了日 = %', endDate;
	
	-- 固定休日配列を取得
	SELECT		ARRAY(
					SELECT		(month || '-' || day)
					FROM		mng_annual_holidays
					WHERE		is_business_day = FALSE
					ORDER BY		CAST(month AS SMALLINT)
					,			CAST(day AS SMALLINT)
				)
	INTO			arrAnnualHolidays
	;
	RAISE INFO '固定休日 = %', arrAnnualHolidays;
	
	-- 年毎休日配列を取得
	SELECT		ARRAY(
					SELECT		TO_DATE(year || '-' || month || '-' || day, 'YYYY-MM-DD')
					FROM		mng_yearly_holidays
					WHERE		is_business_day = FALSE
					AND			CAST(year AS SMALLINT)		>=	startYear
					ORDER BY		TO_DATE(year || '-' || month || '-' || day, 'YYYY-MM-DD')
				)
	INTO			arrYearlyHolidays
	;
	RAISE INFO '年毎休日 = %', arrYearlyHolidays;
	
	
	--営業日データ作成
	currentDate := startDate;
	WHILE currentDate <= endDate LOOP
		isBusinessDay := TRUE;
		--当月日を取得
		currentMd := TO_CHAR(currentDate, 'MM-DD');
		--当曜日番号取得(1～7)
		SELECT EXTRACT(ISODOW FROM currentDate) INTO currentWd;
		
		--固定休日のチェック
		IF ARRAY_POSITION(arrAnnualHolidays, currentMd) IS NOT NULL THEN
			isBusinessDay := FALSE;
		END IF;
		
		--年毎休日のチェック
		IF ARRAY_POSITION(arrYearlyHolidays, currentDate) IS NOT NULL THEN
			isBusinessDay := FALSE;
		END IF;
		
		--定休曜日の取得
		SELECT		weekdays
		INTO			holidayWeekdays
		FROM		mng_regular_holidays
		WHERE		id	=	(
								SELECT		id
								FROM		mng_regular_holidays
								WHERE		is_deleted		=	FALSE
								AND			start_on		=	(
																SELECT	MAX(start_on)
																FROM	mng_regular_holidays
																WHERE	is_deleted		=	FALSE
																AND		start_on		<=	currentDate
															)
							)
		;
		IF holidayWeekdays IS NOT NULL AND STRPOS(holidayWeekdays, CAST(currentWd AS TEXT)) > 0 THEN
			isBusinessDay = FALSE;
		END IF;
		
		--営業日の場合は営業日マスタに追加
		IF isBusinessDay THEN
			RAISE INFO '営業日 = % (%)', currentDate, currentWd;
			
			INSERT INTO mng_business_days VALUES (
				currentDate
			,	currentWd
			);
		END IF;
		
		--日付加算
		currentDate := currentDate + CAST( '1 days' as INTERVAL );
	END LOOP;
	
	--終了
	RAISE INFO '営業日マスタ更新処理終了';
	
EXCEPTION
	WHEN OTHERS THEN
		RAISE INFO 'SQLSTATE = %', SQLSTATE;
		RAISE INFO 'SQLERRM = %', SQLERRM;
		RETURN;
END;	
$$ LANGUAGE plpgsql;
ALTER PROCEDURE mng_business_day_updates() OWNER to expa_apps;