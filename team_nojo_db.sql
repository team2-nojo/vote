-- USER 테이블 생성
CREATE TABLE "USER" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_GRADE"	CHAR(1)	DEFAULT '1'	NOT NULL,
	"USER_IMG"	VARCHAR2(1000)		NULL,
	"USER_EMAIL"	VARCHAR2(100)		NOT NULL,
	"USER_NICKNAME"	VARCHAR2(30)		NOT NULL,
	"USER_PW"	VARCHAR2(100)		NOT NULL,
	"USER_ADD"	VARCHAR2(1000)		NOT NULL,
	"USER_ABOUT_ME"	VARCHAR2(4000)		NULL,
	"USER_SOCIAL_LOGIN"	VARCHAR2(100)		NULL,
	"USER_ENDROLL_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"USER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_USER_NO NOCACHE;


-- 샘플 데이터 삽입
INSERT INTO "USER"
VALUES (SEQ_USER_NO.NEXTVAL, '2', '/resources/images/mainPage/profile1.jpeg', 'manage01@kh.or.kr',
		'관리자1', 'pass01!', '서울시 중구 남대문로 120 대일빌딩 2층', '관리자 1 입니다.', NULL, DEFAULT, DEFAULT);


INSERT INTO "USER"
VALUES (SEQ_USER_NO.NEXTVAL, 1, '/resources/images/mainPage/profile2.jpeg', 'user02@kh.or.kr',
		'유저이번', 'pass02!', '서울시 종로구 종로 55', '유저 이 번 입니다.', NULL, DEFAULT, DEFAULT);

INSERT INTO "USER"

VALUES (SEQ_USER_NO.NEXTVAL, 1, '/resources/images/mainPage/profile3.jpeg', 'user03@kh.or.kr',
		'유저삼번', 'pass03!', '서울시 중구 을지로 51', '유저 삼 번 입니다.', NULL, DEFAULT, DEFAULT);

INSERT INTO "USER"
VALUES (SEQ_USER_NO.NEXTVAL, 1, '/resources/images/mainPage/profile4.jpeg', 'user04@kh.or.kr',
		'유저사번', 'pass04!', '서울시 중구 을지로 30', '유저 사 번 입니다.', NULL, DEFAULT, DEFAULT);


-- USER 테이블 코멘트
COMMENT ON COLUMN "USER"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "USER"."USER_GRADE" IS '회원 등급(1:일반/2:관리자)';

COMMENT ON COLUMN "USER"."USER_IMG" IS '회원 이미지(이미지주소)';

COMMENT ON COLUMN "USER"."USER_EMAIL" IS '회원 이메일(중복불가)';

COMMENT ON COLUMN "USER"."USER_NICKNAME" IS '회원 닉네임(중복불가)';

COMMENT ON COLUMN "USER"."USER_PW" IS '회원 비밀번호(암호화)';

COMMENT ON COLUMN "USER"."USER_ADD" IS '회원 주소';

COMMENT ON COLUMN "USER"."USER_ABOUT_ME" IS '회원 자기소개';

COMMENT ON COLUMN "USER"."USER_SOCIAL_LOGIN" IS '회원 소셜로그인(카카오톡)';

COMMENT ON COLUMN "USER"."USER_ENDROLL_DT" IS '회원 가입일';

COMMENT ON COLUMN "USER"."USER_DEL_FL" IS '회원 탈퇴여부(Y:탈퇴/N:탈퇴X)';








-- FAQ 테이블 생성
CREATE TABLE "FAQ" (
	"FAQ_NO"	NUMBER		NOT NULL,
	"FAQ_CAT_CODE"	NUMBER		NULL,
	"FAQ_QUESTIONI"	VARCHAR2(2000)		NULL,
	"FAQ_ANSWER"	CLOB		NULL
);

-- 시퀀스 생성
CREATE SEQUENCE SEQ_FAQ_NO NOCACHE;



-- FAQ 테이블 코멘트 생성
COMMENT ON COLUMN "FAQ"."FAQ_NO" IS 'FAQ번호 (SEQ_FAQ_NO)';

COMMENT ON COLUMN "FAQ"."FAQ_CAT_CODE" IS 'FAQ 질문 분류코드';

COMMENT ON COLUMN "FAQ"."FAQ_QUESTIONI" IS 'FAQ 질문';

COMMENT ON COLUMN "FAQ"."FAQ_ANSWER" IS 'FAQ  답변';

