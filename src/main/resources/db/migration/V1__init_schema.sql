# ==========================================================================================
# 공통 코드 테이블
# ==========================================================================================

# 재귀 자기참조 구조. UP_ID가 ROOT면 최상위 그룹

# 테이블 생성
CREATE TABLE TBL_COMMON_CODE (
    UP_CD        VARCHAR(10)                                NOT NULL COMMENT '상위_코드',
    CD           VARCHAR(10)                                NOT NULL COMMENT '코드',
    CD_KOR_NM    VARCHAR(50)                                NOT NULL COMMENT '코드_한국어_이름',
    CD_ENG_NM    VARCHAR(100)                                        COMMENT '코드_영문_이름',
    DESCRIPTION  VARCHAR(300)                                        COMMENT '설명',
    SORT_ORDER   INT          DEFAULT 0                     NOT NULL COMMENT '정렬_순서',
    USE_YN       CHAR(1)      DEFAULT 'Y'                   NOT NULL COMMENT '사용_여부',
    DEL_YN       CHAR(1)      DEFAULT 'N'                   NOT NULL COMMENT '삭제_여부',
    REG_DT       DATETIME     DEFAULT CURRENT_TIMESTAMP()   NOT NULL COMMENT '등록_일시',
    RGTR_ID      VARCHAR(30)                                NOT NULL COMMENT '등록자_아이디',
    MDFCN_DT     DATETIME     DEFAULT CURRENT_TIMESTAMP()   NOT NULL COMMENT '수정_일시',
    MDFR_ID      VARCHAR(30)                                NOT NULL COMMENT '수정자_아이디',
    PRIMARY KEY (UP_CD, CD)
) COMMENT '공통_코드' COLLATE = UTF8MB4_UNICODE_CI;


# ==========================================================================================
# 국가 코드 테이블
# ==========================================================================================
/*
COUNTRY_CD: 시스템 전반의 국가 기준 키 (ISO 3166-1 alpha-2)
COUNTRY_CD3: 외부 연동용 (ISO 3166-1 alpha-3)
NATIONALITY / NATIONALITY_EN: 탑승자 국적 선택 드롭다운에 직접 사용
REGION: 공항&노선 검색 필터 분류용 (예: Asia, Europe, North America)
*/

# 테이블 생성
CREATE TABLE TBL_COUNTRY (
    ID                  BIGINT       AUTO_INCREMENT                      NOT NULL COMMENT '아이디' PRIMARY KEY,
    COUNTRY_CD          CHAR(2)                                          NOT NULL COMMENT '국가_코드_alpha2',
    COUNTRY_CD3         CHAR(3)                                          NOT NULL COMMENT '국가_코드_alpha3',
    COUNTRY_KOR_NM      VARCHAR(100)                                     NOT NULL COMMENT '국가_한국어_이름',
    COUNTRY_ENG_NM      VARCHAR(100)                                     NOT NULL COMMENT '국가_영어_이름',
    NATIONALITY_KOR_NM  VARCHAR(100)                                              COMMENT '국적_한국어_이름',
    NATIONALITY_ENG_NM  VARCHAR(100)                                              COMMENT '국적_영어_이름',
    REGION_CD           VARCHAR(10)                                               COMMENT '대륙_코드',
    USE_YN              CHAR(1)      DEFAULT 'Y'                         NOT NULL COMMENT '사용_여부',
    REG_DT              DATETIME     DEFAULT CURRENT_TIMESTAMP()         NOT NULL COMMENT '등록_일시',
    RGTR_ID             VARCHAR(30)                                      NOT NULL COMMENT '등록자_아이디',
    MDFCN_DT            DATETIME     DEFAULT CURRENT_TIMESTAMP()         NOT NULL COMMENT '수정_일시',
    MDFR_ID             VARCHAR(30)                                      NOT NULL COMMENT '수정자_아이디'
) COMMENT '국가_코드' COLLATE = UTF8MB4_UNICODE_CI;

