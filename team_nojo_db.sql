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
	
INSERT INTO "USER"
VALUES (SEQ_USER_NO.NEXTVAL, 1, '/resources/images/mainPage/profile5.jpeg', 'user05@kh.or.kr',
		'유저오번', 'pass05!', '서울시 중구 을지로 250', '유저 오 번 입니다.', NULL, DEFAULT, DEFAULT);
	
INSERT INTO "USER"
VALUES (SEQ_USER_NO.NEXTVAL, 1, '/resources/images/mainPage/profile6.jpeg', 'user06@kh.or.kr',
		'유저육번', 'pass06!', '서울시 중구 종로 3', '유저 육 번 입니다.', NULL, DEFAULT, DEFAULT);
	
INSERT INTO "USER"
VALUES (SEQ_USER_NO.NEXTVAL, 1, '/resources/images/mainPage/profile7.jpeg', 'user07@kh.or.kr',
		'유저칠번', 'pass07!', '서울시 종로 율곡로 2', '유저 칠 번 입니다.', NULL, DEFAULT, DEFAULT);
	
	

COMMIT;
	

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


--PETITION 샘플데이터
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '尹, 중·러 겨냥…“힘에 의한 현상 변경, 꿈꿀 수 없게 해야"', 
'윤석열 대통령은 28일(현지시간) 보스턴 하버드 대학 케네디스쿨에서 연설하면서 다른 나라의 자유를 무시하는 힘에 의한 현상 변경 시도’에 국제사회는 용기 있고 결연한 연대로서 대응해야 한다고 밝혔다. 하버드대에서 현직 대통령이 연설하는 것은 처음이다. 윤 대통령은...', 
TO_DATE('2022-05-10', 'YYYY-MM-DD'), 152, 'N', 'resources/images/mainPage/news1.jpeg', 'N', 3, 1);

INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '손흥민, 1골 추가하면 호날두와 동률 … 7년 연속 리그 10호 골 안필드에서 터질까', 
'이번에는 안필드다. 지난 주 맨유를 상대로 극적인 동점골을 터트리며 팀을 위기에서 구해낸 손흥민이 5월 1일 월요일(한국시간) 새벽 0시 30분 리버풀 원정에서 2경기 연속 골에 도전한다.올 시즌 리그 9호 골을 기록한 손흥민은 최근 리그 10경기에서 5골을 넣으며 완연한 회복세를 보이...', 
TO_DATE('2022-05-29', 'YYYY-MM-DD'), 32352, 'N', 'resources/images/mainPage/news2.jpeg', 'N', 2, 2);

INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '"나폴리 우승, 이번주 안돼".. 라치오 감독도 단장도 한목소리 다짐', 
'이 경기는 나폴리의 우승과 직결된다는 점에서 많은 팬들의 관심이 쏠려 있다. 2위 라치오가 이날 경기에서 이기지 못할 경우 나폴리의 세리에 A 우승이 눈앞에 다가서기 때문이다. 나폴리가 인테르-라치오전에 이어 열리는 살레르니타나와 맞대결에서 승리할 경우 33년 만의 우승을 확정짓게 된다. ',
TO_DATE('2021-09-11', 'YYYY-MM-DD'), 5678, 'N', 'resources/images/mainPage/news3.jpeg', 'N', 1, 1);

INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '[단독]현대차, 아이오닉6 N 개발 착수…"고성능 전기차로 中 승부수"', 
'아이오닉6 N은 제품 개발을 거쳐 2025년 하반기부터 현대차 아산공장에서 내수와 유럽·호주 수출 물량을 우선 생산한다. 2026년 초부터는 북미·중국 물량을 추가로 생산한다. 호주 등을 위해 좌핸들 차량 외에 우핸들 차량도 선보인다.주력 시장은 중국이다. 현대차는 ',
TO_DATE('2023-01-22', 'YYYY-MM-DD'), 31528, 'N', 'resources/images/mainPage/news4.jpeg', 'N', 4, 2);

INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '바이든, ‘요즘 신나’…“1조원 날린 폭스 뉴스, 공짜밥 먹으러” 농담',
 '조 바이든 미국 대통령이 백악관 출입기자들과의 연례 만찬 행사에서 손해배상 소송에 대해 7억8750만달러(약 1조560억원)를 합의금으로 물기로 한 <폭스 뉴스>를 마음껏 놀렸다.바이든 대통령은 29일 저녁(현지시각) 백악관 출입기자협회 연례',
