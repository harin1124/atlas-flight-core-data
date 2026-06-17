-- ==========================================================================================
-- 공통 코드 - 항공 운항 도메인 코드 (ACFT_STTS / FLT_STTS / CHG_RSN)
-- 대상 테이블: ATF_ACFT.STTS_CD / ATF_FLT_SCHDL.FLT_STTS_CD / ATF_FLT_SCHDL_CHG_HSTRY.CHG_RSN_CD
-- ==========================================================================================


-- ==========================================================================================
-- 항공기 상태 코드 (ACFT_STTS)
-- ATF_ACFT.STTS_CD 에서 참조
-- ==========================================================================================

-- 그룹 최상위 코드
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'ACFT_STTS', '항공기상태', 'Aircraft Status', '항공기 운용 상태 분류 코드', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 운항가능 : 정상 배정 및 운항 가능 상태
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ACFT_STTS', 'ACTIVE', '운항가능', 'Active', '정상 운항 가능 상태. 스케줄 배정 허용', 1, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 정비중 : 정비·점검으로 운항 불가 (MAINTENANCE 11자 → TBL_COMMON_CODE.CD VARCHAR(10) 초과로 MAINT 사용)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ACFT_STTS', 'MAINT', '정비중', 'Maintenance', '정비 및 점검으로 일시 운항 불가 상태. 스케줄 배정 불가', 2, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 퇴역 : 운항에서 영구 제외
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ACFT_STTS', 'RETIRED', '퇴역', 'Retired', '운항에서 영구 제외된 항공기. 이력 보존 목적으로만 유지', 3, 'Y', 'N', 'SYSTEM', 'SYSTEM');


-- ==========================================================================================
-- 운항 상태 코드 (FLT_STTS)
-- ATF_FLT_SCHDL.FLT_STTS_CD 에서 참조
-- 상태 전이 순서: SCHEDULED → DELAYED(선택) → DEPARTED → ARRIVED
--                SCHEDULED / DELAYED → CANCELLED
-- ==========================================================================================

-- 그룹 최상위 코드
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'FLT_STTS', '운항상태', 'Flight Status', '항공편 운항 단계별 상태 코드', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 운항예정 : 정상 스케줄 상태 (초기값)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('FLT_STTS', 'SCHEDULED', '운항예정', 'Scheduled', '정상 스케줄대로 운항 예정인 상태. 기본값', 1, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 지연 : 출발 시각이 예정보다 늦어진 상태. ATF_FLT_SCHDL_CHG_HSTRY 이력 생성 필요
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('FLT_STTS', 'DELAYED', '지연', 'Delayed', '출발 또는 도착이 예정 시각보다 지연된 상태. 변경이력 기록 필요', 2, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 출발완료 : 게이트 출발 후 비행 중
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('FLT_STTS', 'DEPARTED', '출발완료', 'Departed', '공항 게이트를 출발하여 운항 중인 상태', 3, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 도착완료 : 목적지 공항 도착 확정
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('FLT_STTS', 'ARRIVED', '도착완료', 'Arrived', '목적지 공항 도착이 확정된 최종 상태', 4, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 취소 : 해당 편 운항 취소
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('FLT_STTS', 'CANCELLED', '취소', 'Cancelled', '해당 항공편 운항이 취소된 상태. 변경이력 기록 필요', 5, 'Y', 'N', 'SYSTEM', 'SYSTEM');


-- ==========================================================================================
-- 스케줄 변경 사유 코드 (CHG_RSN)
-- ATF_FLT_SCHDL_CHG_HSTRY.CHG_RSN_CD 에서 참조
-- ==========================================================================================

-- 그룹 최상위 코드
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'CHG_RSN', '변경사유', 'Change Reason', '항공스케줄 변경 사유 분류 코드', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 기상 : 기상 악화 (태풍, 폭설, 강풍 등)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CHG_RSN', 'WEATHER', '기상', 'Weather', '태풍·폭설·강풍 등 기상 악화로 인한 스케줄 변경', 1, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 기체결함 : 항공기 기계적·전기적 결함
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CHG_RSN', 'MECHANICAL', '기체결함', 'Mechanical', '항공기 기계적·전기적 결함으로 인한 정비 및 스케줄 변경', 2, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 관제지시 : 항공교통관제(ATC) 지시
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CHG_RSN', 'ATC', '관제지시', 'Air Traffic Control', '항공교통관제(ATC) 슬롯 제한·공역 통제로 인한 변경', 3, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 승무원 : 승무원 결원, 법정 휴식 시간 초과 등
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CHG_RSN', 'CREW', '승무원', 'Crew', '승무원 결원·법정 휴식 시간 초과 등 운항승무원 관련 사유', 4, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- 기타 : 위 분류에 해당하지 않는 사유
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CHG_RSN', 'OTHER', '기타', 'Other', '위 분류 코드에 해당하지 않는 기타 변경 사유. RMRK(비고) 란에 상세 내용 기록 권장', 5, 'Y', 'N', 'SYSTEM', 'SYSTEM');