# 인덱스
ALTER TABLE TBL_COUNTRY ADD UNIQUE INDEX UQ_COUNTRY_COUNTRY_CD (COUNTRY_CD);
ALTER TABLE TBL_COUNTRY ADD UNIQUE INDEX UQ_COUNTRY_COUNTRY_CD3 (COUNTRY_CD3);



# ==========================================================================================
# 언어 코드 테이블
# ==========================================================================================
/*
LANGUAGE_CD: UI 언어 설정 기준 키 (ISO 639-1)
LANGUAGE_CD3: 외부 연동용 (ISO 639-2)
RTL_YN: Y이면 아랍어, 히브리어 등 우->좌 방향. UI 렌더링 방향 분기 처리 필요
*/

# 테이블 생성
CREATE TABLE TBL_LANGUAGE (
    ID                BIGINT       AUTO_INCREMENT                      NOT NULL COMMENT '아이디' PRIMARY KEY,
    LANGUAGE_CD       CHAR(2)                                          NOT NULL COMMENT '언어_코드_639-1',
    LANGUAGE_CD3      CHAR(3)                                                   COMMENT '언어_코드_639-2',
    LANGUAGE_KOR_NAME VARCHAR(100)                                     NOT NULL COMMENT '언어_한국어_이름',
    LANGUAGE_ENG_NAME VARCHAR(100)                                     NOT NULL COMMENT '언어_영어_이름',
    RTL_YN            CHAR(1)      DEFAULT 'N'                         NOT NULL COMMENT '우좌쓰기_여부',
    USE_YN            CHAR(1)      DEFAULT 'Y'                         NOT NULL COMMENT '사용_여부',
    REG_DT            DATETIME     DEFAULT CURRENT_TIMESTAMP()         NOT NULL COMMENT '등록_일시',
    RGTR_ID           VARCHAR(30)                                      NOT NULL COMMENT '등록자_아이디',
    MDFCN_DT          DATETIME     DEFAULT CURRENT_TIMESTAMP()         NOT NULL COMMENT '수정_일시',
    MDFR_ID           VARCHAR(30)                                      NOT NULL COMMENT '수정자_아이디'
) COMMENT '언어_코드' COLLATE = UTF8MB4_UNICODE_CI;

# 인덱스
ALTER TABLE TBL_LANGUAGE ADD UNIQUE INDEX UQ_LANGUAGE_LANGUAGE_CD (LANGUAGE_CD);
ALTER TABLE TBL_LANGUAGE ADD UNIQUE INDEX UQ_LANGUAGE_LANGUAGE_CD3 (LANGUAGE_CD3);


# ==========================================================================================
# 국가-언어 매핑 테이블
# ==========================================================================================
/*
OFFICIAL_YN  : 법적 공용어 여부 (Y/N)
               예) 스위스 : 독일어, 프랑스어, 이탈리아어, 로만슈어 모두 Y
PRIMARY_YN   : 실질 주요 사용 언어 여부 (Y/N). OFFICIAL_YN과 별개로 관리.
               예) 인도 : 공용어는 힌디어&영어지만, 벵골어&텔루구어 등
                   지역 주요 언어는 OFFICIAL_YN=N / PRIMARY_YN=Y 로 구분
SORT_ORDER   : 해당 국가 내 언어 표시 순서 제어
               예) 한국 : 한국어(1), 영어(2) 순으로 드롭다운 노출
DEL_YN       : 논리 삭제 여부. 기존 TBL_COUNTRY / TBL_LANGUAGE 컨벤션 맞춤.
               국가-언어 관계가 실제로 사라지진 않으므로 물리 삭제 대신 사용.
*/
CREATE TABLE TBL_COUNTRY_LANGUAGE (
    ID          BIGINT       AUTO_INCREMENT                   NOT NULL COMMENT '아이디' PRIMARY KEY,
    COUNTRY_CD  CHAR(2)                                       NOT NULL COMMENT '국가_코드',
    LANGUAGE_CD CHAR(2)                                       NOT NULL COMMENT '언어_코드',
    OFFICIAL_YN CHAR(1)      DEFAULT 'N'                      NOT NULL COMMENT '공식_여부',
    PRIMARY_YN  CHAR(1)      DEFAULT 'N'                      NOT NULL COMMENT '주요_여부',
    SORT_ORDER  INT          DEFAULT 0                        NOT NULL COMMENT '정렬_순서',
    DEL_YN      CHAR(1)      DEFAULT 'N'                      NOT NULL COMMENT '삭제_여부',
    REG_DT      DATETIME     DEFAULT CURRENT_TIMESTAMP()      NOT NULL COMMENT '등록_일시',
    RGTR_ID     VARCHAR(30)                                   NOT NULL COMMENT '등록자_아이디',
    MDFCN_DT    DATETIME     DEFAULT CURRENT_TIMESTAMP()      NOT NULL COMMENT '수정_일시',
    MDFR_ID     VARCHAR(30)                                   NOT NULL COMMENT '수정자_아이디'
) COMMENT '국가_언어_매핑' COLLATE = UTF8MB4_UNICODE_CI;