TO_DATE('2023-03-23', 'YYYY-MM-DD'), 1911, 'N', 'resources/images/mainPage/news5.jpeg', 'N', 5, 3);

INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '주가 상승엔 성장과 실적 확신이 필요하다',
 '최근 국내 증시가 불안한 흐름을 보이고 있다. 이달 중순까지 910포인트에 근접하며 빠르게 오르던 코스닥 지수는 며칠 새 10% 가까이 급락했고, 코스피 역시 5거래일 연속 하락하며 위축된 투자심리를 보여주고 있다. 같은 기간 글로벌 증시 역시 상승세가 꺾였기 때문에 증시 부진을 우리만의 일이라 볼 순 없다.',
TO_DATE('2023-02-11', 'YYYY-MM-DD'), 88852, 'N', 'resources/images/mainPage/news6.jpeg', 'N', 6, 1);


--7
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '15억 손해 보고 바꿨다… 김남국, 작년 2월 ‘이상한 코인 교환’',
 '김남국 의원의 ‘위믹스 코인 60억원 보유’ 논란을 수사 중인 검찰이 15일 가상 화폐 거래소인 업비트와 빗썸, 카카오 계열사 등에 대한 압수 수색에 나섰다. 김 의원이 코인 논란으로 지난 14일 더불어민주당을 탈당한 지 하루 만에 김 의원의 가상 화폐 거래 내역 확보에 나선 것이다. 앞서 작년 10~11월 검찰은 김 의원이 보유하고 ',
TO_DATE('2023-03-11', 'YYYY-MM-DD'), 666234, 'N', 'resources/images/mainPage/news7.jpeg', 'N', 2, 2);

--8
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '테슬라 돌아온 머스크… “모든 채용 계획 보고하라”',
 'CNBC는 15일(현지시각) 일론 머스크 테슬라 최고경영자(CEO)가 테슬라 직원 전체에 메일을 보내 “일주일에 한 번 부서 채용 요청 목록을 보내달라”고 요청했다고 보도했다. 그는 메일에서 “우리 채용에 대해 더 잘 이해하고 싶다”고 했다.머스크는 이 메일에서 “(나에게) ',
TO_DATE('2023-04-11', 'YYYY-MM-DD'), 356457, 'N', 'resources/images/mainPage/news8.jpeg', 'N', 2, 3);


--9
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '"마약 5종 투약 혐의" 유아인, 2차 소환 조사…미대 출신 작가도 출석 [MD이슈](종합)',
 '유아인은 16일 오전 9시께 서울 마포구 서울경찰청 광역수사단에 도착해 기자로부터 심경 질문을 받고 "성실히 조사에 임하겠다"고 답했다.당초 유아인은 지난 11일 2차 소환 조사에 임할 예정이었으나 청사 앞에 대기하는 취재진이 많다는 이유로 조사를 돌연 취소한 것으로 알려졌다. ',
TO_DATE('2023-05-11', 'YYYY-MM-DD'), 12357, 'N', 'resources/images/mainPage/news9.jpeg', 'N', 3, 2);

--10
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '"인어공주" 더빙판 에리얼=뉴진스 다니엘 “여전히 배울 게 많아” [화보]',
 '최근 영화 ‘인어공주’ 한국어 더빙판의 주인공 ‘에리얼’ 역할을 맡은 다니엘. 그는 “부모님께서 어려서부터 음악에 관련된 다양한 경험을 시켜주셨다”며 “여전히 배울 게 많다고 느껴서 여러 무대도 찾아보고 선배님들의 노래도 들으면서 제가 할 수 있는 걸 끊임없이 탐구 중”이라고 말했다. ',
TO_DATE('2023-06-11', 'YYYY-MM-DD'), 78564, 'N', 'resources/images/mainPage/news10.jpeg', 'N', 4,1);

--11
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '"패션 관심 많은 김건희" WP 쓴 단어 뭐길래…"무례" 美독자 발끈',
 '12일(현지시간) WP는 독자 의견 기고란에 "한국 대통령 부인을 모욕하지 말라"(Please don’t insult South Korea’s first lady)는 제목의 글을 게재했다.버지니아주 폴스처치에 사는 독자 로널드 하이탈라가 보낸 해당 글에서 필자는 지난달 27일 WP 기사에서 김 여사에 대해 "clotheshorse"라고 표현한 것을 지적하면서 이 같은 부정적 논평은 무례하다고 밝혔다.',