-- COMMENT 테이블 생성
CREATE TABLE "COMMENT" (
	"CM_NO"	NUMBER		NOT NULL,
	"PT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CM_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"CM_DATE"	DATE		NOT NULL,
	"CM_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

-- 시퀀스 생성
CREATE SEQUENCE SEQ_CM_NO NOCACHE;



-- COMMENT 테이블 코멘트 생성
COMMENT ON COLUMN "COMMENT"."CM_NO" IS '댓글 번호(SEQ_CM_NO)';

COMMENT ON COLUMN "COMMENT"."PT_NO" IS '글번호(SEQ_PT_NO)';

COMMENT ON COLUMN "COMMENT"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "COMMENT"."CM_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."CM_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."CM_DEL_FL" IS '댓글 삭제(삭제:Y, 유지:N)';







-- PETITION 테이블 생성
CREATE TABLE "PETITION" (
	"PT_NO"	NUMBER		NOT NULL,
	"PT_TITLE"	VARCHAR2(2000)		NOT NULL,
	"PT_CONTENT"	CLOB	NOT	NULL,
	"PT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"PT_VIEW_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"PT_VICT"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"PT_IMG"	VARCHAR2(1000)		NULL,
	"PT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CAT_NO"	NUMBER		NOT NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_PT_NO NOCACHE;

-- PETITION 테이블 코멘트 생성
COMMENT ON COLUMN "PETITION"."PT_NO" IS '글번호(SEQ_PT_NO)';

COMMENT ON COLUMN "PETITION"."PT_TITLE" IS '글 제목';


COMMENT ON COLUMN "PETITION"."PT_CONTENT" IS '글 내용';

COMMENT ON COLUMN "PETITION"."PT_DATE" IS '작성일';

COMMENT ON COLUMN "PETITION"."PT_VIEW_COUNT" IS '글 조회수';

COMMENT ON COLUMN "PETITION"."PT_VICT" IS '승리여부(Y:승리 N:승리X)';

COMMENT ON COLUMN "PETITION"."PT_IMG" IS '글 이미지';

COMMENT ON COLUMN "PETITION"."PT_DEL_FL" IS '글 삭제 여부(Y:삭제/N:삭제X)';

COMMENT ON COLUMN "PETITION"."USER_NO" IS '회원번호(SEQ_USER_NO)';

COMMENT ON COLUMN "PETITION"."CAT_NO" IS '카테고리 코드(SEQ_CAT_NO)';

COMMENT ON COLUMN "PETITION"."PT_IMG" IS '글 이미지';

COMMENT ON COLUMN "PETITION"."PT_DEL_FL" IS '글 삭제 여부(Y:삭제/N:삭제X)';

COMMENT ON COLUMN "PETITION"."USER_NO" IS '회원번호(SEQ_USER_NO)';

COMMENT ON COLUMN "PETITION"."CAT_NO" IS '카테고리 코드(SEQ_CAT_NO)';




-- QNA 테이블 생성
CREATE TABLE "QNA" (
	"QNA_NO"	VARCHAR2(100)		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"QNA_CAT_CODE"	NUMBER		NOT NULL,
	"QNA_STATUS"	CHAR(1)	DEFAULT '1'	NOT NULL,
	"QNA_TITLE"	VARCHAR2(100)		NOT NULL,
	"QNA_CONT"	CLOB		NOT NULL,
	"QNA_CREATE_DT"	VARCHAR2(100)	DEFAULT SYSDATE	NOT NULL,
	"QNA_ANSWER"	CLOB		NULL,
	"QNA_COMPLETED_DT"	VARCHAR2(100)		NULL,
	"QNA_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_QNA_NO NOCACHE;


-- QNA 테이블 코멘트 생성
COMMENT ON COLUMN "QNA"."QNA_NO" IS '문의 번호(SEQ_QNA_NO)';

COMMENT ON COLUMN "QNA"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "QNA"."QNA_CAT_CODE" IS '문의 분류코드';

COMMENT ON COLUMN "QNA"."QNA_STATUS" IS '문의상태(1:문의대기, 2:진행중, 3:해결완료)';

COMMENT ON COLUMN "QNA"."QNA_TITLE" IS '문의  제목';

COMMENT ON COLUMN "QNA"."QNA_CONT" IS '문의 내용';

COMMENT ON COLUMN "QNA"."QNA_CREATE_DT" IS '문의 생성일자';

COMMENT ON COLUMN "QNA"."QNA_ANSWER" IS '문의답변';

COMMENT ON COLUMN "QNA"."QNA_COMPLETED_DT" IS '문의 완료일자';

COMMENT ON COLUMN "QNA"."QNA_DEL_FL" IS '문의 삭제(Y:삭제/N:삭제X)';






-- PETITION UPDATE 테이블 생성
CREATE TABLE "PETITION_UPDATE" (
	"UP_NO"	NUMBER		NOT NULL,
	"UP_TITLE"	VARCHAR2(600)		NOT NULL,
	"UP_CONTENT"	CLOB		NOT NULL,
	"UP_CREATE_DT"	DATE		NOT NULL,
	"UP_IMG"	VARCHAR2(1000)		NULL,
	"UP_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"PT_NO"	NUMBER		NOT NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_UP_NO NOCACHE;


-- PETITION UPDATE 코멘트 작성
COMMENT ON COLUMN "PETITION_UPDATE"."UP_NO" IS '업데이트 글번호(SEQ_UP_NO)';

COMMENT ON COLUMN "PETITION_UPDATE"."UP_TITLE" IS '업데이트  제목';

COMMENT ON COLUMN "PETITION_UPDATE"."UP_CONTENT" IS '업데이트 내용';

COMMENT ON COLUMN "PETITION_UPDATE"."UP_CREATE_DT" IS '업데이트  작성일';

COMMENT ON COLUMN "PETITION_UPDATE"."UP_IMG" IS '업데이트 이미지';

COMMENT ON COLUMN "PETITION_UPDATE"."UP_DEL_FL" IS '업데이트 삭제 여부 (Y:삭제/N:삭제X)';

COMMENT ON COLUMN "PETITION_UPDATE"."PT_NO" IS '글번호(SEQ_PT_NO)';






-- COMMENT RESP 테이블 생성
CREATE TABLE "COMMENT_RESP" (
	"CM_RESP_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CM_NO"	NUMBER		NOT NULL,
	"CM_FL"	CHAR(1)		NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_RESP_NO NOCACHE;


-- COMMENT RESP 코멘트 생성
COMMENT ON COLUMN "COMMENT_RESP"."CM_RESP_NO" IS '댓글 좋아요  번호(SEQ_RESP_NO)';

COMMENT ON COLUMN "COMMENT_RESP"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "COMMENT_RESP"."CM_NO" IS '댓글 번호(SEQ_CM_NO)';

COMMENT ON COLUMN "COMMENT_RESP"."CM_FL" IS '댓글 반응 구분(좋아요:Y, 싫어요:N)';







-- PETITION_CATEGORY_LIST 테이블 생성
CREATE TABLE "PETITION_CATEGORY_LIST" (

	"CAT_NO"	NUMBER		NOT NULL,
	"CAT_NAME"	VARCHAR2(300)		NOT NULL,
	"CAT_MAIN_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

-- 시퀀스 생성
CREATE SEQUENCE SEQ_CAT_NO NOCACHE;


-- PETITION_CATEGORY 테이블 코멘트 생성
COMMENT ON COLUMN "PETITION_CATEGORY"."CAT_NO" IS '카테고리 코드(SEQ_CAT_NO)';


-- PETITION_CATEGORY_LIST 테이블 코멘트 생성
COMMENT ON COLUMN "PETITION_CATEGORY_LIST"."CAT_NO" IS '청원 카테고리 목록 코드(SEQ_CAT_NO)';

COMMENT ON COLUMN "PETITION_CATEGORY_LIST"."CAT_NAME" IS '청원 카테고리 목록 이름';

COMMENT ON COLUMN "PETITION_CATEGORY_LIST"."CAT_MAIN_FL" IS '청원 카테고리 메인 노출여부(Y:기본카테고리/N:회원이 생성한 카테고리)';





-- PETITION_LIKE 테이블 생성
CREATE TABLE "PETITION_LIKE" (
	"PT_LIKE_NO"	NUMBER		NULL,
	"PT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_PT_LIKE_NO NOCACHE;


-- PETITION_LIKE 코멘트 생성
COMMENT ON COLUMN "PETITION_LIKE"."PT_LIKE_NO" IS '청원 좋아요 번호(SEQ_PT_LIKE_NO)';

COMMENT ON COLUMN "PETITION_LIKE"."PT_NO" IS '글번호(SEQ_PT_NO)';

COMMENT ON COLUMN "PETITION_LIKE"."USER_NO" IS '회원 번호(SEQ_USER_NO)';











-- MANAGE_PAGE 테이블 생성
CREATE TABLE "MANAGE_PAGE" (
	"MANAGE_DATE"	DATE		NOT NULL,
	"MNG_VISIT"	NUMBER	DEFAULT 0	NOT NULL,
	"MNG_USER"	NUMBER		NOT NULL
);



-- MANAGE_PAGE 코멘트
COMMENT ON COLUMN "MANAGE_PAGE"."MANAGE_DATE" IS '관리일자';

COMMENT ON COLUMN "MANAGE_PAGE"."MNG_VISIT" IS '방문자수';

COMMENT ON COLUMN "MANAGE_PAGE"."MNG_USER" IS '회원가입수';












-- FAQ_CAT 테이블 생성
CREATE TABLE "FAQ_CAT" (
	"FAQ_CAT_NO"	NUMBER		NOT NULL,
	"FAQ_CAT_NAME"	VARCHAR2(1000)		NOT NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SQE_QNA_CAT_NO NOCACHE;


-- FAQ_CAT 코멘트 작성
COMMENT ON COLUMN "FAQ_CAT"."FAQ_CAT_NO" IS '카테고리 번호(SQE_QNA_CAT_NO)';

COMMENT ON COLUMN "FAQ_CAT"."FAQ_CAT_NAME" IS '카테고리 이름';










-- REPORT 테이블 생성
CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PT_NO"	NUMBER		NOT NULL,
	"REPORT_CAT_NO"	NUMBER		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REPORT_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REPORT_STATUS"	CHAR(1)	DEFAULT 1	NOT NULL,
	"REPORT_PROCESS"	VARCHAR2(4000)		NULL
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_REPORT_NO NOCACHE;

-- REPORT 테이블 코멘트 생성
COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호(SEQ_REPORT_NO)';

COMMENT ON COLUMN "REPORT"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "REPORT"."PT_NO" IS '글번호(SEQ_PT_NO)';

COMMENT ON COLUMN "REPORT"."REPORT_CAT_NO" IS '신고카테고리번호(SEQ_REPORT_CAT_NO)';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고 내용';

COMMENT ON COLUMN "REPORT"."REPORT_DT" IS '신고 일자';

COMMENT ON COLUMN "REPORT"."REPORT_STATUS" IS '신고 상태(1:미처리 2:처리)';

COMMENT ON COLUMN "REPORT"."REPORT_PROCESS" IS '처리내용(관리자가 추후 작성)';



---- REPORT_CATEGORY 테이블 생성
CREATE TABLE "REPORT_CATEGORY" (
	"REPORT_CAT_NO"	NUMBER		NOT NULL,
	"REPORT_CAT_NAME"	VARCHAR2(1000)		NOT NULL
);



-- 시퀀스 생성
CREATE SEQUENCE SEQ_REPORT_CAT_NO NOCACHE;


-- REPORT_CATEGORY 코멘트 생성
COMMENT ON COLUMN "REPORT_CATEGORY"."REPORT_CAT_NO" IS '신고 카테고리 번호(SEQ_REPORT_CAT_NO)';

COMMENT ON COLUMN "REPORT_CATEGORY"."REPORT_CAT_NAME" IS '신고 카테고리 이름';





---- PETITION_CATEGORY 테이블 생성
CREATE TABLE "PETITION_CATEGORY" (
	"PT_NO"	NUMBER		NOT NULL,
	"CAT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PETITION_CATEGORY"."PT_NO" IS '글번호(SEQ_PT_NO)';

COMMENT ON COLUMN "PETITION_CATEGORY"."CAT_NO" IS '카테고리 코드(SEQ_CAT_NO)';



-- REPORT_CATEGORY 코멘트 생성
COMMENT ON COLUMN "REPORT_CATEGORY"."REPORT_CAT_NO" IS '신고 카테고리 번호(SEQ_REPORT_CAT_NO)';

COMMENT ON COLUMN "REPORT_CATEGORY"."REPORT_CAT_NAME" IS '신고 카테고리 이름';





-- 프라이머리키 생성
ALTER TABLE "USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQ_NO"
);


ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"CM_NO"
);


ALTER TABLE "PETITION" ADD CONSTRAINT "PK_PETITION" PRIMARY KEY (
	"PT_NO"
);


-- 프라이머리키 생성
ALTER TABLE "USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQ_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"CM_NO"
);

ALTER TABLE "PETITION" ADD CONSTRAINT "PK_PETITION" PRIMARY KEY (
	"PT_NO"
);

ALTER TABLE "QNA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY (
	"QNA_NO"
);

ALTER TABLE "PETITION_UPDATE" ADD CONSTRAINT "PK_PETITION_UPDATE" PRIMARY KEY (
	"UP_NO"
);

ALTER TABLE "COMMENT_RESP" ADD CONSTRAINT "PK_COMMENT_RESP" PRIMARY KEY (
	"CM_RESP_NO"
);

ALTER TABLE "PETITION_CATEGORY_LIST" ADD CONSTRAINT "PK_PETITION_CATEGORY_LIST" PRIMARY KEY (
	"CAT_NO"

);

ALTER TABLE "PETITION_LIKE" ADD CONSTRAINT "PK_PETITION_LIKE" PRIMARY KEY (
	"PT_LIKE_NO"
);

ALTER TABLE "MANAGE_PAGE" ADD CONSTRAINT "PK_MANAGE_PAGE" PRIMARY KEY (
	"MANAGE_DATE"
);

ALTER TABLE "FAQ_CAT" ADD CONSTRAINT "PK_FAQ_CAT" PRIMARY KEY (
	"FAQ_CAT_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "REPORT_CATEGORY" ADD CONSTRAINT "PK_REPORT_CATEGORY" PRIMARY KEY (
	"REPORT_CAT_NO"
);


ALTER TABLE "PETITION_CATEGORY" ADD CONSTRAINT "PK(CK)_PETITION_CATEGORY" PRIMARY KEY (

"CAT_NO",

"PT_NO"

);




-- 외래키 생성
ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_PETITION_TO_COMMENT_1" FOREIGN KEY (
	"PT_NO"
)
REFERENCES "PETITION" (
	"PT_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_USER_TO_COMMENT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "PETITION" ADD CONSTRAINT "FK_USER_TO_PETITION_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);


ALTER TABLE "PETITION" ADD CONSTRAINT "FK_PETITION_CATEGORY_LIST_TO_PETITION_1" FOREIGN KEY (
	"CAT_NO"
)
REFERENCES "PETITION_CATEGORY_LIST" (

	"CAT_NO"
);

ALTER TABLE "QNA" ADD CONSTRAINT "FK_USER_TO_QNA_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "PETITION_UPDATE" ADD CONSTRAINT "FK_PETITION_TO_PETITION_UPDATE_1" FOREIGN KEY (
	"PT_NO"
)
REFERENCES "PETITION" (
	"PT_NO"
);

ALTER TABLE "COMMENT_RESP" ADD CONSTRAINT "FK_USER_TO_COMMENT_RESP_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "COMMENT_RESP" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_RESP_1" FOREIGN KEY (
	"CM_NO"
)
REFERENCES "COMMENT" (
	"CM_NO"
);

ALTER TABLE "PETITION_LIKE" ADD CONSTRAINT "FK_PETITION_TO_PETITION_LIKE_1" FOREIGN KEY (
	"PT_NO"
)
REFERENCES "PETITION" (
	"PT_NO"
);

ALTER TABLE "PETITION_LIKE" ADD CONSTRAINT "FK_USER_TO_PETITION_LIKE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_USER_TO_REPORT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_PETITION_TO_REPORT_1" FOREIGN KEY (
	"PT_NO"
)
REFERENCES "PETITION" (
	"PT_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_REPORT_CATEGORY_TO_REPORT_1" FOREIGN KEY (
	"REPORT_CAT_NO"
)
REFERENCES "REPORT_CATEGORY" (
	"REPORT_CAT_NO"
);



ALTER TABLE "PETITION_CATEGORY" ADD CONSTRAINT "FK_PETITION_TO_PETITION_CATEGORY_1" FOREIGN KEY (
	"PT_NO"
)
REFERENCES "PETITION" (
	"PT_NO"
);

ALTER TABLE "PETITION_CATEGORY" ADD CONSTRAINT "FK_PETITION_CATEGORY_LIST_TO_PETITION_CATEGORY_1" FOREIGN KEY (
	"CAT_NO"
)
REFERENCES "PETITION_CATEGORY_LIST" (
	"CAT_NO"
);