/*
인덱스
- COUNTRY_CD + LANGUAGE_CD 조합이 실질 복합 식별자이므로 UNIQUE
- DEL_YN 조건 조회 빈도가 높으므로 조회용 인덱스 추가
*/
ALTER TABLE TBL_COUNTRY_LANGUAGE ADD UNIQUE INDEX UQ_COUNTRY_LANGUAGE (COUNTRY_CD, LANGUAGE_CD);
ALTER TABLE TBL_COUNTRY_LANGUAGE ADD INDEX IDX_COUNTRY_LANGUAGE_COUNTRY_CD (COUNTRY_CD);

/*
FK 설정
- TBL_COUNTRY / TBL_LANGUAGE 모두 COUNTRY_CD / LANGUAGE_CD 에 UNIQUE 인덱스 존재
→ PK(ID)가 아닌 코드값으로 FK 연결 가능하며, 코드 기반 참조가 의미상 더 명확
*/
ALTER TABLE TBL_COUNTRY_LANGUAGE ADD CONSTRAINT FK_COUNTRY_LANGUAGE_COUNTRY FOREIGN KEY (COUNTRY_CD) REFERENCES TBL_COUNTRY (COUNTRY_CD);
ALTER TABLE TBL_COUNTRY_LANGUAGE ADD CONSTRAINT FK_COUNTRY_LANGUAGE_LANGUAGE FOREIGN KEY (LANGUAGE_CD) REFERENCES TBL_LANGUAGE (LANGUAGE_CD);


# =============================================
# 공항 코드 테이블
# =============================================

# IATA_CODE: 항공권&예약 시스템 기준 키 (예: ICN, GMP, NRT)
# ICAO_CODE: 운항 스케줄 외부 연동 시 사용 (예: RKSI, RKSS, RJTT)
# TIMEZONE: IANA 타임존 식별자 기준 (예: Asia/Seoul, America/New_York)
# LATITUDE / LONGITUDE: WGS84 기준

/*
공항 유형 코드 (AIRPORT_TYPE_CD)
(D:국내선, I:국제선, B:복합)
*/