TO_DATE('2013-02-11', 'YYYY-MM-DD'), 23453, 'N', 'resources/images/mainPage/news11.jpeg', 'N', 5, 3);

--12
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, 'LG유플러스, 1분기 영업익 2602억…전년 동기 대비 0.4% 하락',
 'LG유플러스는 연결 기준 올해 1분기 영업이익이 2602억원으로 지난해 동기보다 0.4% 감소한 것으로 잠정 집계됐다고 11일 공시했다.영업수익(매출)은 3조5413억원으로 작년 동기 대비 3.9% 증가했다. 영업수익에서 단말 수익을 제외한 서비스수익은 2조8243억원으로 1.8% 상승했다. 순이익은 1551억원으로 9% 줄었다. ',
TO_DATE('2003-02-11', 'YYYY-MM-DD'), 7945, 'N', 'resources/images/mainPage/news12.jpeg', 'N', 6, 2);

--13
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '푸틴 "유물" 탱크 한대 사열…우크라 "러 탱크, 우리 노획한 게 더 많아" 조롱',
 '러시아 모스크바 붉은광장에서 9일(현지시간) 전승절 기념식이 열린 가운데 어느 때보다 축소돼 운영된 전차 열병식에 이목이 쏠린다.전승절 기념식은 제2차 세계 대전에서 나치 독일의 항복을 받아내 승리한 전승일을 기념하는 행사로 러시아는 이날을 국경일로 지정해 매년 대대적으로 기념해왔다. 특히 이날은 러시아에서 새롭게 개발한 군사장비들을 전세계에 과시하는 날이기도 했다.',
TO_DATE('2013-02-11', 'YYYY-MM-DD'), 3423, 'N', 'resources/images/mainPage/news13.jpeg', 'N', 1, 1);

--14
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '美정보수장 "中, 대만 침공→세계 연간 1300조원 피해"',
 '중국의 대만 침공으로 대만의 반도체 수출이 중단된다면 세계 경제가 연간 최대 1천300조원의 피해를 입을 수 있다고 미국 정보수장이 밝혔다.
애브릴 헤인스 미 국가정보국(DNI) 국장은 4일(현지시간) 상원 군사위원회 청문회에서 "중국 또한 반도체를 구하지 못하면 중국 국내총생산(GDP)에도 큰 악영향이 있을 것"이라며 이같이 밝혔다.헤인스 국장은 "대만이 첨단 반도체의 90% 이상을 생산하는데 그 반도체는 전 세계의 거의 모든 종류의 전자기기에 들어간다"며 "중국이 대만을 침공할 경우 TSMC의 반도체 생산이 중단되',
TO_DATE('2023-12-11', 'YYYY-MM-DD'), 12345, 'N', 'resources/images/mainPage/news14.jpeg', 'N', 2, 3);

--15
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '英석학 "후쿠시마 오염수, 마셔도 돼"…"당장 마셔주세요"',
 '정부의 후쿠시마 오염수 시찰단 일본 방문이 약 1주일 앞둔 가운데 해외 석학이 오염수의 위험성이 과장됐다며 "마실 수 있다"고 발언해 논란이 일고 있다.방사선 분야에서 세계적인 석학으로 꼽히는 웨이드 앨리슨 영국 옥스퍼드대 물리학과 명예교수(82)는 15일 한국원자력연구원과 한국원자력학회가 "저선량 방사선 영향과 후쿠시마 오염수 논란-공포가 집어삼킨 과학"을 주제로 연 기자간담회에서',
TO_DATE('2023-02-20', 'YYYY-MM-DD'), 3256, 'N', 'resources/images/mainPage/news15.jpeg', 'N', 3, 2);

--16
INSERT INTO "PETITION"
VALUES (SEQ_PT_NO.NEXTVAL, '여고생 노렸다…필로폰 중독시켜 판매 동원한 마약판매상들',
 '대구지방검찰청은 대구 주요 마약 판매상 등 8명을 구속 기소하고 마약 투여자 1명을 불구속 기소했다고 16일 밝혔다. 검찰은 마약 판매상의 권유로 마약에 손을 댄 여고생에 대해서는 중독 판별 검사를 통한 치료 가능 여부 등을 확인하기 위해 시한부 기소 중지 결정을 내렸다.검찰에 따르면 A(18)양은 고등학생이던 지난 2020년 알',
TO_DATE('2023-02-11', 'YYYY-MM-DD'), 123123, 'N', 'resources/images/mainPage/news16.jpe', 'N', 2, 2);


