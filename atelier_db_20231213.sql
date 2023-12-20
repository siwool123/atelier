--------------------------------------------------------
--  파일이 생성됨 - 수요일-12월-13-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_APPLY
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_APPLY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ARTIST
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_ARTIST"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_AUCTION1
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_AUCTION1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_AUCTION2
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_AUCTION2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CART
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_CART"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 43 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FAQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_FAQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MEMBER
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_MEMBER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NOTICE
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_NOTICE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDER1
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_ORDER1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDER2
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_ORDER2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_POINT
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_POINT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 18 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCT
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_PRODUCT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_P_LIKE
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_P_LIKE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 19 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REVIEW
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_REVIEW"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SHIPMENT
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_SHIPMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SUBSCRIBE
--------------------------------------------------------

   CREATE SEQUENCE  "ATELIER"."SEQ_SUBSCRIBE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table APPLY
--------------------------------------------------------

  CREATE TABLE "ATELIER"."APPLY" 
   (	"APPLY_IDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0), 
	"APPLY_DATE" DATE DEFAULT sysdate, 
	"PASS" NUMBER(1,0), 
	"APPLY1" VARCHAR2(100 BYTE), 
	"APPLY2" VARCHAR2(100 BYTE), 
	"APPLY3" VARCHAR2(100 BYTE), 
	"APPLY4" VARCHAR2(100 BYTE), 
	"APPLY5" VARCHAR2(100 BYTE), 
	"APPLY6" VARCHAR2(100 BYTE), 
	"APPLY7" VARCHAR2(100 BYTE), 
	"APPLY8" VARCHAR2(100 BYTE), 
	"APPLY9" VARCHAR2(100 BYTE), 
	"APPLY10" VARCHAR2(100 BYTE), 
	"A_INTRO" VARCHAR2(2000 BYTE), 
	"A_HISTORY" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."APPLY"."PASS" IS '합격여부 (합격은1, 불합격0, 심사중:null)';
--------------------------------------------------------
--  DDL for Table ARTIST
--------------------------------------------------------

  CREATE TABLE "ATELIER"."ARTIST" 
   (	"AIDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"PROFILES" VARCHAR2(100 BYTE), 
	"A_INTRO" VARCHAR2(2000 BYTE), 
	"A_HISTORY" VARCHAR2(2000 BYTE), 
	"SUBSCRIBER" NUMBER(6,0) DEFAULT 0, 
	"REGIDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AUCTION1
--------------------------------------------------------

  CREATE TABLE "ATELIER"."AUCTION1" 
   (	"AUC_IDX" NUMBER(6,0), 
	"PIDX" NUMBER(6,0), 
	"AIDX" NUMBER(6,0), 
	"STARTDATE" DATE DEFAULT sysdate, 
	"ENDDATE" DATE, 
	"START_PRICE" NUMBER(12,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AUCTION2
--------------------------------------------------------

  CREATE TABLE "ATELIER"."AUCTION2" 
   (	"BID_IDX" NUMBER(6,0), 
	"AUC_IDX" NUMBER(6,0), 
	"PIDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0), 
	"APRICE" NUMBER(12,0), 
	"AUCDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "ATELIER"."CART" 
   (	"CIDX" NUMBER(6,0), 
	"PIDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FAQ
--------------------------------------------------------

  CREATE TABLE "ATELIER"."FAQ" 
   (	"FAQ_IDX" NUMBER(6,0), 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"MIDX" NUMBER(6,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "ATELIER"."MEMBER" 
   (	"ID" VARCHAR2(50 BYTE), 
	"PASS" VARCHAR2(200 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"ZIP" VARCHAR2(10 BYTE), 
	"ADDR1" VARCHAR2(100 BYTE), 
	"ADDR2" VARCHAR2(50 BYTE), 
	"MIDX" NUMBER(6,0), 
	"REGIDATE" DATE DEFAULT sysdate, 
	"LEAVEDATE" DATE DEFAULT NULL, 
	"PROFILES" VARCHAR2(100 BYTE), 
	"PLACES" VARCHAR2(100 BYTE), 
	"TOTAL_POINT" NUMBER(6,0) DEFAULT 0, 
	"TOKEN" VARCHAR2(200 BYTE), 
	"ENABLED" NUMBER(1,0) DEFAULT 1, 
	"AUTHORITY" VARCHAR2(20 BYTE) DEFAULT 'ROLE_USER'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."MEMBER"."TOKEN" IS '앱설치시발행되는 토큰';
   COMMENT ON COLUMN "ATELIER"."MEMBER"."ENABLED" IS '0이면로그인안됨';
--------------------------------------------------------
--  DDL for Table M_POINT
--------------------------------------------------------

  CREATE TABLE "ATELIER"."M_POINT" 
   (	"POINT_IDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0), 
	"ADD_POINT" NUMBER, 
	"POINT_DATE" DATE DEFAULT sysdate, 
	"OIDX" VARCHAR2(20 BYTE), 
	"MINUS_POINT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."M_POINT"."ADD_POINT" IS '+100 -100 처럼 사용/적립구분하도록';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "ATELIER"."NOTICE" 
   (	"BIDX" NUMBER(6,0), 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"SFILE1" VARCHAR2(100 BYTE), 
	"SFILE2" VARCHAR2(100 BYTE), 
	"SFILE3" VARCHAR2(100 BYTE), 
	"MIDX" NUMBER(6,0), 
	"POSTDATE" DATE DEFAULT sysdate, 
	"VISITCOUNT" NUMBER(6,0) DEFAULT 0, 
	"B_LIKE" NUMBER(6,0) DEFAULT 0, 
	"NOTICE" NUMBER(1,0) DEFAULT 0
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."NOTICE"."NOTICE" IS '공지여부 (공지글 : 1, 일반글 : 0)';
--------------------------------------------------------
--  DDL for Table N_COMMENT
--------------------------------------------------------

  CREATE TABLE "ATELIER"."N_COMMENT" 
   (	"CIDX" NUMBER(6,0), 
	"BIDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0), 
	"C_DATE" DATE DEFAULT sysdate, 
	"C_CONTENT" VARCHAR2(1000 BYTE), 
	"C_LIKE" NUMBER(6,0) DEFAULT 0, 
	"SFILE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDER1
--------------------------------------------------------

  CREATE TABLE "ATELIER"."ORDER1" 
   (	"OIDX" VARCHAR2(20 BYTE), 
	"MIDX" NUMBER(6,0), 
	"PAYMETHOD" VARCHAR2(20 BYTE), 
	"PRICE" NUMBER(12,0), 
	"ORDERDATE" DATE DEFAULT sysdate, 
	"PAYDATE" DATE, 
	"RECEIVER" VARCHAR2(30 BYTE), 
	"R_PHONE" VARCHAR2(30 BYTE), 
	"R_ADDRESS" VARCHAR2(100 BYTE), 
	"MESSAGE" VARCHAR2(100 BYTE), 
	"SHIPDATE" DATE, 
	"COURIER" VARCHAR2(20 BYTE), 
	"T_NUM" VARCHAR2(20 BYTE), 
	"OWNER" VARCHAR2(20 BYTE), 
	"APINUM" VARCHAR2(50 BYTE), 
	"AUCTION" NUMBER(1,0) DEFAULT 0, 
	"PIDX" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."ORDER1"."PAYMETHOD" IS '(무통장입금:''bank'', 카카오페이:''kakao'', 토스페이먼트:''toss'')';
   COMMENT ON COLUMN "ATELIER"."ORDER1"."PAYDATE" IS '결제일 (입금완료일)';
   COMMENT ON COLUMN "ATELIER"."ORDER1"."COURIER" IS '택배사';
   COMMENT ON COLUMN "ATELIER"."ORDER1"."T_NUM" IS '운송장번호';
   COMMENT ON COLUMN "ATELIER"."ORDER1"."OWNER" IS '입금시예금주명';
   COMMENT ON COLUMN "ATELIER"."ORDER1"."APINUM" IS 'api결제승인번호
';
   COMMENT ON COLUMN "ATELIER"."ORDER1"."AUCTION" IS '경매결제건은 1, 일반은 0';
   COMMENT ON COLUMN "ATELIER"."ORDER1"."PIDX" IS '주문에포함된작품(,로연결)
';
--------------------------------------------------------
--  DDL for Table ORDER2
--------------------------------------------------------

  CREATE TABLE "ATELIER"."ORDER2" 
   (	"O2IDX" NUMBER(6,0), 
	"OIDX" VARCHAR2(20 BYTE), 
	"PIDX" NUMBER(6,0), 
	"AIDX" NUMBER(6,0), 
	"PRICE" NUMBER(20,0), 
	"MIDX" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PAYMENT
--------------------------------------------------------

  CREATE TABLE "ATELIER"."PAYMENT" 
   (	"PAYMENTCODE" VARCHAR2(100 BYTE), 
	"PAYMENTGROUPCODE" VARCHAR2(100 BYTE), 
	"MEMBEREMAIL" VARCHAR2(100 BYTE), 
	"PAYMENTMETHODCODE" VARCHAR2(100 BYTE), 
	"PAYMENTMETHODNAME" VARCHAR2(100 BYTE), 
	"PAYMENTTOTALORDERPRICE" NUMBER, 
	"PAYMENTUSEPOINT" NUMBER, 
	"PAYMENTTOTALPAYPRICE" NUMBER, 
	"PAYMENTSTATE" VARCHAR2(100 BYTE), 
	"PAYMENTREGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "ATELIER"."PRODUCT" 
   (	"TITLE" VARCHAR2(50 BYTE), 
	"PIDX" NUMBER(6,0), 
	"AIDX" NUMBER(6,0), 
	"AUCTION" NUMBER(1,0) DEFAULT 0, 
	"SIZE2" NUMBER(6,0), 
	"SIZE1" NUMBER(6,0), 
	"THEME" VARCHAR2(30 BYTE), 
	"P_TYPE" VARCHAR2(30 BYTE), 
	"P_LIKE" NUMBER(6,0) DEFAULT 0, 
	"PRICE" NUMBER(20,0), 
	"P_INTRO" VARCHAR2(2000 BYTE), 
	"FRAMED" NUMBER(1,0) DEFAULT 1, 
	"REGIDATE" DATE DEFAULT sysdate, 
	"SFILE" VARCHAR2(100 BYTE), 
	"SOLD" NUMBER(1,0) DEFAULT 0, 
	"MIDX" NUMBER(6,0), 
	"M_NAME" VARCHAR2(30 BYTE), 
	"MATERIAL" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."PRODUCT"."AUCTION" IS '경매 : 1, 일반판매 : 0';
   COMMENT ON COLUMN "ATELIER"."PRODUCT"."SIZE1" IS '0-15_XS, 15-25_S, 25-50_M, 50-100_L, 100-_XL';
   COMMENT ON COLUMN "ATELIER"."PRODUCT"."THEME" IS '자연/풍경, 인물, 동식물, 사물, 추상, 기타';
   COMMENT ON COLUMN "ATELIER"."PRODUCT"."P_TYPE" IS '아크릴, 유화, 수채화, 수묵화, 스케치, 
나무에 스케치, 나무에 과슈, 혼합/기타';
   COMMENT ON COLUMN "ATELIER"."PRODUCT"."P_LIKE" IS 'LIKE 테이블에서 MIDX 갯수와 일치해야함';
   COMMENT ON COLUMN "ATELIER"."PRODUCT"."FRAMED" IS '프레임 유무 (유 : 1, 무 : 0)';
   COMMENT ON COLUMN "ATELIER"."PRODUCT"."SOLD" IS '판매완료 : 1, 판매중 : 0';
--------------------------------------------------------
--  DDL for Table P_LIKE
--------------------------------------------------------

  CREATE TABLE "ATELIER"."P_LIKE" 
   (	"LIDX" NUMBER(6,0), 
	"PIDX" NUMBER(6,0), 
	"AIDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "ATELIER"."REVIEW" 
   (	"RIDX" NUMBER(6,0), 
	"PIDX" NUMBER(6,0), 
	"AIDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0), 
	"R_DATE" DATE DEFAULT sysdate, 
	"R_CONTENT" VARCHAR2(1000 BYTE), 
	"R_LIKE" NUMBER(6,0), 
	"STAR" NUMBER(1,0), 
	"SFILE1" VARCHAR2(100 BYTE), 
	"SFILE2" VARCHAR2(100 BYTE), 
	"SFILE3" VARCHAR2(100 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"PSFILE" VARCHAR2(100 BYTE), 
	"TITLE" VARCHAR2(100 BYTE), 
	"A_NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."REVIEW"."STAR" IS '별점 (1점 단위로 소수점불가, 최소1~최대5)';
   COMMENT ON COLUMN "ATELIER"."REVIEW"."PSFILE" IS '작품이미지파일명';
   COMMENT ON COLUMN "ATELIER"."REVIEW"."TITLE" IS '작품명';
   COMMENT ON COLUMN "ATELIER"."REVIEW"."A_NAME" IS '작품작가명';
--------------------------------------------------------
--  DDL for Table SHIPMENT
--------------------------------------------------------

  CREATE TABLE "ATELIER"."SHIPMENT" 
   (	"SIDX" NUMBER(6,0), 
	"OIDX" VARCHAR2(20 BYTE), 
	"PAYMENTMETHOD" NUMBER(1,0), 
	"WIRED" NUMBER(1,0), 
	"SHIPPED" NUMBER(1,0), 
	"SHIPDATE" DATE DEFAULT sysdate, 
	"COURIER" VARCHAR2(50 BYTE), 
	"T_NUM" VARCHAR2(30 BYTE), 
	"RECEIVER" VARCHAR2(30 BYTE), 
	"R_PHONE" VARCHAR2(30 BYTE), 
	"R_ADDRESS" VARCHAR2(100 BYTE), 
	"MSG" VARCHAR2(40 BYTE), 
	"O2IDX" NUMBER(6,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ATELIER"."SHIPMENT"."WIRED" IS 'PAYMETHOD 값이 1 인경우 입금완료 여부 
(입금완료 1, 입금전 0)';
   COMMENT ON COLUMN "ATELIER"."SHIPMENT"."SHIPPED" IS '발송여부 (발송완료1 , 발송전 0)';
   COMMENT ON COLUMN "ATELIER"."SHIPMENT"."SHIPDATE" IS '발송일시 (YYYY-MM-DD HH:MI:SS)';
--------------------------------------------------------
--  DDL for Table SUBSCRIBE
--------------------------------------------------------

  CREATE TABLE "ATELIER"."SUBSCRIBE" 
   (	"SUB_IDX" NUMBER(6,0), 
	"AIDX" NUMBER(6,0), 
	"MIDX" NUMBER(6,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into ATELIER.APPLY
SET DEFINE OFF;
REM INSERTING into ATELIER.ARTIST
SET DEFINE OFF;
Insert into ATELIER.ARTIST (AIDX,MIDX,M_NAME,PROFILES,A_INTRO,A_HISTORY,SUBSCRIBER,REGIDATE) values (1,1,'강이화',null,'문인화가 송정 입니다.
한번 지나간 붓길은 다시 돌아오지 않는다. 
이는 문인화의 요체입니다. 
다시 돌아오지 않을 시간과 감정들을 길어나르는 작업을 합니다.','
    학력
2015 고려대학교 조형학부 조형예술학과 졸업

개인전
2022  긴 호흡으로  (Gallery hoM)
2021  기억의 간격  (갤러리초연)
2018  흐릿하고 선명한   (아워캔버스)
2017  몇 번의 순간들   (Parking lot project) 

단체전
2021  다시, 기억하기 (아트스페이스 퀄리아)
2021  을지아트페어 (을지트윈타워)
2021  맑음 흐림 그리고 비 (갤러리hoM)
2021  모두에게 멋진 날들 (구로소방서, 서울시 온라인갤러리)
2020 아시아프 (홍익대학교 현대미술관)
2020 한뼘그림 아트페어 (디아트플랜트 요갤러리)
2020 제4회 영 아티스트 (미누현대미술관)
2019  강동예술제 (일자산 잔디광장)
2019  3인 기획전 工事展 (복합문화공간 COSO)
2019  Spare Moment in Art (스페어모먼트 로스터리, 뉴욕)
2018  3인 기획전 도시의 주인들 (어반호스트)
2016  필:동 아트마켓 프로젝트 (Space Art1)
2016  Art Oasis Exhibition  (에이블 파인아트 서울)
2016  아시아프 1 페스티벌 (DDP)

소장        
 2018년 정부미술은행 공모제
 2020년 서울시 작품구입 공모제
    ',0,to_date('23/11/24','RR/MM/DD'));
Insert into ATELIER.ARTIST (AIDX,MIDX,M_NAME,PROFILES,A_INTRO,A_HISTORY,SUBSCRIBER,REGIDATE) values (2,2,'김현아',null,'문인화가 송정 입니다.
한번 지나간 붓길은 다시 돌아오지 않는다. 
이는 문인화의 요체입니다. 
다시 돌아오지 않을 시간과 감정들을 길어나르는 작업을 합니다.','
    학력
2015 고려대학교 조형학부 조형예술학과 졸업

개인전
2022  긴 호흡으로  (Gallery hoM)
2021  기억의 간격  (갤러리초연)
2018  흐릿하고 선명한   (아워캔버스)
2017  몇 번의 순간들   (Parking lot project) 

단체전
2021  다시, 기억하기 (아트스페이스 퀄리아)
2021  을지아트페어 (을지트윈타워)
2021  맑음 흐림 그리고 비 (갤러리hoM)
2021  모두에게 멋진 날들 (구로소방서, 서울시 온라인갤러리)
2020 아시아프 (홍익대학교 현대미술관)
2020 한뼘그림 아트페어 (디아트플랜트 요갤러리)
2020 제4회 영 아티스트 (미누현대미술관)
2019  강동예술제 (일자산 잔디광장)
2019  3인 기획전 工事展 (복합문화공간 COSO)
2019  Spare Moment in Art (스페어모먼트 로스터리, 뉴욕)
2018  3인 기획전 도시의 주인들 (어반호스트)
2016  필:동 아트마켓 프로젝트 (Space Art1)
2016  Art Oasis Exhibition  (에이블 파인아트 서울)
2016  아시아프 1 페스티벌 (DDP)

소장        
 2018년 정부미술은행 공모제
 2020년 서울시 작품구입 공모제
    ',0,to_date('23/11/24','RR/MM/DD'));
Insert into ATELIER.ARTIST (AIDX,MIDX,M_NAME,PROFILES,A_INTRO,A_HISTORY,SUBSCRIBER,REGIDATE) values (3,3,'김지원',null,'문인화가 송정 입니다.
한번 지나간 붓길은 다시 돌아오지 않는다. 
이는 문인화의 요체입니다. 
다시 돌아오지 않을 시간과 감정들을 길어나르는 작업을 합니다.','
    학력
2015 고려대학교 조형학부 조형예술학과 졸업

개인전
2022  긴 호흡으로  (Gallery hoM)
2021  기억의 간격  (갤러리초연)
2018  흐릿하고 선명한   (아워캔버스)
2017  몇 번의 순간들   (Parking lot project) 

단체전
2021  다시, 기억하기 (아트스페이스 퀄리아)
2021  을지아트페어 (을지트윈타워)
2021  맑음 흐림 그리고 비 (갤러리hoM)
2021  모두에게 멋진 날들 (구로소방서, 서울시 온라인갤러리)
2020 아시아프 (홍익대학교 현대미술관)
2020 한뼘그림 아트페어 (디아트플랜트 요갤러리)
2020 제4회 영 아티스트 (미누현대미술관)
2019  강동예술제 (일자산 잔디광장)
2019  3인 기획전 工事展 (복합문화공간 COSO)
2019  Spare Moment in Art (스페어모먼트 로스터리, 뉴욕)
2018  3인 기획전 도시의 주인들 (어반호스트)
2016  필:동 아트마켓 프로젝트 (Space Art1)
2016  Art Oasis Exhibition  (에이블 파인아트 서울)
2016  아시아프 1 페스티벌 (DDP)

소장        
 2018년 정부미술은행 공모제
 2020년 서울시 작품구입 공모제
    ',0,to_date('23/11/24','RR/MM/DD'));
Insert into ATELIER.ARTIST (AIDX,MIDX,M_NAME,PROFILES,A_INTRO,A_HISTORY,SUBSCRIBER,REGIDATE) values (4,4,'박지원',null,'문인화가 송정 입니다.
한번 지나간 붓길은 다시 돌아오지 않는다. 
이는 문인화의 요체입니다. 
다시 돌아오지 않을 시간과 감정들을 길어나르는 작업을 합니다.','
    학력
2015 고려대학교 조형학부 조형예술학과 졸업

개인전
2022  긴 호흡으로  (Gallery hoM)
2021  기억의 간격  (갤러리초연)
2018  흐릿하고 선명한   (아워캔버스)
2017  몇 번의 순간들   (Parking lot project) 

단체전
2021  다시, 기억하기 (아트스페이스 퀄리아)
2021  을지아트페어 (을지트윈타워)
2021  맑음 흐림 그리고 비 (갤러리hoM)
2021  모두에게 멋진 날들 (구로소방서, 서울시 온라인갤러리)
2020 아시아프 (홍익대학교 현대미술관)
2020 한뼘그림 아트페어 (디아트플랜트 요갤러리)
2020 제4회 영 아티스트 (미누현대미술관)
2019  강동예술제 (일자산 잔디광장)
2019  3인 기획전 工事展 (복합문화공간 COSO)
2019  Spare Moment in Art (스페어모먼트 로스터리, 뉴욕)
2018  3인 기획전 도시의 주인들 (어반호스트)
2016  필:동 아트마켓 프로젝트 (Space Art1)
2016  Art Oasis Exhibition  (에이블 파인아트 서울)
2016  아시아프 1 페스티벌 (DDP)

소장        
 2018년 정부미술은행 공모제
 2020년 서울시 작품구입 공모제
    ',0,to_date('23/11/24','RR/MM/DD'));
Insert into ATELIER.ARTIST (AIDX,MIDX,M_NAME,PROFILES,A_INTRO,A_HISTORY,SUBSCRIBER,REGIDATE) values (5,5,'김진웅',null,'문인화가 송정 입니다.
한번 지나간 붓길은 다시 돌아오지 않는다. 
이는 문인화의 요체입니다. 
다시 돌아오지 않을 시간과 감정들을 길어나르는 작업을 합니다.','
    학력
2015 고려대학교 조형학부 조형예술학과 졸업

개인전
2022  긴 호흡으로  (Gallery hoM)
2021  기억의 간격  (갤러리초연)
2018  흐릿하고 선명한   (아워캔버스)
2017  몇 번의 순간들   (Parking lot project) 

단체전
2021  다시, 기억하기 (아트스페이스 퀄리아)
2021  을지아트페어 (을지트윈타워)
2021  맑음 흐림 그리고 비 (갤러리hoM)
2021  모두에게 멋진 날들 (구로소방서, 서울시 온라인갤러리)
2020 아시아프 (홍익대학교 현대미술관)
2020 한뼘그림 아트페어 (디아트플랜트 요갤러리)
2020 제4회 영 아티스트 (미누현대미술관)
2019  강동예술제 (일자산 잔디광장)
2019  3인 기획전 工事展 (복합문화공간 COSO)
2019  Spare Moment in Art (스페어모먼트 로스터리, 뉴욕)
2018  3인 기획전 도시의 주인들 (어반호스트)
2016  필:동 아트마켓 프로젝트 (Space Art1)
2016  Art Oasis Exhibition  (에이블 파인아트 서울)
2016  아시아프 1 페스티벌 (DDP)

소장        
 2018년 정부미술은행 공모제
 2020년 서울시 작품구입 공모제
    ',0,to_date('23/11/24','RR/MM/DD'));
Insert into ATELIER.ARTIST (AIDX,MIDX,M_NAME,PROFILES,A_INTRO,A_HISTORY,SUBSCRIBER,REGIDATE) values (6,6,'박진웅',null,'문인화가 송정 입니다.
한번 지나간 붓길은 다시 돌아오지 않는다. 
이는 문인화의 요체입니다. 
다시 돌아오지 않을 시간과 감정들을 길어나르는 작업을 합니다.','
    학력
2015 고려대학교 조형학부 조형예술학과 졸업

개인전
2022  긴 호흡으로  (Gallery hoM)
2021  기억의 간격  (갤러리초연)
2018  흐릿하고 선명한   (아워캔버스)
2017  몇 번의 순간들   (Parking lot project) 

단체전
2021  다시, 기억하기 (아트스페이스 퀄리아)
2021  을지아트페어 (을지트윈타워)
2021  맑음 흐림 그리고 비 (갤러리hoM)
2021  모두에게 멋진 날들 (구로소방서, 서울시 온라인갤러리)
2020 아시아프 (홍익대학교 현대미술관)
2020 한뼘그림 아트페어 (디아트플랜트 요갤러리)
2020 제4회 영 아티스트 (미누현대미술관)
2019  강동예술제 (일자산 잔디광장)
2019  3인 기획전 工事展 (복합문화공간 COSO)
2019  Spare Moment in Art (스페어모먼트 로스터리, 뉴욕)
2018  3인 기획전 도시의 주인들 (어반호스트)
2016  필:동 아트마켓 프로젝트 (Space Art1)
2016  Art Oasis Exhibition  (에이블 파인아트 서울)
2016  아시아프 1 페스티벌 (DDP)

소장        
 2018년 정부미술은행 공모제
 2020년 서울시 작품구입 공모제
    ',0,to_date('23/11/24','RR/MM/DD'));
REM INSERTING into ATELIER.AUCTION1
SET DEFINE OFF;
REM INSERTING into ATELIER.AUCTION2
SET DEFINE OFF;
REM INSERTING into ATELIER.CART
SET DEFINE OFF;
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (1,6470,8);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (34,6774,9);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (27,6504,8);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (31,6518,9);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (38,6657,8);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (39,6655,8);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (35,6657,9);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (30,6572,7);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (33,6715,9);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (42,6772,8);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (40,6512,8);
Insert into ATELIER.CART (CIDX,PIDX,MIDX) values (41,6809,8);
REM INSERTING into ATELIER.FAQ
SET DEFINE OFF;
REM INSERTING into ATELIER.MEMBER
SET DEFINE OFF;

Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('siwool@gmail.com','$2a$10$iFIhwnt6RdOPpwfHrS1j1eMIXtDiQxCPWthEQkfETMg6k1cO0mUKG','강이화','01056371055','03189','서울 종로구 우정국로2길 21','906호',SEQ_MEMBER.nextval,to_date('23/11/24','RR/MM/DD'),null,null,null,0,null,0,'ROLE_ARTIST');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('siwool12333@gmail.com','$2a$10$v7jaYp.eRLNelwtRgh6p/eeyx9lXP7wT.tJgGMV3UlXFa6qYL45Ye','김현아','01099998888','03189','서울 종로구 우정국로2길 21','906호',SEQ_MEMBER.nextval,to_date('23/11/24','RR/MM/DD'),null,null,null,0,null,1,'ROLE_ARTIST');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('kimjiwon9803@naver.com','$2a$10$iFIhwnt6RdOPpwfHrS1j1eMIXtDiQxCPWthEQkfETMg6k1cO0mUKG','김지원','01088887777','03189','서울 종로구 우정국로2길 21','906호',SEQ_MEMBER.nextval,to_date('23/11/24','RR/MM/DD'),null,null,null,0,null,1,'ROLE_ARTIST');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('kimjiwon98039803@gmail.com','$2a$10$iFIhwnt6RdOPpwfHrS1j1eMIXtDiQxCPWthEQkfETMg6k1cO0mUKG','박지원','01077776666','03189','서울 종로구 우정국로2길 21','906호',SEQ_MEMBER.nextval,to_date('23/11/24','RR/MM/DD'),null,null,null,0,null,1,'ROLE_ARTIST');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('98aha@naver.com','$2a$10$iFIhwnt6RdOPpwfHrS1j1eMIXtDiQxCPWthEQkfETMg6k1cO0mUKG','김진웅','01088887777','03189','서울 종로구 우정국로2길 21','906호',SEQ_MEMBER.nextval,to_date('23/11/24','RR/MM/DD'),null,null,null,0,null,1,'ROLE_ARTIST');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('9898.jw@gmail.com','$2a$10$iFIhwnt6RdOPpwfHrS1j1eMIXtDiQxCPWthEQkfETMg6k1cO0mUKG','박진웅','01077776666','03189','서울 종로구 우정국로2길 21','906호',SEQ_MEMBER.nextval,to_date('23/11/24','RR/MM/DD'),null,null,null,0,null,1,'ROLE_ARTIST');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('siwool123@naver.com','$2a$10$iFIhwnt6RdOPpwfHrS1j1eMIXtDiQxCPWthEQkfETMg6k1cO0mUKG','관리자','01044445555',null,null,null,SEQ_MEMBER.nextval,to_date('23/12/04','RR/MM/DD'),null,null,null,0,null,1,'ROLE_ADMIN');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('test123@naver.com','$2a$10$iFIhwnt6RdOPpwfHrS1j1eMIXtDiQxCPWthEQkfETMg6k1cO0mUKG','홍길동','01044449898','01026','서울 강북구 4.19로 1','1',SEQ_MEMBER.nextval,to_date('23/12/04','RR/MM/DD'),null,null,null,77000,null,1,'ROLE_USER');
Insert into ATELIER.MEMBER (ID,PASS,M_NAME,PHONE,ZIP,ADDR1,ADDR2,MIDX,REGIDATE,LEAVEDATE,PROFILES,PLACES,TOTAL_POINT,TOKEN,ENABLED,AUTHORITY) values ('siwool12321@gmail.com','$2a$10$e8FmMnQ9VruRbEXdAjdbrOzLTnogiWEOs/s/tDR6O2mCULEhJGgNu','깡이화','01056371055','01026','서울 강북구 4.19로 1','1',SEQ_MEMBER.nextval,to_date('23/12/11','RR/MM/DD'),null,null,null,87912,null,1,'ROLE_USER');
REM INSERTING into ATELIER.M_POINT
SET DEFINE OFF;
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (2,8,null,to_date('23/12/11','RR/MM/DD'),'20231211003',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (4,8,null,to_date('23/12/11','RR/MM/DD'),'20231211005',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (16,9,null,to_date('23/12/13','RR/MM/DD'),'20231213003',88);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (1,8,null,to_date('23/12/11','RR/MM/DD'),'20231211002',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (3,8,null,to_date('23/12/11','RR/MM/DD'),'20231211004',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (5,8,null,to_date('23/12/11','RR/MM/DD'),'20231211006',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (6,8,null,to_date('23/12/11','RR/MM/DD'),'20231211007',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (7,8,null,to_date('23/12/11','RR/MM/DD'),'20231211008',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (8,8,null,to_date('23/12/11','RR/MM/DD'),'20231211009',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (9,8,null,to_date('23/12/11','RR/MM/DD'),'20231211010',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (10,8,null,to_date('23/12/11','RR/MM/DD'),'20231211011',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (11,8,null,to_date('23/12/11','RR/MM/DD'),'20231211012',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (12,8,null,to_date('23/12/11','RR/MM/DD'),'20231211013',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (13,8,null,to_date('23/12/12','RR/MM/DD'),'20231212001',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (14,9,null,to_date('23/12/13','RR/MM/DD'),'20231213001',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (15,9,null,to_date('23/12/13','RR/MM/DD'),'20231213002',1000);
Insert into ATELIER.M_POINT (POINT_IDX,MIDX,ADD_POINT,POINT_DATE,OIDX,MINUS_POINT) values (17,8,null,to_date('23/12/13','RR/MM/DD'),'20231213004',0);
REM INSERTING into ATELIER.NOTICE
SET DEFINE OFF;
REM INSERTING into ATELIER.N_COMMENT
SET DEFINE OFF;
REM INSERTING into ATELIER.ORDER1
SET DEFINE OFF;
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211001',8,'bank',10000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','0101112222','02452 서울시 동대문구 이문로 34 1호','경비실에맡기고문자주세요',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211003',8,'bank',829000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','현관문앞에 두고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211005',8,'bank',359000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','현관문앞에 두고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231213003',9,'bank',139912,to_date('23/12/13','RR/MM/DD'),null,'깡이화','01056371055','01026 | 서울 강북구 4.19로 1 _ 1','현관문앞에 두고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211002',8,'bank',739000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211004',8,'bank',2659000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211006',8,'bank',379000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','현관문앞에 두고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211007',8,'bank',359000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211008',8,'bank',859000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','무인택배함에 두고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211009',8,'bank',1079000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','현관문앞에 두고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211010',8,'bank',549000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211011',8,'bank',859000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211012',8,'bank',639000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231211013',8,'bank',959000,to_date('23/12/11','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231212001',8,'bank',759000,to_date('23/12/12','RR/MM/DD'),null,'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,'강이화',null,0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231213001',9,'kakaopay',759000,to_date('23/12/13','RR/MM/DD'),to_date('23/12/13','RR/MM/DD'),'깡이화','01056371055','01026 | 서울 강북구 4.19로 1 _ 1','경비실에 맡기고 문자주세요.',null,null,null,null,'imp_049244613907',0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231213002',9,'kakaopay',309000,to_date('23/12/13','RR/MM/DD'),to_date('23/12/13','RR/MM/DD'),'깡이화','01056371055','01026 | 서울 강북구 4.19로 1 _ 1','현관문앞에 두고 문자주세요.',null,null,null,null,'imp_986049419922',0,null);
Insert into ATELIER.ORDER1 (OIDX,MIDX,PAYMETHOD,PRICE,ORDERDATE,PAYDATE,RECEIVER,R_PHONE,R_ADDRESS,MESSAGE,SHIPDATE,COURIER,T_NUM,OWNER,APINUM,AUCTION,PIDX) values ('20231213004',8,'html5_inicis',100,to_date('23/12/13','RR/MM/DD'),to_date('23/12/13','RR/MM/DD'),'홍길동','01044449898','01026 | 서울 강북구 4.19로 1 _ 1','현관문앞에 두고 문자주세요.',null,null,null,null,'imp_436055674631',0,null);
REM INSERTING into ATELIER.ORDER2
SET DEFINE OFF;
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (3,'20231211003',6444,3,450000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (4,'20231211003',6521,5,380000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (7,'20231211005',6399,2,360000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (19,'20231213003',6725,2,140000,9);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (1,'20231211002',6596,6,310000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (2,'20231211002',6442,3,430000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (5,'20231211004',6453,3,2180000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (6,'20231211004',6455,3,480000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (8,'20231211006',6597,6,380000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (9,'20231211007',6599,6,360000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (10,'20231211008',6554,5,860000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (11,'20231211009',6558,5,1080000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (12,'20231211010',6441,3,550000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (13,'20231211011',6556,5,860000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (14,'20231211012',6446,3,640000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (15,'20231211013',6553,5,960000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (16,'20231212001',6601,6,760000,8);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (17,'20231213001',6737,2,760000,9);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (18,'20231213002',6698,1,310000,9);
Insert into ATELIER.ORDER2 (O2IDX,OIDX,PIDX,AIDX,PRICE,MIDX) values (20,'20231213004',6439,3,100,8);
REM INSERTING into ATELIER.PAYMENT
SET DEFINE OFF;
REM INSERTING into ATELIER.PRODUCT
SET DEFINE OFF;
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('탐라별곡',6470,4,0,91,116,'인물','유화',2,1390000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/43b698a1b0c7c775c1446ba0a69fa7f8.JPG',1,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('甲寺入口',6471,4,0,80,100,'인물','유화',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a7487b1ba6d6e75611873e82a104e858.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('고궁',6473,4,0,65,80,'인물','유화',2,670000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a469559a793a43218db81ac28714defe.JPG',0,4,'박지원','소묘');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('공작',6475,4,1,50,150,'인물','유화',1,980000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/89d31c30361383c120072fff678d4a5d.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('누드',6448,3,0,98,64,'자연/풍경','아크릴',0,810000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/81225ebc2cc92c502ebb9df0befa99d7.JPG',0,3,'김지원','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('여름철',6449,3,0,120,42,'자연/풍경','아크릴',0,670000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/31e144de7888826de110d425dbe036a3.JPG',0,3,'김지원','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('삼무일기',6451,3,0,46,123,'자연/풍경','아크릴',0,740000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f165aabd4c8c6dd51076992751b659d2.JPG',0,3,'김지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('용두암 소견',6453,3,0,112,147,'자연/풍경','아크릴',0,2180000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0e6924c95459fa246c916cf81af581e7.JPG',1,3,'김지원','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('무제',6455,3,0,60,60,'자연/풍경','아크릴',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/39bc88a126eb9f1bc63068056033333c.JPG',1,3,'김지원','수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('성산일출봉',6456,3,0,90,180,'자연/풍경','아크릴',0,2160000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/86dcfe9edcd599cfcc759b60e75592d9.JPG',0,3,'김지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('귤',6458,3,0,70,93,'자연/풍경','아크릴',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/84c8df165530833684e8ea8069e86f80.JPG',0,3,'김지원','한지에 수묵');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('대도지행…',6460,4,0,122,47,'인물','유화',0,740000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bb5731e20a703f00618663fe85467743.JPG',1,4,'박지원','한지에 수묵채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('수비금석',6462,4,0,136,33,'인물','유화',0,570000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/57ec22586fa8765a38ba46456679c33e.JPG',0,4,'박지원','Digital work, Acrylic');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('백자',6498,4,0,56,45,'인물','유화',0,330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/260fd848031f565e77253ded29d86802.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('보리밭',6500,4,1,58,80,'인물','유화',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a1e5983f14dc66884ad374f2b02b0905.JPG',1,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('봄',6502,4,0,60,90,'인물','유화',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/fe9457454818b08a410a7458854774e4.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('나른한 일상',6463,4,0,52,77,'인물','유화',0,520000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f40d02f4b9fbdf3967281d45e73ad76f.JPG',0,4,'박지원','종이에 수묵담색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('6월의 초가',6464,4,0,53,70,'인물','유화',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a5b42521de1eeef9dc4fc06d1e00b89e.JPG',0,4,'박지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('불',6468,4,0,64,40,'인물','유화',0,330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2a7869c8123e70dd7777bbfebee07ae6.JPG',0,4,'박지원','Ink on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('모네정원',6491,4,0,49,53,'인물','유화',0,330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5f1b2b6a461203f147bb082978bc4a5d.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('민둥산',6492,4,0,73,92,'인물','유화',0,880000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0832991891b6a8e8b972c3bb7a6227ff.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('민락동',6494,4,0,65,91,'인물','유화',0,760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/61f83b631f1fee4ca9e63ded616c7476.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('백공작',6496,4,0,146,146,'인물','유화',0,2830000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/290a6632a3caf716c085896006703888.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('명월',6399,2,0,42,65,'기타','혼합/기타',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1fecc1fa27a0d8def8a5ebab26646b4c.JPG',1,2,'김현아','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('산',6407,3,0,75,100,'자연/풍경','아크릴',0,980000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6235d1c8c574c9b534f0c367e9e80567.JPG',0,3,'김지원','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('옥온산휘',6409,3,0,34,130,'자연/풍경','아크릴',0,570000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e8c9c7e88c4aa4e22bc67450837c4441.JPG',0,3,'김지원','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('선락영금',6411,3,0,128,35,'자연/풍경','아크릴',0,570000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2699d1daa434c6d7be98927b990debfa.JPG',0,3,'김지원','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('삼송도',6413,3,0,100,310,'자연/풍경','아크릴',0,4120000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/209f2931ac725498fed96f38085823f9.JPG',0,3,'김지원','종이에 수묵');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('운무산수',6414,3,0,43,58,'자연/풍경','아크릴',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d3f30b12163b51c5d8574b9e63e4aea5.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('7월 7석의 직녀',6416,3,0,63,80,'자연/풍경','아크릴',0,670000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/437122d89e9e34d79ff9158c2bf42641.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('고려불상',6418,3,0,64,48,'자연/풍경','아크릴',0,400000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2d4d54b7b6802f264f7d7c5e4380b017.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('꿈',6420,3,0,133,212,'자연/풍경','아크릴',0,3740000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/076b8e633df1d964ce0d978d87268095.JPG',1,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('사색하는 여인',6428,3,0,162,261,'자연/풍경','아크릴',0,5610000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9dbb201f6e49af2a8c6636d0b929ef28.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어디서 본듯한 얼굴',6430,3,0,39,54,'자연/풍경','아크릴',0,260000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/98f87d1fbf7bbd89252c52f989ad65c5.JPG',1,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('여름해녀',6432,3,0,74,53,'자연/풍경','아크릴',0,500000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/af8cbe188128d7725d2a6af5cec086f6.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('꿈의 소녀상',6421,3,0,78,108,'자연/풍경','아크릴',0,1100000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1c2764d5ea8be046e0eb695aa281431c.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('바램',6424,3,0,73,137,'자연/풍경','아크릴',0,1320000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/341f441a5c03e4a3660ae41f9f70976e.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('백일몽',6426,3,0,79,110,'자연/풍경','아크릴',0,1150000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/73f94599c4d5647ba58b4a1b9a586e4f.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('우도가 보이는 풍경',6400,3,1,129,160,'자연/풍경','아크릴',0,2730000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e18912e094771b3200b50b4a8f289a4e.JPG',1,3,'김지원','수묵채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('지음도',6401,3,0,40,50,'자연/풍경','아크릴',0,260000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5e3ea4e9320fb08f69188e7806caf8a2.JPG',0,3,'김지원','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('민속풍경',6405,3,0,40,50,'자연/풍경','아크릴',0,260000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f97ed64149f3146748d03a3089f381fc.JPG',0,3,'김지원','Charcoal on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('국보',6477,4,0,130,162,'인물','유화',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8805b6e5b120b98cc41deaf8d84ac04b.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('근정전',6478,4,0,130,162,'인물','유화',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/071dd2c12306e2c38119f04cf5a48a78.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('길',6480,4,0,60,80,'인물','유화',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ffebfab1bd6d3ea19f8943f0f4875284.JPG',1,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('노틀담사원',6482,4,0,60,50,'인물','유화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b718d2169123d97a1421e330bdace1f4.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('눈 내린 마을',6484,4,0,45,60,'인물','유화',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/135d9c5c53e1582cd09a4fb764559526.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('닭장',6485,4,0,116,80,'인물','유화',1,1220000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/49f0bdcf330454d9ea98fce8ac2dc01c.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('돌담',6487,4,0,45,53,'인물','유화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bb9c3201abd1af7e2fe64461e8646989.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('만추',6489,4,0,130,162,'인물','유화',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cd2cab5e98c7db9047107fb3b2c5ec71.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 20',6560,5,0,90,73,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ad41757f08fe9f760f7278a1423ac491.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 21',6561,5,0,120,110,'동식물','수채화',0,1750000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a7affa87ad88b5723ad4eb3865698465.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 23',6563,5,0,90,90,'동식물','수채화',0,1080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0d83e1730f61d7e2894ea03280cad05f.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 25',6565,5,0,120,110,'동식물','수채화',0,1750000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ffe58f251c825f40937eaad86833cb6b.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 27',6567,5,0,100,130,'동식물','수채화',0,1720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/17deea3f11d0d26b236062f8854b291e.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('조천에서',6603,6,0,90,130,'사물','수묵화',0,1560000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cfc276ba9e4a9f6a5cd8b7e156a3856d.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('지곡리가을',6605,6,0,162,130,'사물','수묵화',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/62b78d21257c412907801fbbb20dd603.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('지곡리여름',6607,6,0,100,80,'사물','수묵화',1,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6e0db479fcd1b4212cd3477859d6b531.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 28',6568,5,0,90,72,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/772ca3aa97a7bcaa048912c5674d9d0d.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 36',6576,5,0,90,72,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/fe5baea5b3fc7c7028719804bfd051c0.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 38',6578,5,0,90,73,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a6202f39d5f335dfea60a75ff6e70929.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 40',6580,6,0,93,73,'사물','수묵화',0,880000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2ea82dafce8fbd651e1c0e759e805e6f.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 29',6569,5,0,162,241,'동식물','수채화',0,5180000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cdf2612492adc744633c8b6231b5b425.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 30',6570,5,0,53,85,'동식물','수채화',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4b863af5320e2e44d2464228a4c8f122.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 32',6572,5,0,110,120,'동식물','수채화',0,1750000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/63a733e3f60707c5a3f5075846913258.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 34',6574,5,0,73,90,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/62a08db3e14a1e5c7cf5462c58956150.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전시포스터 1',6434,3,0,67,46,'자연/풍경','아크릴',0,400000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a80305f7-6b07-4190-a9e4-51f771a8fc02.jpg',0,3,'김지원','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전시포스터 2',6435,3,0,176,116,'자연/풍경','아크릴',0,2710000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b8f9053b-3a1f-4c59-b792-e8aa4657a2dd.jpg',0,3,'김지원','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전시포스터 4',6437,3,0,58,42,'자연/풍경','아크릴',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/16a5f09d-052d-480b-8a51-36afc2db0006.jpg',0,3,'김지원','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전시포스터 6',6439,3,0,72,59,'자연/풍경','아크릴',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d89a5de8-87fa-4b07-a322-8965ba717ddf.jpg',1,3,'김지원','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('해녀',6441,3,0,76,56,'자연/풍경','아크릴',0,550000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d584556fba3838145d462c3f590ea9af.JPG',1,3,'김지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('생명으로',6442,3,0,48,70,'자연/풍경','아크릴',0,430000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/abe94ea35d5fa7ddb669a630e21865ac.JPG',1,3,'김지원','분청');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('귀로',6444,3,0,50,70,'자연/풍경','아크릴',0,450000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/aee2e3c05a9c5823610b1f8e4bb18dab.JPG',1,3,'김지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('도덕신선',6446,3,0,60,82,'자연/풍경','아크릴',0,640000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d17d34e18ec28972a27d8d23c77aaaa6.JPG',1,3,'김지원','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 13',6553,5,0,90,80,'동식물','수채화',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/baaf15636eb5fe771ce6cb1c71821488.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 14',6554,5,0,90,72,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d98a770f2abee18b6c9e27c984312754.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 16',6556,5,0,72,91,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/dc01aeac91abc05452e19d9eeb25649c.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 18',6558,5,0,90,90,'동식물','수채화',0,1080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3bda39b8bca79f74b40f9bef969c137b.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주마을',6596,6,0,45,53,'사물','수묵화',1,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c206a097e1d8fb2a67138bd5b4c61da3.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주바람',6597,6,0,50,60,'사물','수묵화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a74e2cf10e27bd86f988e9b169967628.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주윗새오름',6599,6,0,60,45,'사물','수묵화',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ba70f34eb59f8f7eeab508b21deb84fb.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주의 봄',6601,6,0,65,90,'사물','수묵화',0,760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/29b9ec14ec2775a552a41f725be6c0d3.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('불상',6504,4,0,40,31,'인물','유화',0,140000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8d90a3e579ef4ccc51cfe2b4b1b9e5ce.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('성산포',6512,4,0,45,60,'인물','유화',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b52a191b03e2c72bd2cce03a1fa7ebef.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('성산포구',6514,4,0,50,60,'인물','유화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bac53dd82da46b58f096d35951b73901.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('소라',6516,4,0,50,60,'인물','유화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/03e3ab2b44fbb8ca5bf6caa0471b96d3.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('스톡흐롬 시내',6518,4,0,53,45,'인물','유화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cdec899ac75929707639fa9e703e113f.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어리목',6519,4,0,45,60,'인물','유화',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1f4d15215db224aebe9c999451fde7f9.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어리목에서',6521,5,0,50,60,'동식물','수채화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/740f377801c2a341768a9ea24771fb55.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('억새2',6523,5,0,52,135,'동식물','수채화',1,930000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c44a285c851bff3fc34620671fdfedc2.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('억새물결',6525,5,1,130,193,'동식물','수채화',0,3330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5455789aa0e5ca8ebee72f77bd540fad.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('오름',6533,5,0,100,80,'동식물','수채화',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/dc19071a30fa28ca0067b118cfb36ce1.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('월출산',6535,5,0,80,130,'동식물','수채화',0,1360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4cd6b471dc22279611d212a47b75fd85.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('월출산의 봄',6537,5,0,125,210,'동식물','수채화',0,3480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3b0bdee7cc4855819ae234e3b91ce225.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('여름',6526,5,0,130,162,'동식물','수채화',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/66806bb7bf07c8050a3462507a3d3a91.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('女人像',6527,5,0,193,130,'동식물','수채화',0,3330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/7ef3bbf6fcd624a71f098efb6750bf53.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('영실의 봄',6529,5,0,45,53,'동식물','수채화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2668b53be2a73c164820ca9b8ba1d038.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('옛마을',6531,5,0,112,198,'동식물','수채화',0,2950000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4f2c9ed7c684f9c4919b1715bc8cf03b.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('서귀포',6505,4,0,82,165,'인물','유화',0,1800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6c89be5a3eb853b1ec74589b096ac33b.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설악',6506,4,0,65,80,'인물','유화',0,670000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a0c7b5795746a298ed2cbe5db18497c6.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설악계곡',6508,4,0,50,60,'인물','유화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/87afc05cdbdd22fc31db4b882d3c5b7f.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설악아침',6510,4,0,97,130,'인물','유화',0,1680000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/fa7c77349cfa2df6fbebbe407c9889ae.JPG',1,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 42',6582,6,0,130,140,'사물','수묵화',0,2420000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9c188a4df2f381742d5b7837da008425.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 43',6583,6,0,130,140,'사물','수묵화',0,2420000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1cc4df4e8d3f9604c94b8c6fd940b485.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 45',6585,6,0,73,63,'사물','수묵화',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/245d8bc0e7e9b106a93f4f499d6291c7.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 47',6587,6,0,130,140,'사물','수묵화',0,2420000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8d90ef0010d8988f892b89210c2cc14a.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 49',6589,6,0,110,120,'사물','수묵화',0,1750000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3bc8e1122372347a42f918678d91fcbc.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 50',6590,6,0,110,160,'사물','수묵화',0,2320000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ebc9ce82879ad95d2a4d9541be23d2ff.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주',6592,6,0,53,73,'사물','수묵화',0,500000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4b08da74e8bf76caf38f6fa146a3fecb.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주돌담',6594,6,0,45,53,'사물','수묵화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/81ddf79808e722f9434929203fafd9ea.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('남한산성',6665,1,0,50,35,'추상','스케치',0,210000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c572e64e2c11fee27b0704990339b407.JPG',0,1,'강이화','Painting on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('마음꽃',6666,1,0,68,68,'추상','스케치',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ca631b659718458c56cd346a4f6b08c9.JPG',0,1,'강이화','한지에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('퇴계 선생시',6668,1,0,133,66,'추상','스케치',0,1150000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/44c59151aaf090bf107c2ab0d3cefd21.JPG',0,1,'강이화','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('민경 선생시',6670,1,0,138,34,'추상','스케치',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/84bb2d459e0fc3eda62486985f518608.JPG',1,1,'강이화','Aluminium');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('적의',6672,1,0,30,30,'추상','스케치',0,120000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/10760907829e907abb8fd97c68b00ca5.JPG',0,1,'강이화','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('순수형태-바람,놀다3',6708,2,0,73,143,'기타','혼합/기타',0,1360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/338e8b698c47525afcc9314bcb73728d.JPG',0,2,'김현아','한지에 목판');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('새벽-성산일출봉',6710,2,0,72,116,'기타','혼합/기타',0,1100000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8e9ca98800db7f973ed69db9eeeabab3.JPG',1,2,'김현아','Lightjet Print');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('단산',6712,2,0,124,163,'기타','혼합/기타',0,2680000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c53d77964124eecbaca101e8bee83cec.JPG',0,2,'김현아','비단에 진채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설악산 풍경',6673,1,0,69,104,'추상','스케치',0,930000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bd31ac5ffb77d498eef09d8042ccd762.JPG',0,1,'강이화','혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('빛과생명(Light and Life)',6685,1,0,88,118,'추상','스케치',0,1360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0ece971fe657c4470a1ca0ce8dbee773.JPG',0,1,'강이화','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('유채꽃',6539,5,0,41,60,'동식물','수채화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6f343acf0ed424eca6ed4f10482b4a77.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('日出',6540,5,0,45,130,'동식물','수채화',0,760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/76288739a516048782f5e96b567fd310.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 2',6542,5,0,95,85,'동식물','수채화',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c7415f89f93b43d24de573faa19d2f26.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 4',6544,5,0,65,90,'동식물','수채화',0,760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/30585dae395ca4bb75251922eca25805.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 6',6546,5,0,110,120,'동식물','수채화',0,1750000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/07cce06bdb85c40ad3df63f4ae64a09b.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 7',6547,5,0,90,60,'동식물','수채화',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bbccfd146df0eae126fc9ea9644f22e0.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 9',6549,5,0,90,73,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0765f937f0bc9a99860f211548a8c265.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 11',6551,5,0,95,95,'동식물','수채화',0,1200000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c76379f3bfec663a87b8eb4d19271411.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('빗방울',6658,1,0,70,113,'추상','스케치',0,1030000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c785d1585de5bab388ad51feda2a9ba3.JPG',0,1,'강이화','Photo');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('시드니항의 노을',6659,1,0,40,74,'추상','스케치',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/77f96a0f2803de4fa040d5a7c1f12ffc.JPG',0,1,'강이화','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('박두진 선생시',6661,1,0,210,70,'추상','스케치',0,1940000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d18a4a3d42c7fb50b51a6a940dc4bf97.JPG',0,1,'강이화','Photo');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('채근담 구절',6663,1,0,250,69,'추상','스케치',0,2280000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/aefa2e57a795a19d3845c152551cfbb1.JPG',0,1,'강이화','한지에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('墨竹',6701,2,0,135,64,'기타','혼합/기타',0,1150000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8fb6b2a7ed744565003ca57a31c091c4.JPG',0,2,'김현아','Acrylic on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('백산(白山)',6702,2,0,80,116,'기타','혼합/기타',0,1220000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/180734ab132a7cb3abec27d585fcdf5c.JPG',0,2,'김현아','화선지에 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('Untitled',6706,2,0,74,100,'기타','혼합/기타',0,980000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/de224ff5fd5a57a7b75ab096e072f28f.JPG',0,2,'김현아','화선지에 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('청평호',6609,6,0,50,60,'사물','수묵화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/eabd3191af9c99d9aaeb15a42fae4ee7.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('한라의 가을',6617,6,0,40,92,'사물','수묵화',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8fe97417273d8a71c5c40ca0721c1160.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('해변',6619,6,0,41,73,'사물','수묵화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ba29261f1eccba9d190f0e15c7bbb29a.JPG',0,6,'박진웅','종이, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('새벽, 한라산 안개',6621,6,0,44,89,'사물','수묵화',0,500000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9c5e6d72d1c9a371e9d7ac03234719f9.JPG',0,6,'박진웅','Acrylic on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('스미스 몬다나에서 
본 개',6623,6,0,127,65,'사물','수묵화',0,1080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8c81d7413bfeb9e3cc15f84e1ab5c256.JPG',0,6,'박진웅','Wood');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('정중동',6624,6,0,54,190,'사물','수묵화',0,1360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/436ab1da64ca953a28fc9693e7d4e12f.JPG',0,6,'박진웅','Basalt');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('무위',6638,6,0,73,97,'사물','수묵화',0,930000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/7a89545c36c6a3dae0575cc7cf688c9a.JPG',0,6,'박진웅','Color Photo');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('춤추는사람들',6642,1,0,79,462,'추상','스케치',0,4840000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d973e92a43303447cfea8740e976ab5a.JPG',0,1,'강이화','장지에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('무제',6634,6,0,36,25,'사물','수묵화',0,120000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cc6716ac05ec42cf908c1a461a8c02ab.JPG',0,6,'박진웅','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('발원문',6636,6,0,62,91,'사물','수묵화',0,740000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9c15e6bfe4376730533b3a8355f3db76.JPG',0,6,'박진웅','Water color on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('치과',6610,6,0,112,146,'사물','수묵화',0,2160000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/732fa64d7109d707674d14882620d4f3.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('케냐해변',6611,6,0,50,60,'사물','수묵화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0ea041bac6402d7a884f849cebb1a05e.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('토기',6613,6,0,37,45,'사물','수묵화',0,210000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/93e934fb4890470f870c04cca9b8cf37.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('풍차마을',6615,6,0,53,45,'사물','수묵화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1fe01676a6796b0467dcb08e47bb99ff.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주아침에 희망을낚다 - 성산일출봉',6687,1,0,130,162,'추상','스케치',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/727c8e0dc858b91c91a4fadb1e74b76d.JPG',0,1,'강이화','한지에 혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('색색풍경-한라1',6688,1,0,81,180,'추상','스케치',0,1940000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/dc988f39c528b0ab675cef0f47c4541c.JPG',0,1,'강이화','Acrylic on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('부엉이',6690,1,0,63,75,'추상','스케치',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2d67c957b1153db447e279dd5840d8bb.JPG',1,1,'강이화','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('engene the father and sarah the daughter',6692,1,0,100,120,'추상','스케치',0,1580000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/44e3cb432b198c529dc43e4c49292141.JPG',0,1,'강이화','Alpacca Wool');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('삼무일기-바람의 흔적',6694,1,0,28,120,'추상','스케치',0,430000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/90894519924b6f8984abc4b617a1e90f.JPG',0,1,'강이화','목판 꼴라그라프');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어떤풀',6695,1,0,48,79,'추상','스케치',0,500000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/100aea93d05bfde2313608c0f14d45a2.JPG',0,1,'강이화','Mixed media on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('바람·빛',6697,1,0,40,60,'추상','스케치',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8946e207ad4516eb9fd43d4ffc15851f.JPG',0,1,'강이화','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주섬',6699,1,0,64,125,'추상','스케치',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9f6a30389315cf2f9cfb0817a3af0969.JPG',0,1,'강이화','화선지에 수묵채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('묘법(描法)',6742,2,0,80,68,'기타','혼합/기타',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d883f1b624431777e8857d801ad602cc.JPG',0,2,'김현아','한지에 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('법정스님의 무소유',6743,2,0,125,57,'기타','혼합/기타',0,930000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e00d8c069fd5a306a5f4bc458f6b27bc.JPG',0,2,'김현아','한지에 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('세한삼우',6745,2,0,116,91,'기타','혼합/기타',0,1390000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c28bc7577f69a4932bd4bbbfe358c2f5.JPG',0,2,'김현아','나무');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('Hanguel 1060',6747,2,0,122,194,'기타','혼합/기타',0,3140000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ef3c8f5bfe7378d87925bb00934730bc.JPG',0,2,'김현아','브론즈, 소조');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어두운 길',6749,2,0,108,207,'기타','혼합/기타',0,2970000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d09507d135de132b44878026a60124a1.JPG',0,2,'김현아','세라믹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('서귀포를 품다',6754,2,0,130,162,'기타','혼합/기타',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4c9e83d857609337900cddfa18155248.jpg',0,2,'김현아','화선지 수묵채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('초간정',6756,2,0,50,98,'기타','혼합/기타',0,640000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f7e6f250a298f6eb7696e04d1c803886.jpg',0,2,'김현아','동판용접');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('코스모스-3 (1/7)',6766,2,0,70,180,'기타','혼합/기타',0,1680000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5335c5635dc43d555e7d28d8f1a759f0.jpg',0,2,'김현아','캔버스 아크릴릭 혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('성산포의 풍정',6768,2,0,72,90,'기타','혼합/기타',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/90a06dbe841f8ca0ab406a688a001ed1.jpg',0,2,'김현아','캔버스 아크릴릭 혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('형제섬',6758,2,0,28,34,'기타','혼합/기타',0,120000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b2a5159542f41d667de66d3f803b5de4.JPG',0,2,'김현아','목판');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('꿈꾸는 섬',6760,2,0,162,112,'기타','혼합/기타',0,2400000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bdbf49dbd58e9aefae987562b098a48d.jpg',1,2,'김현아','캔버스 아크릴릭');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('기억속의 풍경',6762,2,0,162,130,'기타','혼합/기타',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/90ee673990c92777e179f6029c089324.jpg',0,2,'김현아','한지에 혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('천동자',6644,1,0,75,144,'추상','스케치',0,1440000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5841315d8da9457c338d4c4a1f8b8473.JPG',0,1,'강이화','캔버스에 한지 아크릴릿');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('금강산 만물상',6645,1,0,172,502,'추상','스케치',0,11490000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/245e513c11955e9d18b16cc43a14f207.JPG',0,1,'강이화','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전기(錢起)시',6647,1,0,125,34,'추상','스케치',0,550000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/48314268198668d0a817416ae13bc265.JPG',0,1,'강이화','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('춤',6649,1,0,71,89,'추상','스케치',0,840000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/36d7c74807fd88a0b0da587d3608ad27.JPG',0,1,'강이화','Mixed Media');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('가을',6651,1,0,126,156,'추상','스케치',0,2610000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f0f5e09c023e2d3c394782d2d453af5d.JPG',0,1,'강이화','Ink on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('빛',6652,1,0,136,53,'추상','스케치',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/98788dcf808114a0f7191f348ed5d2b6.JPG',0,1,'강이화','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('향기로운 마음',6654,1,0,200,68,'추상','스케치',0,1800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/91910677be05ecd19f9744ab4dd6e8b5.JPG',0,1,'강이화','수묵');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('세계를 움직이는 캐리커쳐',6656,1,0,35,25,'추상','스케치',0,90000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0f48c66f1a08623e7cb5eca58ef05d6e.JPG',0,1,'강이화','화선지에 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('사계화회병',6735,2,0,165,360,'기타','혼합/기타',0,7920000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5680b51e89cb3075f83d942b0addfdae.JPG',0,2,'김현아','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('한라산',6736,2,0,218,333,'기타','혼합/기타',0,9670000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/732217ecba5b81082ac0d4ab47c5d16d.JPG',0,2,'김현아','비단에 진채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('발자욱처럼',6738,2,0,92,180,'기타','혼합/기타',0,2200000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3dd46acba299b1ccbdb75b4feb77fa41.JPG',0,2,'김현아','Mixed Media');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('신-세한도',6740,2,0,165,360,'기타','혼합/기타',0,7920000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/70793d7d1d0c19edd1adec074383c735.JPG',1,2,'김현아','한지에 채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연-이미지',6784,2,0,50,100,'기타','혼합/기타',0,640000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e9cc8d03c56f0993285765168a991062.jpg',0,2,'김현아','사진(6/12)');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('컬러 오브 버티컬(colors of vertical)',6785,2,0,45,180,'기타','혼합/기타',0,1080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/513831781eaa7d3447ee2512d95f363e.jpg',0,2,'김현아','사진(A.P)');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('장면13-석류',6787,2,0,112,194,'기타','혼합/기타',0,2880000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e9397f2aae1baaf91c9c5e5f3be16867.jpg',0,2,'김현아','캔버스에 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('소리 1001',6790,2,0,130,243,'기타','혼합/기타',0,4200000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/fd2b4dc897eb54a2ff64284912c44d7e.jpg',1,2,'김현아','캔버스에 아크릴');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주인상1',6792,2,0,130,162,'기타','혼합/기타',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/220e629c8dff3800c6d02839f52c54a2.jpg',0,2,'김현아','캔버스에 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('혼란한 전쟁(confused during the war)',6800,2,1,240,240,'기타','혼합/기타',0,7680000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ad2f04c078db5f2f3ea96d63c5400297.JPG',1,2,'김현아','장지에 디지털 프린트, 오리엔탈 바인딩, 우드케이스');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('광야(廣野)',6802,2,0,145,90,'기타','혼합/기타',0,1720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/684d6aeea1c5ae4d4a72e7afebf6403e.jpg',0,2,'김현아','캔버스에 아크릴');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('피리를 든 소년',6804,2,0,60,45,'기타','혼합/기타',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/464c7b5caa54c7be78aead50dbdb2cf0.jpg',0,2,'김현아','아사천에 유화물감');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('응집',6806,2,0,162,130,'기타','혼합/기타',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b4e598049e91b80fb8721a0bce8a4378.jpg',0,2,'김현아','LGMMA판에 천공 후 LED도광판에 부착');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('빔_바다',6807,2,0,50,182,'기타','혼합/기타',0,1200000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/30c39e34bd726b6ac92e0671ed289731.jpg',0,2,'김현아','사진');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('드로잉 001404',6809,2,0,97,162,'기타','혼합/기타',0,100,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/236d969efa012fd9d4e8d102ad780df1.jpg',0,2,'김현아','Digital C-print, 디아섹 액자');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('들풀사이로 제주바다',6714,2,0,70,140,'기타','혼합/기타',0,1290000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d85c182093624c1586bc798a2ddaaf51.JPG',0,2,'김현아','종이위에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('우도에서 본 일출봉',6716,2,0,72,90,'기타','혼합/기타',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ba7c00126cd3aede9eb1ff8bd2d9a124.JPG',0,2,'김현아','캔버스, 혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자정하는 도시',6726,2,0,46,66,'기타','혼합/기타',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f98778faad0902bcc34c03c1aaf76e4d.JPG',0,2,'김현아','Mixed Media');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('공부',6728,2,0,65,130,'기타','혼합/기타',0,1100000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/295ceff94d30911d55026dfe1db8fe18.JPG',0,2,'김현아','Cement');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('색색풍경-화산도, 제주1',6717,2,0,69,99,'기타','혼합/기타',0,880000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0354950d0870ca39ded67ca39ebf9ec4.JPG',0,2,'김현아','캔버스, 아크릴');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('10월의 한라산',6718,2,0,89,130,'기타','혼합/기타',0,1530000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4882080e354811965eba44521f7bf99c.JPG',0,2,'김현아','디아섹 출력');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('만장굴',6720,2,0,190,90,'기타','혼합/기타',0,2280000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3d70af998c4f549de4e32b5e7cef8875.JPG',1,2,'김현아','캔버스, 아크릴');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주인상2',6793,2,0,130,162,'기타','혼합/기타',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9ef7704d8c38050b0f9ef50f4946f565.JPG',0,2,'김현아','한지에 먹, 채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('분홍농장',6794,2,0,190,130,'기타','혼합/기타',0,3280000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/36fb1622ea6bf48e569419190fe8fa5f.jpg',0,2,'김현아','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('사이공간',6796,2,0,131,195,'기타','혼합/기타',0,3380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/29309629fc7161cc9fe41211ab8f268d.jpg',0,2,'김현아','흑연, 먹, 아크릴, 장지, 물기법');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('나의 어머니',6798,2,0,100,300,'기타','혼합/기타',0,3980000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9627bc5889dd2ec74974176771877e8d.jpg',0,2,'김현아','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('추억이 머무는 곳',6770,2,0,150,150,'기타','혼합/기타',0,3000000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4225fb72657ac4b4998a314c48155b67.jpg',1,2,'김현아','캔버스 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('정원애',6771,2,0,112,193,'기타','혼합/기타',0,2880000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/21dc967c68bfcbb0fc6695fff0c726ec.jpg',0,2,'김현아','종이 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연',6773,2,0,135,50,'기타','혼합/기타',0,880000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b10a15879817434e20f8e1c189d9fe49.jpg',0,2,'김현아','캔버스 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('억새',6778,2,0,130,162,'기타','혼합/기타',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/45fb62f97bb3f54128e7fd7be9382006.jpg',0,2,'김현아','사진(7/10)');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('山水-강변북로',6780,2,0,97,162,'기타','혼합/기타',0,2080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6a2c4531c0be831598147582f2a4b92a.jpg',1,2,'김현아','아크릴, 캔버스');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('2011-하도리',6782,2,0,194,131,'기타','혼합/기타',0,3380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/be6d02a2b426908a075a0085c68bf464.jpg',0,2,'김현아','FRP');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('법성포',6499,4,0,72,90,'인물','유화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d43a67a70c42077f51b92232e7430b5f.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('보문동 전당포',6501,4,0,65,80,'인물','유화',0,670000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9acc56dec70c5ed065e21ee578673fec.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('북해도',6503,4,0,45,53,'인물','유화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2e1cb1cab675561229ccf66438fd35d4.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('무제',6465,4,0,63,49,'인물','유화',0,400000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ff6790f891f8a62164c610ea8770926d.JPG',0,4,'박지원','Marble');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('원원지수',6467,4,0,122,68,'인물','유화',0,1100000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e27cc033e8adeb4ad021c73fdb0141f6.JPG',0,4,'박지원','Crayon on Paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어부사',6408,3,0,130,35,'자연/풍경','아크릴',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/46dd8a1da1e9d66c4bce05c11fc30413.JPG',0,3,'김지원','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어촌의 갈대',6410,3,0,60,76,'자연/풍경','아크릴',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/91afe4e77e2937dbfa9aba36f831897f.JPG',1,3,'김지원','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('추경산수',6412,3,0,127,34,'자연/풍경','아크릴',0,550000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4565d43f19859bfe87a6a55221b717da.JPG',0,3,'김지원','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('7월 7석의 기다림',6415,3,0,164,394,'자연/풍경','아크릴',0,8590000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/88d6c0ef5baf29e901c273b5a70dd9d8.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('거울앞에서',6417,3,0,109,78,'자연/풍경','아크릴',0,1120000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/76005891197ff080596ff0db67b683ff.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('기다림',6419,3,0,55,75,'자연/풍경','아크릴',0,520000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/837ad27ed2d5eb1d29e37ba5e8310ba2.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('아! 아침의 나라 우리나라',6429,3,0,50,92,'자연/풍경','아크릴',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/527989ba5cb5d5fb0f568f5f2693f68a.JPG',0,3,'김지원','드로잉');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('강남…',6469,4,0,32,125,'인물','유화',0,520000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/05be8ddac5bdae18bcb7d04159ca02cc.JPG',0,4,'박지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('민둥산1',6493,4,0,120,130,'인물','유화',0,2060000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/28f8d430e445da1001d92fc7657b6442.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('바다',6495,4,0,50,73,'인물','유화',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/662b8448032ee551cc156bd9ca5b24e4.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('白頭天池',6497,4,0,130,193,'인물','유화',0,3330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0f7c399ee4c658cde3663e92d217b381.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('Messenger',6730,2,0,100,100,'기타','혼합/기타',0,1320000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a9a7026c03398fe963c43b47df2b03c2.JPG',1,2,'김현아','co');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('명상-나무',6731,2,0,40,40,'기타','혼합/기타',0,190000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/12c4f03de869f04610444473fa9189d9.JPG',0,2,'김현아','철판 드로윙');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('12세면 숙녀예요',6733,2,0,68,114,'기타','혼합/기타',0,1030000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/36babe9566900eab514a247e37e1d7f3.JPG',0,2,'김현아','종이, 먹, 채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('갯벌',6472,4,0,40,60,'인물','유화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9527ef96e79b27e185eb2b3db70df0f7.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('골목길',6474,4,0,53,45,'인물','유화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/caad278a107a24c38f62f3cc183c69d0.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('광릉가을',6476,4,0,162,130,'인물','유화',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/846cebf0e3a9655966f506e64e37fbd6.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설경산수',6450,3,1,94,33,'자연/풍경','아크릴',0,400000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/625c0f6c9175655cb8aa12d90ae73d13.JPG',1,3,'김지원','천위에 수묵채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('탐라이야기',6452,3,0,52,70,'자연/풍경','아크릴',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/434bf20e1ca18dde7191d6616f5b2450.JPG',0,3,'김지원','한지에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('네추럴-이미지',6454,3,0,52,90,'자연/풍경','아크릴',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/744ad7cb568dfeb4abf13a945fc36f20.JPG',0,3,'김지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('시간-이미지',6457,3,0,50,72,'자연/풍경','아크릴',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a96a7a65f27ea937560edeb721a387c6.JPG',0,3,'김지원','종이에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주오름',6459,3,0,48,60,'자연/풍경','아크릴',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/89575688646a523c6023eb09d0d7950f.JPG',0,3,'김지원','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('북촌',6461,4,0,52,90,'인물','유화',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e1a8a54e3eb577e4d8c34740986ade0a.JPG',0,4,'박지원','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 33',6573,5,0,50,60,'동식물','수채화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/7f5f139aa32be3a357a6f44f2d9d34a6.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 35',6575,5,1,60,90,'동식물','수채화',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d68d0dee3f097a4d3c278d722934c229.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전시포스터 3',6436,3,0,67,41,'자연/풍경','아크릴',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/82f1b344-d93a-4de8-b772-f366b9238aa6.jpg',0,3,'김지원','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전시포스터 5',6438,3,0,75,49,'자연/풍경','아크릴',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/7d157e7c-9056-4e14-b45b-68156c4b2efc.jpg',0,3,'김지원','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('전시포스터 7',6440,3,0,64,49,'자연/풍경','아크릴',0,400000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1a81e76e-92d9-4216-be78-06f95647d4e2.jpg',1,3,'김지원','소묘');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의 소리',6445,3,0,140,130,'자연/풍경','아크릴',0,2420000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/458195c99bec38a48d717109c9f5e1cb.JPG',0,3,'김지원','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설경산수',6447,3,0,39,130,'자연/풍경','아크릴',0,670000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e64b4f4f62e6d00f32c1ebdc828231c5.JPG',0,3,'김지원','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('여름의 해변',6431,3,0,135,135,'자연/풍경','아크릴',0,2420000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/85b0e6698e260aa5bc147a87d2ac63dc.JPG',0,3,'김지원','수채화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('잉태',6433,3,0,30,54,'자연/풍경','아크릴',0,210000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5d9e3b4a992aa1fd860cfbad691c0037.JPG',0,3,'김지원','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('눈이 큰여자',6423,3,0,63,48,'자연/풍경','아크릴',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/191ebefcf1e3c5f25ff10525507aa0f2.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('밤의 요정',6425,3,1,51,68,'자연/풍경','아크릴',0,450000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e363d21da7df3dd196d36e00033952d1.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('사랑을 온 세상에',6427,3,0,256,441,'자연/풍경','아크릴',0,15040000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/47df1515f086c2beed503d8343a7f01f.JPG',0,3,'김지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('양어료험계연서',6402,3,0,140,35,'자연/풍경','아크릴',0,640000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/69e3f718839b5238462952aad667973e.JPG',0,3,'김지원','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('무제',6404,3,0,124,31,'자연/풍경','아크릴',0,500000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/eda530842a612b2abc768dbb0ba0e697.JPG',0,3,'김지원','사진');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('남자장',6406,3,0,60,45,'자연/풍경','아크릴',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5ad04f72becbf4d84a777760d35fa68d.JPG',0,3,'김지원','Water color on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('금덕마을',6479,4,0,50,60,'인물','유화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b7ca1d3bf762bb462158a665c114e0c6.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('내설악',6481,4,0,60,80,'인물','유화',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5276a2c3fcba5e18326627092c4bc712.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('누드',6483,4,0,60,45,'인물','유화',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6a71c5131c00f7ecc0b98c794cd92dc9.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('담배가게',6486,4,0,90,130,'인물','유화',0,1560000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/167d2d5439cac9937732169a0f37d9aa.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('마곡사',6488,4,0,100,80,'인물','유화',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2e59a84332fc71ef3b002aee377b2119.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('만추',6490,4,0,91,116,'인물','유화',0,1390000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/db5ade995493f13334e95c0ce41c669a.JPG',1,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 22',6562,5,0,110,120,'동식물','수채화',0,1750000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/160bbb8190f2971748648b77e408c0f0.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 24',6564,5,0,52,83,'동식물','수채화',0,550000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cf9914ec36bf9ca8671df494c94b8fea.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 26',6566,5,0,90,90,'동식물','수채화',0,1080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d6331a7ea99c718a33c278bc362a1819.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('중국풍경',6604,6,0,53,63,'사물','수묵화',0,430000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/7e2b1b184f20ee19d077cf751d5efc42.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('지곡리설경',6606,6,0,100,80,'사물','수묵화',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ab23866820684a00e4a5f25494fc5219.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('天地',6608,6,0,54,90,'사물','수묵화',0,640000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/753cedcbf7a092df81dd1f50da3a17b2.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 37',6577,5,0,90,72,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6b4de53887b9ace3e1bbac185cfadf0b.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 39',6579,5,0,90,72,'동식물','수채화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6c422dfa20241ec669def37c24154913.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 41',6581,6,0,90,73,'사물','수묵화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/87a82c8d04d28d1af6cc640bfd37ef09.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 31',6571,5,0,80,90,'동식물','수채화',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d1a6935134f4aab2f6ed9a8bcb6ebe56.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('오름, 억새',6534,5,0,50,60,'동식물','수채화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/55427445785d94a88c70d559b1257f3d.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('월출산 여름',6536,5,0,130,193,'동식물','수채화',0,3330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1148c751aa25b49b41ddd2a6a029db75.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('유채',6538,5,0,50,60,'동식물','수채화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/315638884b10efa074dc5f7abbc74292.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('女人座像',6528,5,0,193,130,'동식물','수채화',0,3330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/294ffeea0312eb0f799e44864bb67312.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('영실추경',6530,5,0,50,60,'동식물','수채화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f03b0a4df58fd5b97917db42f541ab8f.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 44',6584,6,0,90,130,'사물','수묵화',0,1560000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d2f0ad086f5ae23530f4a4803a7eab50.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 46',6586,6,0,63,73,'사물','수묵화',0,600000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b54ac2623b2814ec15e295cdf5eaeaac.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 48',6588,6,0,66,66,'사물','수묵화',0,570000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a12d993aa57a3576b8b5cb6c75d29421.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 51',6591,6,0,60,90,'사물','수묵화',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1cd75f670ef91149f748a95a13ea27ae.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주돌담',6593,6,0,45,53,'사물','수묵화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9cbcd0a46e769c5c12d4868a94cee8f8.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주마을',6595,6,0,50,60,'사물','수묵화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cf2acf46bed38bf09bcdf0e52e2bf3e3.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('탐라의 선계',6667,1,0,100,140,'추상','스케치',0,1840000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/64f7f1aac0e5980ffdd6acd0c50e9c31.JPG',0,1,'강이화','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('옛마을2',6532,5,0,97,130,'동식물','수채화',0,1680000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8dcef72052855cad93d226f572db2802.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설악2',6507,4,0,116,91,'인물','유화',0,1390000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3f88c44274adf7b5fbbac721f896bc3f.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('설악설경',6509,4,0,78,60,'인물','유화',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/34c97a52565bbab5d30aaed2aca1855c.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('성당',6511,4,0,60,50,'인물','유화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6258986ff789244e4d31a5d618bb5201.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 15',6555,5,0,100,80,'동식물','수채화',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4cad1a994c39dcd24d19328fbb0b1a5e.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 17',6557,5,0,90,80,'동식물','수채화',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/c2abb52ae872bc019072b0a4e9af5f6b.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 19',6559,5,0,85,85,'동식물','수채화',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/22d54da735f970412f2735f40771f685.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주오름',6598,6,0,53,73,'사물','수묵화',0,500000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/55a8b194d8d14530837d43f14793b07b.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주유채',6600,6,1,73,100,'사물','수묵화',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e02209a41c9fd8b2632169268a5c517d.JPG',1,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주해안',6602,6,0,50,60,'사물','수묵화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/83873ce423b7c3a7f3464d6a89608379.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('성산포',6513,4,0,97,130,'인물','유화',0,1680000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f8fb33d33a7de002e565c9be20d7c7fa.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('소나무',6515,4,0,90,72,'인물','유화',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d5532c88e4d280441995a542e33ea7df.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('스톡호롬',6517,4,0,45,53,'인물','유화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/493abae19a36d9815db66ce5364950eb.JPG',0,4,'박지원','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('어리목설경',6520,5,0,45,60,'동식물','수채화',0,360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/065560dfb3feec1a465d6214cd160f4a.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('억새',6522,5,0,50,40,'동식물','수채화',0,260000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ab97c5a7f1fc49734f1115ac42f691f8.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('억새길',6524,5,0,130,193,'동식물','수채화',0,3330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/516608b57c48393ef0505ed4c7b65d05.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('묵난도',6620,6,0,117,33,'사물','수묵화',0,500000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cb6cbe2288e135467ae5d86b6a61c1cf.JPG',1,6,'박진웅','애퀴틴트, 애칭');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('사무치는 그리움',6622,6,0,44,53,'사물','수묵화',0,280000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2a5ecc07c4399e16f335c24cd0c7139e.JPG',0,6,'박진웅','한지에 수묵채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('백두산',6639,6,0,62,145,'사물','수묵화',0,1170000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1d112cffedaf07eaf9181645fe7d7dc8.JPG',0,6,'박진웅','Bronze');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('창가의 여인',6641,1,0,59,91,'추상','스케치',0,690000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/522e460a46feaa49df7c1076d5a3e468.JPG',0,1,'강이화','한지에 수묵');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('연화세계',6643,1,0,75,144,'추상','스케치',0,1440000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bcb7556483834cc8016849ba9d5bff87.JPG',0,1,'강이화','장지에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('포은 선생시',6669,1,0,127,29,'추상','스케치',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/48a5f122a94c7dc38ee485ece527ca02.JPG',0,1,'강이화','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('한라산과 영실계곡',6709,2,0,202,100,'기타','혼합/기타',0,2680000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/97da52845ca0d4a48430604262602b80.JPG',0,2,'김현아','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('The snorklers',6711,2,0,100,125,'기타','혼합/기타',0,1650000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6c7959a1e07cb8c0119a89f00607db58.JPG',0,2,'김현아','Water color on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주 범섬',6713,2,0,40,120,'기타','혼합/기타',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/97cbf22de01f7ec03e14709a29567eca.JPG',0,2,'김현아','한지위에 혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('날마다달이태어나는섬',6684,1,0,50,145,'추상','스케치',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/85be2fb3c3f742a204bb162f629d57e5.JPG',0,1,'강이화','Mixed media on conas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('성산일출봉',6686,1,0,100,200,'추상','스케치',0,2660000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/32daf70e9fbf8e623ff7173016ed73c9.jpg',0,1,'강이화','캔버스, 아크릴');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 1',6541,5,0,60,90,'동식물','수채화',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9dc5d2a5572b867b522edb0119f5c1de.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 3',6543,5,0,50,80,'동식물','수채화',0,520000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/f1e540821d347210dbe1feb041e82945.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 5',6545,5,0,60,90,'동식물','수채화',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6e7fb69699a8eee29ffc38e35b5ca6b5.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 8',6548,5,0,65,90,'동식물','수채화',0,760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6d715cc8af039c8bedc32e3ad366ae2c.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 10',6550,5,1,90,90,'동식물','수채화',0,1080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5efc3b1c7f7eee588b5bf23835a44370.JPG',1,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('자연의소리 12',6552,5,0,65,90,'동식물','수채화',0,760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/2bf187890f7a646ed1e9918e90d78ac2.JPG',0,5,'김진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('격몽요결구',6660,1,0,102,62,'추상','스케치',0,840000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ec591d3013de1c67254a84cbee72002c.JPG',1,1,'강이화','화선지, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('금산사 설경',6662,1,0,58,123,'추상','스케치',0,930000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e53b2b1789ded6027304a06de61f624b.JPG',0,1,'강이화','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('소나무',6664,1,0,140,70,'추상','스케치',0,1290000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/76a4cf41c1a1ed972cfc23d75b17a70a.JPG',0,1,'강이화','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('시구',6703,2,0,132,67,'기타','혼합/기타',0,1170000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/721e73a7b7b674ce5343e91713fdbf75.JPG',0,2,'김현아','bronze');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('Silver fountain',6705,2,0,91,116,'기타','혼합/기타',0,1390000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4fc9acd871316e3cac13955fefb7a12a.JPG',0,2,'김현아','Crayon on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('竹下隱逸圖(죽하은일도)',6707,2,0,90,28,'기타','혼합/기타',0,330000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9fe10f9d0fa25a2736a3a9f4b0010c85.JPG',0,2,'김현아','캔버스위에 종이와 색연필');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('한라추경',6618,6,0,50,60,'사물','수묵화',0,380000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/eb59861f3301190a4a56d6b794ae6dab.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('영주정방폭포(자작시)',6744,2,0,135,70,'기타','혼합/기타',0,1240000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/10f95b2a41d9e336ab559aed7fb5077f.JPG',0,2,'김현아','한지에 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('결',6751,2,0,90,40,'기타','혼합/기타',0,480000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6e1561b551ac9d0b959063c5ddf59b14.JPG',0,2,'김현아','산소용접,동');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('무위자연',6753,2,0,97,162,'기타','혼합/기타',0,2080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1454b55e672db50184bcd2b64ddec610.jpg',0,2,'김현아','아크릴, 캔버스');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('신화의 섬',6759,2,0,90,60,'기타','혼합/기타',0,720000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6299284750d4681223691e473cfea2f0.JPG',0,2,'김현아','캔버스 아크릴릭');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('겨울 숲',6761,2,0,90,72,'기타','혼합/기타',0,860000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/be2c3220-dc87-4aae-bb5f-702578e64cb3.jpg',0,2,'김현아','캔버스 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('영산',6763,2,0,78,224,'기타','혼합/기타',0,2320000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6ada63153e5d0bac566c23ddb39ae601.jpg',0,2,'김현아','스테인레스스틸');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('長樂無極',6646,1,0,120,33,'추상','스케치',0,520000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/390d62aa91d5a62a9238b55e60e26d81.JPG',0,1,'강이화','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('십장생도',6648,1,0,90,70,'추상','스케치',0,840000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/8d49eec2ce3210b6e90ea974b16344ee.JPG',0,1,'강이화','Oil on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('생활속의 중도',6650,1,1,34,48,'추상','스케치',0,210000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b28586fff1c872c7ade06d46d0642d49.JPG',1,1,'강이화','Painting on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('달나라에 발자국을',6653,1,0,70,60,'추상','스케치',0,550000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/07c1360d2d329343c6c1c96fa948d03f.JPG',0,1,'강이화','Ink on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('지리산하 뱀사골계곡',6755,2,0,108,140,'기타','혼합/기타',0,2010000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/079b8110508500917c521579a117c2d9.jpg',0,2,'김현아','화선지 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('흔적, 기억-한라산',6765,2,0,130,162,'기타','혼합/기타',0,2800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/cf5da2423bf74d34ae2073030d9d89f5.jpg',0,2,'김현아','사진');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('백인백색',6767,2,0,80,100,'기타','혼합/기타',0,1050000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e9f086494c20944b3add093413425365.jpg',0,2,'김현아','캔버스 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('우주적인 물',6769,2,0,120,120,'기타','혼합/기타',0,1920000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/ca927adc121d3486bd9761c10b77bc76.jpg',0,2,'김현아','캔버스 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주풍경',6635,6,0,130,65,'사물','수묵화',0,1100000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d72c87fc408fefa9d7bbaf4850596a95.JPG',0,6,'박진웅','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('Tour-돌, 바람, 그 이면에서',6637,6,0,90,115,'사물','수묵화',0,1360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3e985bb0983a538191124abd4dd50771.JPG',0,6,'박진웅','Painting on chinese drawing paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('탑',6612,6,0,145,97,'사물','수묵화',0,1870000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/98178995850d791b6e48cea9a311ac01.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('토끼장',6614,6,0,112,145,'사물','수묵화',0,2160000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/4cb2a8dc53e682a201442fca4873f948.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('한라산',6616,6,0,45,53,'사물','수묵화',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9da0741d2d910c80d48fc6b7f21f2c29.JPG',0,6,'박진웅','캔버스, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주도 정방폭포',6689,1,0,90,150,'추상','스케치',0,1800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/70335bdbb482ac0700fd1c7b43d482d3.JPG',0,1,'강이화','Acrylic on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('약무수본',6691,1,0,135,35,'추상','스케치',0,620000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/de52041117fbc3ffad3f0a30d53de03b.JPG',0,1,'강이화','C-Print');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('波-외로운 바다1',6696,1,0,194,70,'추상','스케치',0,1800000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/fb546fdbfee688a1da2e45d294c3dc43.JPG',0,1,'강이화','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('융프라우에서',6698,1,0,35,68,'추상','스케치',0,310000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/321087ae3ca39895fcc66f3296a0b5ce.JPG',1,1,'강이화','화선지에 수묵담채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('풍경',6700,2,1,30,59,'기타','혼합/기타',0,210000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/7fed940507d40825aa1c6796050bf747.JPG',1,2,'김현아','Ink on korea paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('기억너머-물상',6774,2,0,60,120,'기타','혼합/기타',0,960000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5fccab83348d31fd2f870f2335e7f86a.jpg',0,2,'김현아','현무암');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('Luxury Orgasm Heart',6776,2,0,130,161,'기타','혼합/기타',0,2780000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/741fd08cdf267e00c6bc6e09aabfea3b.jpg',0,2,'김현아','부채 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('시선-회색도시',6781,2,0,59,116,'기타','혼합/기타',0,910000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/bbee898be42353d4a307a750ceb46f5b.jpg',0,2,'김현아','캔버스 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('풍경',6732,2,0,62,123,'기타','혼합/기타',0,1000000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/aadafa7ef35c66de686436becf4beb50.JPG',0,2,'김현아','판화');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('스치는 풍경-저지오름',6734,2,0,69,134,'기타','혼합/기타',0,1220000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d47bc302a88baf9069e8e34a32b998ec.JPG',0,2,'김현아','종이, 먹');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('대부귀도',6655,1,0,139,60,'추상','스케치',0,1100000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/772cc4ba9230b04fac7c0384c59f627b.JPG',0,1,'강이화','Ink on paper');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('난',6657,1,0,107,53,'추상','스케치',0,740000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/699502adc24d6fcf940f67fe66d8711e.JPG',0,1,'강이화','종이에 먹, 채색');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('제주성산일출봉',6737,2,0,49,120,'기타','혼합/기타',0,760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6e4550ef942ac76ab0bef7294c20b714.JPG',1,2,'김현아','나무 외 혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('색색풍경-화산도,제주2',6739,2,0,390,162,'기타','혼합/기타',0,8420000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/3c1af614dbd0030f55f7f7aeb3fbb640.JPG',0,2,'김현아','비디오 아트');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('목단',6741,2,0,137,56,'기타','혼합/기타',0,1000000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/b3178cd1c609dc279252e96a6d31ea64.JPG',0,2,'김현아','혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('도시 공간-서울 17',6786,2,0,100,150,'기타','혼합/기타',0,1990000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1a582a88160b0105c5adb84de819537f.jpg',0,2,'김현아','마, 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('탐라이야기',6788,2,0,97,162,'기타','혼합/기타',0,2080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6c7e4644cdceb915b6b6ceec2a0d3e67.jpg',0,2,'김현아','캔버스에 아크릴');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('금강-69잔의 물.11',6791,2,0,160,130,'기타','혼합/기타',0,2760000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/5c353af362fa0a5615b503a98dc4edf2.jpg',0,2,'김현아','캔버스에 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('갈망',6803,2,0,181,181,'기타','혼합/기타',0,4360000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/1f2c6d176b9cb3dbcd081a8511b118d4.jpg',0,2,'김현아','과슈');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('하도리의 가을',6805,2,0,117,72,'기타','혼합/기타',0,1100000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/0f8b9bf465a8a6ba7bea55c3b150bb0e.JPG',0,2,'김현아','혼합재료');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('말과 돌-황우치',6808,2,0,110,200,'기타','혼합/기타',0,2920000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/fe4a7ffd54f7449ab05633ab79ad2146.jpg',0,2,'김현아','캔버스에 아크릴릭');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('바다 보다',6810,2,0,70,210,'기타','혼합/기타',0,1940000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d86bdf6f836e795ff7eeff2ed2bb0628.jpg',1,2,'김현아','캐스팅 및 페인팅, 콜라주');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('차귀도의 여름',6715,2,0,45,307,'기타','혼합/기타',0,1820000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/d763ca90b63b40e394bca954270b960d.JPG',0,2,'김현아','캔버스에 유채');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('Restoration-image 08-28',6725,2,1,40,30,'기타','혼합/기타',0,140000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/e433dbb7311c7c54630a006c677ee02e.JPG',1,2,'김현아','Mixed Media');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('신-세한도',6719,2,0,120,160,'기타','혼합/기타',0,2540000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/23c8ca4ff0040e584c0a2c19e87e1106.JPG',0,2,'김현아','캔버스, 아크릴');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('일출봉 위를 날다',6721,2,0,60,72,'기타','혼합/기타',0,570000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/9486e6f3702f129521814dd32a334ee6.JPG',0,2,'김현아','Granite');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('무제 5966-1',6795,2,0,130,130,'기타','혼합/기타',0,2230000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/66ec6eb548c11275f1b8dfcb0a8abb5f.jpg',0,2,'김현아','모델링으로 만든 캔버스 표면 위에 아크릴 과슈물감');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('워터스케이프 1305',6797,2,0,164,250,'기타','혼합/기타',0,5440000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/a9e3e884cbb34cc9dda157697081fb94.jpg',0,2,'김현아','Acrylic on canvas, 점묘');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('사이',6799,2,0,97,163,'기타','혼합/기타',0,2080000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/6605de61a0b5f21d008e4c6a82bed6bb.jpg',0,2,'김현아','Acrylic on canvas');
Insert into ATELIER.PRODUCT (TITLE,PIDX,AIDX,AUCTION,SIZE2,SIZE1,THEME,P_TYPE,P_LIKE,PRICE,P_INTRO,FRAMED,REGIDATE,SFILE,SOLD,MIDX,M_NAME,MATERIAL) values ('이해인님의 꽃을 받는 날',6772,2,0,90,49,'기타','혼합/기타',0,570000,'기억 속의 모든 순간들이 모여서 한 사람을 이룬다고 생각합니다. 
하지만 우리의 기억은 완벽하지 못해서 잊어버리고 왜곡되고 뒤엉켜버리기도 합니다.
이것을 극복하고 싶은 마음에 순간의 기억을 의미하는 수많은 선을 긋는 작업을 시작했습니다.
이 작업은 ‘기억의 밀도’ 시리즈 중 하나입니다.  
찰나의 기억이 어떻게 다르게 남는지를 밀도의 차이로 표현해 본 작업입니다. 
밀도의 사전적 의미는 빽빽이 들어선 정도 또는 내용이 얼마나 충실한가의 정도 라고 합니다. 
삶을 살아가면서 어떤 순간들은 선명히 기억되는 반면 어떤 순간들은 무언가 비어있는 것처럼 드문드문 기억이 나기도 합니다. 
아주 짧은 찰나의 순간들에도 기억의 밀도는 다르게 남는다고 생각합니다. 
선을 긋는 간격의 차이가 각기 다른 명도로 표현이 되고 이로 인해서 이미지가 만들어집니다. 
이미지는 제가 경험한 특정 공간들에서 따오지만 이를 그대로 재현하기 보다는 제 개인적인 해석을 덧붙여 구상같기도 추상같기도 한 이미지를 만들어냅니다. 
이렇게 만들어지는 모호한 이미지가 현재 제가 생각하는 기억의 모습입니다.
종이에 펜으로 작업하였고 전면 아크릴에 검정 알루미늄 테두리로 액자가 되어 있으며 액자사이즈는 46x46cm 입니다.',1,to_date('23/11/24','RR/MM/DD'),'http://www.jeju.go.kr/files/collection/55a574472155b3c42bd327854ba9052b.jpg',0,2,'김현아','종이 먹');
REM INSERTING into ATELIER.P_LIKE
SET DEFINE OFF;
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (5,6470,4,7);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (11,6473,4,2);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (12,6475,4,2);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (13,6523,5,8);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (14,6485,4,8);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (15,6596,6,8);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (17,6607,6,8);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (18,6470,4,8);
Insert into ATELIER.P_LIKE (LIDX,PIDX,AIDX,MIDX) values (16,6473,4,8);
REM INSERTING into ATELIER.REVIEW
SET DEFINE OFF;
REM INSERTING into ATELIER.SHIPMENT
SET DEFINE OFF;
REM INSERTING into ATELIER.SUBSCRIBE
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Procedure DELMEMBER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ATELIER"."DELMEMBER" AS
BEGIN
    -- 현재 날짜로부터 30일 이전 날짜 계산
    DECLARE
        thresholdDate DATE := SYSDATE - 30;
    BEGIN
        -- enabled가 0이고 leavedate가 30일 이전인 회원 삭제
        DELETE FROM member WHERE enabled = 0 AND leavedate < thresholdDate;
        COMMIT;
    END;
END delMember;

/
--------------------------------------------------------
--  DDL for Function FN_CREATE_ORDERNO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "ATELIER"."FN_CREATE_ORDERNO" 
  return varchar2
is
  v_res varchar2(20);
  v_cnt number:=0;
begin
  select count(*) into v_cnt from order1 where oidx like to_char(sysdate,'yyyymmdd')||'%';

  if v_cnt=0 then v_res:=to_char(sysdate,'yyyymmdd')||trim('001');
  else
     select max(oidx)+1 into v_res from order1 where oidx like to_char(sysdate,'yyyymmdd')||'%';
  end if;
  return v_res;
end; 

/
--------------------------------------------------------
--  Constraints for Table APPLY
--------------------------------------------------------

  ALTER TABLE "ATELIER"."APPLY" ADD PRIMARY KEY ("APPLY_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ARTIST
--------------------------------------------------------

  ALTER TABLE "ATELIER"."ARTIST" ADD PRIMARY KEY ("AIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUCTION1
--------------------------------------------------------

  ALTER TABLE "ATELIER"."AUCTION1" ADD PRIMARY KEY ("AUC_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUCTION2
--------------------------------------------------------

  ALTER TABLE "ATELIER"."AUCTION2" ADD PRIMARY KEY ("BID_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "ATELIER"."CART" ADD PRIMARY KEY ("CIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FAQ
--------------------------------------------------------

  ALTER TABLE "ATELIER"."FAQ" ADD PRIMARY KEY ("FAQ_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "ATELIER"."MEMBER" MODIFY ("PASS" NOT NULL ENABLE);
  ALTER TABLE "ATELIER"."MEMBER" ADD PRIMARY KEY ("MIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ATELIER"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_POINT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."M_POINT" MODIFY ("POINT_IDX" NOT NULL ENABLE);
  ALTER TABLE "ATELIER"."M_POINT" ADD CONSTRAINT "M_POINT_PK" PRIMARY KEY ("POINT_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "ATELIER"."NOTICE" ADD PRIMARY KEY ("BIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table N_COMMENT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."N_COMMENT" ADD PRIMARY KEY ("CIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER1
--------------------------------------------------------

  ALTER TABLE "ATELIER"."ORDER1" ADD PRIMARY KEY ("OIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER2
--------------------------------------------------------

  ALTER TABLE "ATELIER"."ORDER2" ADD PRIMARY KEY ("O2IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."PAYMENT" ADD PRIMARY KEY ("PAYMENTCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."PRODUCT" ADD PRIMARY KEY ("PIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_LIKE
--------------------------------------------------------

  ALTER TABLE "ATELIER"."P_LIKE" ADD PRIMARY KEY ("LIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "ATELIER"."REVIEW" ADD PRIMARY KEY ("RIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SHIPMENT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."SHIPMENT" ADD PRIMARY KEY ("SIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SUBSCRIBE
--------------------------------------------------------

  ALTER TABLE "ATELIER"."SUBSCRIBE" ADD PRIMARY KEY ("SUB_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APPLY
--------------------------------------------------------

  ALTER TABLE "ATELIER"."APPLY" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ARTIST
--------------------------------------------------------

  ALTER TABLE "ATELIER"."ARTIST" ADD CONSTRAINT "MEMBER_ARTIST" FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUCTION1
--------------------------------------------------------

  ALTER TABLE "ATELIER"."AUCTION1" ADD FOREIGN KEY ("PIDX")
	  REFERENCES "ATELIER"."PRODUCT" ("PIDX") ENABLE;
  ALTER TABLE "ATELIER"."AUCTION1" ADD FOREIGN KEY ("AIDX")
	  REFERENCES "ATELIER"."ARTIST" ("AIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUCTION2
--------------------------------------------------------

  ALTER TABLE "ATELIER"."AUCTION2" ADD FOREIGN KEY ("AUC_IDX")
	  REFERENCES "ATELIER"."AUCTION1" ("AUC_IDX") ENABLE;
  ALTER TABLE "ATELIER"."AUCTION2" ADD FOREIGN KEY ("PIDX")
	  REFERENCES "ATELIER"."PRODUCT" ("PIDX") ENABLE;
  ALTER TABLE "ATELIER"."AUCTION2" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "ATELIER"."CART" ADD FOREIGN KEY ("PIDX")
	  REFERENCES "ATELIER"."PRODUCT" ("PIDX") ENABLE;
  ALTER TABLE "ATELIER"."CART" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FAQ
--------------------------------------------------------

  ALTER TABLE "ATELIER"."FAQ" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table M_POINT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."M_POINT" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "ATELIER"."NOTICE" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table N_COMMENT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."N_COMMENT" ADD FOREIGN KEY ("BIDX")
	  REFERENCES "ATELIER"."NOTICE" ("BIDX") ENABLE;
  ALTER TABLE "ATELIER"."N_COMMENT" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER1
--------------------------------------------------------

  ALTER TABLE "ATELIER"."ORDER1" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER2
--------------------------------------------------------

  ALTER TABLE "ATELIER"."ORDER2" ADD CONSTRAINT "ORDER12" FOREIGN KEY ("OIDX")
	  REFERENCES "ATELIER"."ORDER1" ("OIDX") ENABLE;
  ALTER TABLE "ATELIER"."ORDER2" ADD FOREIGN KEY ("PIDX")
	  REFERENCES "ATELIER"."PRODUCT" ("PIDX") ENABLE;
  ALTER TABLE "ATELIER"."ORDER2" ADD FOREIGN KEY ("AIDX")
	  REFERENCES "ATELIER"."ARTIST" ("AIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."PRODUCT" ADD CONSTRAINT "PRODUCT_MEMBER" FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
  ALTER TABLE "ATELIER"."PRODUCT" ADD CONSTRAINT "PRODUCT_ARTIST" FOREIGN KEY ("AIDX")
	  REFERENCES "ATELIER"."ARTIST" ("AIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table P_LIKE
--------------------------------------------------------

  ALTER TABLE "ATELIER"."P_LIKE" ADD FOREIGN KEY ("PIDX")
	  REFERENCES "ATELIER"."PRODUCT" ("PIDX") ENABLE;
  ALTER TABLE "ATELIER"."P_LIKE" ADD FOREIGN KEY ("AIDX")
	  REFERENCES "ATELIER"."ARTIST" ("AIDX") ENABLE;
  ALTER TABLE "ATELIER"."P_LIKE" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "ATELIER"."REVIEW" ADD FOREIGN KEY ("PIDX")
	  REFERENCES "ATELIER"."PRODUCT" ("PIDX") ENABLE;
  ALTER TABLE "ATELIER"."REVIEW" ADD FOREIGN KEY ("AIDX")
	  REFERENCES "ATELIER"."ARTIST" ("AIDX") ENABLE;
  ALTER TABLE "ATELIER"."REVIEW" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SHIPMENT
--------------------------------------------------------

  ALTER TABLE "ATELIER"."SHIPMENT" ADD CONSTRAINT "ORDER1SHIP" FOREIGN KEY ("OIDX")
	  REFERENCES "ATELIER"."ORDER1" ("OIDX") ENABLE;
  ALTER TABLE "ATELIER"."SHIPMENT" ADD FOREIGN KEY ("O2IDX")
	  REFERENCES "ATELIER"."ORDER2" ("O2IDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUBSCRIBE
--------------------------------------------------------

  ALTER TABLE "ATELIER"."SUBSCRIBE" ADD FOREIGN KEY ("AIDX")
	  REFERENCES "ATELIER"."ARTIST" ("AIDX") ENABLE;
  ALTER TABLE "ATELIER"."SUBSCRIBE" ADD FOREIGN KEY ("MIDX")
	  REFERENCES "ATELIER"."MEMBER" ("MIDX") ENABLE;