/*
공항_상태_코드 (AIRPORT_STAT_CD)
-- OP : 운영중 (Operational)
-- CL : 영구폐쇄 (Closed)
-- TC : 임시폐쇄 (Temporarily Closed)
-- CN : 공사중 (Under Construction)
*/
# 테이블 생성
CREATE TABLE TBL_AIRPORT
(
    ID              BIGINT        AUTO_INCREMENT                NOT NULL COMMENT '아이디' PRIMARY KEY,
    IATA_CD         CHAR(3)                                     NOT NULL COMMENT 'IATA_코드',
    ICAO_CD         CHAR(4)                                              COMMENT 'ICAO_코드',
    AIRPORT_KOR_NM  VARCHAR(100)                                NOT NULL COMMENT '공항_한국어_이름',
    AIRPORT_ENG_NM  VARCHAR(100)                                NOT NULL COMMENT '공항_영어_이름',
    AIRPORT_NAT_NM  VARCHAR(100)                                         COMMENT '공항_현지어_이름',
    COUNTRY_CD      CHAR(2)                                     NOT NULL COMMENT '국가_코드',
    CITY_CD         VARCHAR(10)                                          COMMENT '도시_코드',
    LATITUDE        DECIMAL(9,6)                                         COMMENT '위도',
    LONGITUDE       DECIMAL(9,6)                                         COMMENT '경도',
    TIMEZONE        VARCHAR(50)                                          COMMENT '타임존',
    AIRPORT_TYPE_CD VARCHAR(10)                                 NOT NULL COMMENT '공항_유형_코드',
    AIRPORT_STAT_CD VARCHAR(10)                                 NOT NULL COMMENT '공항_상태_코드',
    USE_YN          CHAR(1)       DEFAULT 'Y'                   NOT NULL COMMENT '사용_여부',
    REG_DT          DATETIME      DEFAULT CURRENT_TIMESTAMP()   NOT NULL COMMENT '등록_일시',
    RGTR_ID         VARCHAR(30)                                 NOT NULL COMMENT '등록자_아이디',
    MDFCN_DT        DATETIME      DEFAULT CURRENT_TIMESTAMP()   NOT NULL COMMENT '수정_일시',
    MDFR_ID         VARCHAR(30)                                 NOT NULL COMMENT '수정자_아이디'
) COMMENT '공항_코드' COLLATE = UTF8MB4_UNICODE_CI;

# 인덱스
ALTER TABLE TBL_AIRPORT ADD UNIQUE INDEX UQ_AIRPORT_IATA_CODE (IATA_CD);
ALTER TABLE TBL_AIRPORT ADD UNIQUE INDEX UQ_AIRPORT_ICAO_CODE (ICAO_CD);
ALTER TABLE TBL_AIRPORT ADD INDEX IDX_AIRPORT_COUNTRY_CD (COUNTRY_CD);

# FK 설정
ALTER TABLE TBL_AIRPORT ADD CONSTRAINT FK_AIRPORT_COUNTRY FOREIGN KEY (COUNTRY_CD) REFERENCES TBL_COUNTRY (COUNTRY_CD);



# =============================================
# 전화 코드 테이블
# =============================================

# PHONE_CODE: ITU-T E.164 기준. '+' 제외 숫자만 저장 (예: 82, 1, 44)
# COUNTRY_CODE와 1:1 관계가 아님. +1은 미국&캐나다 등 복수 국가가 공유
# SORT_ORDER: 자주 쓰는 국가를 상단 고정할 때 활용

# 테이블 생성
CREATE TABLE TBL_PHONE (
    ID              BIGINT       AUTO_INCREMENT              NOT NULL COMMENT '아이디' PRIMARY KEY,
    COUNTRY_CD      CHAR(2)                                  NOT NULL COMMENT '국가_코드',
    PHONE_CD        VARCHAR(10)                              NOT NULL COMMENT '전화_코드',
    USE_YN          CHAR(1)      DEFAULT 'Y'                 NOT NULL COMMENT '사용_여부',
    SORT_ORDER      INT          DEFAULT 0                   NOT NULL COMMENT '정렬_순서',
    REG_DT          DATETIME     DEFAULT CURRENT_TIMESTAMP() NOT NULL COMMENT '등록_일시',
    RGTR_ID         VARCHAR(30)                              NOT NULL COMMENT '등록자_아이디',
    MDFCN_DT        DATETIME     DEFAULT CURRENT_TIMESTAMP() NOT NULL COMMENT '수정_일시',
    MDFR_ID         VARCHAR(30)                              NOT NULL COMMENT '수정자_아이디'
) COMMENT '전화번호_코드' COLLATE = UTF8MB4_UNICODE_CI;

# FK 설정
ALTER TABLE TBL_PHONE ADD CONSTRAINT FK_PHONE_CD_COUNTRY FOREIGN KEY (COUNTRY_CD) REFERENCES TBL_COUNTRY (COUNTRY_CD);