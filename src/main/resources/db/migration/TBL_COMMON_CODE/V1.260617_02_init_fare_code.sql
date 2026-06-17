-- ==========================================================================================
-- 공통 코드 - 요금(Fare/Pricing) 도메인 코드
-- 대상 테이블: ATF_FARE_TAX.TAX_CD / ATF_FARE_TAX.AMT_TYPE_CD / ATF_FARE_TAX.TXBS_CD / ATF_FARE.CBIN_CD
-- ==========================================================================================


-- ==========================================================================================
-- 세금 유형 코드 (TAX_CD)
-- ATF_FARE_TAX.TAX_CD 에서 참조
-- 세금 유형 식별자: 동일 TAX_CD 로 기간별 다른 요율을 가진 여러 ATF_FARE_TAX 행이 존재
-- 새로운 세금 유형 추가 시 이 코드 그룹에 먼저 등록 후 ATF_FARE_TAX 에 요율 행 INSERT
-- ==========================================================================================

-- 그룹 최상위 코드
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'TAX_CD', '세금유형', 'Tax Type Code', '운임에 부과되는 세금·할증 유형 식별 코드. ATF_FARE_TAX.TAX_CD 참조. 동일 코드로 기간별 요율 버전 관리 가능', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- KR: 출국납부금 (Korea Departure Tax) — 대한민국 출국 시 고정 부과
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('TAX_CD', 'KR', '출국납부금', 'Korea Departure Tax', '대한민국 출국 여객에게 부과되는 정액 세금. 공항세 일부. AMT_TYPE=FIXED', 1, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- YQ: 유류할증료 (Fuel Surcharge) — 유가 연동, 노선·항공사별 요율 상이
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('TAX_CD', 'YQ', '유류할증료', 'Fuel Surcharge', '유류 가격 변동에 따라 운임에 추가되는 할증료. AMT_TYPE=PCT, TXBS=BASE_FARE. 항공사가 분기별 요율 변경 가능', 2, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- JP_JCT: 일본소비세 (Japan Consumption Tax) — 일본 노선 전용
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('TAX_CD', 'JP_JCT', '일본소비세', 'Japan Consumption Tax', '일본 출발·도착 노선 적용 소비세. AMT_TYPE=PCT, TXBS=TOTAL(기본운임+유류할증 합계 기준)', 3, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- SG_GST: 싱가포르 GST (Goods and Services Tax) — SIN 노선 전용 (예비 코드)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('TAX_CD', 'SG_GST', '싱가포르소비세', 'Singapore GST', '싱가포르 출발·도착 노선 적용 상품서비스세(GST). AMT_TYPE=PCT. 현재 예비 코드(ATF_FARE_TAX 요율 미등록)', 4, 'Y', 'N', 'SYSTEM', 'SYSTEM');


-- ==========================================================================================
-- 금액 유형 코드 (AMT_TYPE)
-- ATF_FARE_TAX.AMT_TYPE_CD 에서 참조
-- ==========================================================================================

-- 그룹 최상위 코드
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'AMT_TYPE', '금액유형', 'Amount Type', '세금/할증 금액의 계산 방식 분류. ATF_FARE_TAX.AMT_TYPE_CD 참조', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- FIXED: 정액 — 통화 금액 그대로 적용 (예: 출국납부금 10,000원)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('AMT_TYPE', 'FIXED', '정액', 'Fixed Amount', '운임·탑승객 수와 무관하게 정해진 금액을 그대로 부과. ATF_FARE_TAX.CRNCY_CD 필수', 1, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- PCT: 정률 — 기준 금액에 비율을 곱해 산출 (예: 유류할증 15%)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('AMT_TYPE', 'PCT', '정률', 'Percentage Rate', '기준 금액(TXBS_CD 로 결정)에 비율(TAX_AMT)을 곱해 산출. CRNCY_CD 는 NULL', 2, 'Y', 'N', 'SYSTEM', 'SYSTEM');


-- ==========================================================================================
-- 과세 기준 코드 (TXBS)
-- ATF_FARE_TAX.TXBS_CD 에서 참조
-- AMT_TYPE_CD='PCT' 인 정률 세금의 곱셈 기준값을 결정
-- ==========================================================================================

-- 그룹 최상위 코드
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'TXBS', '과세기준', 'Tax Base', '정률 세금 산출 시 적용되는 기준 금액 분류. AMT_TYPE_CD=PCT 일 때만 유효. ATF_FARE_TAX.TXBS_CD 참조', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- BASE_FARE: 기본 운임만 기준 — 다른 세금과 무관하게 순수 BASE_FARE_AMT 에만 곱함
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('TXBS', 'BASE_FARE', '기본운임', 'Base Fare Only', 'ATF_FARE.BASE_FARE_AMT 에만 비율을 곱해 세금 산출. 다른 세금 누적값 무시. 예) 유류할증료', 1, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- TOTAL: 직전 단계 누적 합계 기준 — 앞 순서(APLCN_ORD)의 세금까지 합산한 값에 곱함
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('TXBS', 'TOTAL', '누적합계', 'Running Total', 'BASE_FARE + 직전 APLCN_ORD 까지의 세금 누적 합계에 비율을 곱해 산출. 예) 일본소비세(BASE_FARE+유류할증 합계×10%)', 2, 'Y', 'N', 'SYSTEM', 'SYSTEM');


-- ==========================================================================================
-- 객실 등급 코드 (CBIN)
-- ATF_FARE.CBIN_CD 에서 참조
-- V1: USE_YN='N' (현재 미사용, CBIN_CD=NULL 로 단일 등급 운용)
-- V2: USE_YN='Y' 로 변경 후 CBIN_CD 값으로 등급별 운임 분리
-- ==========================================================================================

-- 그룹 최상위 코드 (V2 활성화 전까지 USE_YN='N')
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'CBIN', '객실등급', 'Cabin Class', '항공기 객실 등급 분류. ATF_FARE.CBIN_CD 참조. V1 에서는 CBIN_CD=NULL 로 운용하며 V2 확장 시 활성화', 0, 'N', 'N', 'SYSTEM', 'SYSTEM');

-- Y: 이코노미 (Economy)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CBIN', 'Y', '이코노미', 'Economy', '일반석. IATA RBD Y/B/M/H/Q/K 등 이코노미 클래스 전체. V2 활성화 필요', 1, 'N', 'N', 'SYSTEM', 'SYSTEM');

-- C: 비즈니스 (Business)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CBIN', 'C', '비즈니스', 'Business', '비즈니스석. IATA RBD J/C/D/I/Z 등. 일부 항공사 프리미엄 이코노미(W) 포함 가능. V2 활성화 필요', 2, 'N', 'N', 'SYSTEM', 'SYSTEM');

-- F: 일등석 (First Class)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CBIN', 'F', '일등석', 'First Class', '일등석. IATA RBD F/A/P 등. V2 활성화 필요', 3, 'N', 'N', 'SYSTEM', 'SYSTEM');