COMMIT;


SELECT * FROM "PETITION";






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


-- PETITION_CATEGORY_LIST 테이블 코멘트 생성
COMMENT ON COLUMN "PETITION_CATEGORY_LIST"."CAT_NO" IS '청원 카테고리 목록 코드(SEQ_CAT_NO)';

COMMENT ON COLUMN "PETITION_CATEGORY_LIST"."CAT_NAME" IS '청원 카테고리 목록 이름';

COMMENT ON COLUMN "PETITION_CATEGORY_LIST"."CAT_MAIN_FL" IS '청원 카테고리 메인 노출여부(Y:기본카테고리/N:회원이 생성한 카테고리)';




INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'동물',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'형사 사법',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'장애',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'경제적 정의',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'교육',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'엔터테인먼트',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'환경',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'가족',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'정치',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'음식',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'건강',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'인권',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'이민',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'기술',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'여성 인권',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'LGBTQ 인권',
	'Y'
);
INSERT INTO PETITION_CATEGORY_LIST VALUES(
	SEQ_CAT_NO.NEXTVAL,
	'독립',
	'Y'
);




-- PETITION_LIKE 테이블 생성
CREATE TABLE "PETITION_LIKE" (
	"PT_LIKE_NO"	NUMBER		NULL,
	"PT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);

SELECT * FROM "PETITION_LIKE";

-- 시퀀스 생성
CREATE SEQUENCE SEQ_PT_LIKE_NO NOCACHE;


-- PETITION_LIKE 코멘트 생성
COMMENT ON COLUMN "PETITION_LIKE"."PT_LIKE_NO" IS '청원 좋아요 번호(SEQ_PT_LIKE_NO)';

COMMENT ON COLUMN "PETITION_LIKE"."PT_NO" IS '글번호(SEQ_PT_NO)';

COMMENT ON COLUMN "PETITION_LIKE"."USER_NO" IS '회원 번호(SEQ_USER_NO)';



INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 79, 2);
INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 79, 3);
INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 79, 4);

INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 83, 2);
INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 83, 1);
INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 83, 3);

INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 92, 2);
INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 92, 4);
INSERT INTO "PETITION_LIKE"
VALUES (SEQ_PT_LIKE_NO.NEXTVAL, 92, 5);


COMMIT;



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





-- "PETITION_URL" 테이블 생성 
CREATE TABLE "PETITION_URL" (
	"PT_URL"	VARCHAR2(1000)		NULL,
	"PT_NO"	NUMBER		NOT NULL
);

-- "PETITION_URL" 코멘트 생성
COMMENT ON COLUMN "PETITION_URL"."PT_URL" IS '글URL';

COMMENT ON COLUMN "PETITION_URL"."PT_NO" IS '글번호(SEQ_PT_NO)';


-- "PETITION_URL" 기본키 설정
ALTER TABLE "PETITION_URL" ADD CONSTRAINT "PK_PETITION_URL" PRIMARY KEY (
	"PT_URL"
);

-- "PETITION_URL" 외래키 설정
ALTER TABLE "PETITION_URL" ADD CONSTRAINT "FK_PETITION_TO_PETITION_URL" FOREIGN KEY (
	"PT_NO"
)
REFERENCES "PETITION" (
	"PT_NO"
);




-- "SENDING_EMAIL" 테이블 생성 
CREATE TABLE "SENDING_EMAIL" (
	"EMAIL_AGREE"	CHAR(1)		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);

-- "SENDING_EMAIL" 코멘트 생성
COMMENT ON COLUMN "SENDING_EMAIL"."EMAIL_AGREE" IS '회원 이메일 수신 동의 구분(0:다 싫어요, 1:서명할사람모집,2:서명한탄원서업데이트내역,3:내가시작한청원팁,4:주간청원요약,5:다른청원서추천)';

COMMENT ON COLUMN "SENDING_EMAIL"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

-- "SENDING_EMAIL" 기본키 생성
ALTER TABLE "SENDING_EMAIL" ADD CONSTRAINT "PK_SENDING_EMAIL" PRIMARY KEY (
	"EMAIL_AGREE",
	"USER_NO"
);

-- "SENDING_EMAIL" 외래키 생성
ALTER TABLE "SENDING_EMAIL" ADD CONSTRAINT "FK_USER_TO_SENDING_EMAIL_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
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


ALTER TABLE "PETITION_CATEGORY" DROP PRIMARY KEY;




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




