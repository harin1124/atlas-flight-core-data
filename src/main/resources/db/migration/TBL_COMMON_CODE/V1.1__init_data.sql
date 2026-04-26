-- ==========================================================================================
-- 공통 코드 - 대륙/지역 코드 (REGION)
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'REGION', '대륙/지역', 'Region', '공항 및 노선 검색 필터용 대륙/지역 분류 코드', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('REGION', 'AS', '아시아', 'Asia', '동아시아, 동남아시아, 남아시아 포함', 1, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('REGION', 'ME', '중동', 'Middle East', '아랍에미리트, 카타르, 사우디아라비아 등', 2, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('REGION', 'EU', '유럽', 'Europe', '서유럽, 동유럽, 북유럽 포함', 3, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('REGION', 'NA', '북미', 'North America', '미국, 캐나다, 멕시코 포함', 4, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('REGION', 'SA', '남미', 'South America', '브라질, 아르헨티나 등', 5, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('REGION', 'AF', '아프리카', 'Africa', '북아프리카, 사하라 이남 포함', 6, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('REGION', 'OC', '오세아니아', 'Oceania', '호주, 뉴질랜드, 태평양 도서국 포함', 7, 'Y', 'N', 'SYSTEM', 'SYSTEM');



-- ==========================================================================================
-- 공통 코드 - 도시 코드 (CITY)
-- ==========================================================================================
-- UP_CD = 'CITY' : 도시 코드 그룹 최상위
-- CD    = IATA City Code (3자리, 공항 IATA 코드와 다를 수 있음)
--         예) 서울(SEL) → ICN(인천), GMP(김포) 두 공항 포함
--             도쿄(TYO) → NRT(나리타), HND(하네다) 두 공항 포함
-- DESCRIPTION : 해당 도시에 속한 주요 공항 IATA 코드 명시
-- ==========================================================================================

-- 그룹 최상위 코드 (ROOT 역할)
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('ROOT', 'CITY', '도시코드', 'City Code', 'IATA 도시 코드 그룹', 0, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 아시아 - 한국
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SEL', '서울', 'Seoul', 'ICN(인천국제공항), GMP(김포국제공항)', 10, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'PUS', '부산', 'Busan', 'PUS(김해국제공항)', 20, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'CJU', '제주', 'Jeju', 'CJU(제주국제공항)', 30, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'TAE', '대구', 'Daegu', 'TAE(대구국제공항)', 40, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'CJJ', '청주', 'Cheongju', 'CJJ(청주국제공항)', 50, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 아시아 - 일본
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'TYO', '도쿄', 'Tokyo', 'NRT(나리타국제공항), HND(하네다국제공항)', 110, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'OSA', '오사카', 'Osaka', 'KIX(간사이국제공항), ITM(이타미공항)', 120, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SPK', '삿포로', 'Sapporo', 'CTS(신치토세공항)', 130, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'FUK', '후쿠오카', 'Fukuoka', 'FUK(후쿠오카공항)', 140, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'NGO', '나고야', 'Nagoya', 'NGO(주부국제공항)', 150, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'OKA', '오키나와', 'Okinawa', 'OKA(나하공항)', 160, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 아시아 - 중국
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'BJS', '베이징', 'Beijing', 'PEK(수도국제공항), PKX(다싱국제공항)', 210, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SHA', '상하이', 'Shanghai', 'PVG(푸둥국제공항), SHA(훙차오국제공항)', 220, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'CAN', '광저우', 'Guangzhou', 'CAN(바이윈국제공항)', 230, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SZX', '선전', 'Shenzhen', 'SZX(바오안국제공항)', 240, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'CTU', '청두', 'Chengdu', 'CTU(솽류국제공항)', 250, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 아시아 - 동남아
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'BKK', '방콕', 'Bangkok', 'BKK(수완나품국제공항), DMK(돈므앙국제공항)', 310, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SIN', '싱가포르', 'Singapore', 'SIN(창이국제공항)', 320, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'KUL', '쿠알라룸푸르', 'Kuala Lumpur', 'KUL(쿠알라룸푸르국제공항)', 330, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'MNL', '마닐라', 'Manila', 'MNL(니노이아키노국제공항)', 340, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SGN', '호치민', 'Ho Chi Minh City', 'SGN(떤선녓국제공항)', 350, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'HAN', '하노이', 'Hanoi', 'HAN(노이바이국제공항)', 360, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'CGK', '자카르타', 'Jakarta', 'CGK(수카르노하타국제공항)', 370, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'DPS', '발리', 'Bali', 'DPS(응우라라이국제공항)', 380, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 아시아 - 기타
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'HKG', '홍콩', 'Hong Kong', 'HKG(홍콩국제공항)', 410, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'TPE', '타이페이', 'Taipei', 'TPE(타오위안국제공항), TSA(쑹산공항)', 420, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'DEL', '뉴델리', 'New Delhi', 'DEL(인디라간디국제공항)', 430, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'BOM', '뭄바이', 'Mumbai', 'BOM(차트라파티시바지국제공항)', 440, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'DXB', '두바이', 'Dubai', 'DXB(두바이국제공항)', 450, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'DOH', '도하', 'Doha', 'DOH(하마드국제공항)', 460, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'IST', '이스탄불', 'Istanbul', 'IST(이스탄불국제공항)', 470, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 오세아니아
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SYD', '시드니', 'Sydney', 'SYD(킹스퍼드스미스국제공항)', 510, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'MEL', '멜버른', 'Melbourne', 'MEL(멜버른국제공항)', 520, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'AKL', '오클랜드', 'Auckland', 'AKL(오클랜드국제공항)', 530, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 유럽
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'LON', '런던', 'London', 'LHR(히스로국제공항), LGW(개트윅공항)', 610, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'PAR', '파리', 'Paris', 'CDG(샤를드골국제공항), ORY(오를리공항)', 620, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'FRA', '프랑크푸르트', 'Frankfurt', 'FRA(프랑크푸르트국제공항)', 630, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'AMS', '암스테르담', 'Amsterdam', 'AMS(스키폴국제공항)', 640, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'ROM', '로마', 'Rome', 'FCO(피우미치노국제공항)', 650, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'MAD', '마드리드', 'Madrid', 'MAD(아돌포수아레스국제공항)', 660, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'BCN', '바르셀로나', 'Barcelona', 'BCN(엘프라트국제공항)', 670, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'ZRH', '취리히', 'Zurich', 'ZRH(취리히국제공항)', 680, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'VIE', '빈', 'Vienna', 'VIE(빈국제공항)', 690, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'MOW', '모스크바', 'Moscow', 'SVO(셰레메티예보국제공항), DME(도모데도보국제공항)', 700, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 북미
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'NYC', '뉴욕', 'New York', 'JFK(존에프케네디국제공항), LGA(라과디아공항), EWR(뉴어크공항)', 810, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'LAX', '로스앤젤레스', 'Los Angeles', 'LAX(로스앤젤레스국제공항)', 820, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'CHI', '시카고', 'Chicago', 'ORD(오헤어국제공항), MDW(미드웨이공항)', 830, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SFO', '샌프란시스코', 'San Francisco', 'SFO(샌프란시스코국제공항)', 840, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'WAS', '워싱턴', 'Washington D.C.', 'IAD(덜레스국제공항), DCA(레이건국제공항)', 850, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'YTO', '토론토', 'Toronto', 'YYZ(피어슨국제공항)', 860, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'YVR', '밴쿠버', 'Vancouver', 'YVR(밴쿠버국제공항)', 870, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 중남미
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'SAO', '상파울루', 'Sao Paulo', 'GRU(과룰류스국제공항)', 910, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'MEX', '멕시코시티', 'Mexico City', 'MEX(베니토후아레스국제공항)', 920, 'Y', 'N', 'SYSTEM', 'SYSTEM');

-- ==========================================================================================
-- 아프리카
-- ==========================================================================================
INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'CAI', '카이로', 'Cairo', 'CAI(카이로국제공항)', 1010, 'Y', 'N', 'SYSTEM', 'SYSTEM');

INSERT INTO TBL_COMMON_CODE (UP_CD, CD, CD_KOR_NM, CD_ENG_NM, DESCRIPTION, SORT_ORDER, USE_YN, DEL_YN, RGTR_ID, MDFR_ID)
VALUES ('CITY', 'JNB', '요하네스버그', 'Johannesburg', 'JNB(OR탐보국제공항)', 1020, 'Y', 'N', 'SYSTEM', 'SYSTEM');