CREATE TABLE user_info (
	user_id	    VARCHAR2(20) PRIMARY KEY,
	password	VARCHAR2(50),
	name	    VARCHAR2(20),
	nickname	VARCHAR2(30),
	gender	    CHAR(1 BYTE),
	birthday	DATE,
	email	    VARCHAR2(40),
	phone	    VARCHAR2(20),
	address	    VARCHAR2(100),
	user_type	CHAR(1 BYTE)
);

INSERT INTO user_info VALUES('aaaa', '1111', '윤재', '윤재킹', '1', TO_DATE('1989-11-24'), 
        'email@email.com', '010-1111-1111', '서울시 중랑구 면목동', '0');
        
INSERT INTO user_info VALUES('bbbb', '1111', '성현', '성현킹', '1', TO_DATE('1989-06-06'), 
        'email@email.com', '010-1111-1111', '경기도 군포시 당동', '1');
        
INSERT INTO user_info VALUES('cccc', '1111', '정태', '정태킹', '1', TO_DATE('1991-11-13'), 
        'email@email.com', '010-1111-1111', '서울시 강남구 논현동', '1');
        
---------------------------------------------------------------------------------------------------------------

CREATE TABLE group_info (
    group_seq	    NUMBER PRIMARY KEY,
	group_name	    VARCHAR2(20),
	brief	        VARCHAR2(50),
	detail	        VARCHAR2(1000),
	region	        VARCHAR2(50),
	member_limit    VARCHAR2(20)	
);

CREATE SEQUENCE group_seq START WITH 1 INCREMENT BY 1;

INSERT INTO group_info VALUES(group_seq.NEXTVAL, '농구왕통키', '농구를 좋아하는 사람들입니다', '매주 아니 매일 하루 네시간씩 농구 연습합니다 각오하고 오세요',
                '서울시 강남구', '제한없음');
INSERT INTO group_info VALUES(group_seq.NEXTVAL, '축구왕강백호', '축구를 좋아하는 사람들입니다', '매주 아니 매일 하루 네시간씩 축구 연습합니다 각오하고 오세요',
                '서울시 서초구', '10');

---------------------------------------------------------------------------------------------------------------
CREATE TABLE category (
	category_seq NUMBER PRIMARY KEY,
	category1	VARCHAR2(20),
	category2	VARCHAR2(20)	
);

CREATE SEQUENCE category_seq START WITH 1 INCREMENT BY 1;

INSERT INTO category VALUES(category_seq.NEXTVAL, '스포츠', '농구');
INSERT INTO category VALUES(category_seq.NEXTVAL, '스포츠', '축구');
INSERT INTO category VALUES(category_seq.NEXTVAL, '스포츠', '야구');
INSERT INTO category VALUES(category_seq.NEXTVAL, '스포츠', '헬스');
INSERT INTO category VALUES(category_seq.NEXTVAL, '스포츠', '골프');

INSERT INTO category VALUES(category_seq.NEXTVAL, '음악', '기타');
INSERT INTO category VALUES(category_seq.NEXTVAL, '음악', '드럼');
INSERT INTO category VALUES(category_seq.NEXTVAL, '음악', '피아노');
INSERT INTO category VALUES(category_seq.NEXTVAL, '음악', '보컬');
INSERT INTO category VALUES(category_seq.NEXTVAL, '음악', '작곡');

INSERT INTO category VALUES(category_seq.NEXTVAL, '여행', '국내여행');
INSERT INTO category VALUES(category_seq.NEXTVAL, '여행', '해외여행');
INSERT INTO category VALUES(category_seq.NEXTVAL, '여행', '등산');
INSERT INTO category VALUES(category_seq.NEXTVAL, '여행', '낚시');
INSERT INTO category VALUES(category_seq.NEXTVAL, '여행', '캠핑');

INSERT INTO category VALUES(category_seq.NEXTVAL, '문화', '뮤지컬');
INSERT INTO category VALUES(category_seq.NEXTVAL, '문화', '연극');
INSERT INTO category VALUES(category_seq.NEXTVAL, '문화', '영화');
INSERT INTO category VALUES(category_seq.NEXTVAL, '문화', '전시회');
INSERT INTO category VALUES(category_seq.NEXTVAL, '문화', '콘서트');

INSERT INTO category VALUES(category_seq.NEXTVAL, '봉사활동', '양로원');
INSERT INTO category VALUES(category_seq.NEXTVAL, '봉사활동', '보육원');
INSERT INTO category VALUES(category_seq.NEXTVAL, '봉사활동', '환경봉사');
INSERT INTO category VALUES(category_seq.NEXTVAL, '봉사활동', '동물보호');
INSERT INTO category VALUES(category_seq.NEXTVAL, '봉사활동', '재능나눔');

INSERT INTO category VALUES(category_seq.NEXTVAL, '반려동물', '강아지');
INSERT INTO category VALUES(category_seq.NEXTVAL, '반려동물', '고양이');
INSERT INTO category VALUES(category_seq.NEXTVAL, '반려동물', '파충류');
INSERT INTO category VALUES(category_seq.NEXTVAL, '반려동물', '물고기');
INSERT INTO category VALUES(category_seq.NEXTVAL, '반려동물', '설치류');

---------------------------------------------------------------------------------------------------------------

CREATE TABLE user_interest (
	user_id	    VARCHAR2(20),
	category1	VARCHAR2(20),
    FOREIGN KEY(user_id) REFERENCES user_info(user_id)
);

INSERT INTO user_interest VALUES('aaaa', '스포츠');
INSERT INTO user_interest VALUES('aaaa', '반려동물');

CREATE TABLE notice(
    notice_seq  NUMBER PRIMARY KEY,
    user_id     VARCHAR2(20),
    title       VARCHAR2(50),
    content     VARCHAR2(1000),
    cnt         NUMBER,
    FOREIGN KEY(user_id) REFERENCES user_info(user_id)
);

CREATE SEQUENCE notice_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE files (
	file_seq	NUMBER PRIMARY KEY,
	notice_seq 	NUMBER,
	filename	VARCHAR2(50),
    FOREIGN KEY(notice_seq) REFERENCES notice(notice_seq)
);

CREATE SEQUENCE file_seq START WITH 1 INCREMENT BY 1;



CREATE TABLE qna (
	qna_seq	    NUMBER PRIMARY KEY,
	user_id	    VARCHAR2(20),
	title	    VARCHAR2(50),
	content	    VARCHAR2(1000),
	password	VARCHAR2(50),
	private	    CHAR,
	cnt	        NUMBER,
    regDate     DATE DEFAULT SYSDATE,
    FOREIGN KEY(user_id) REFERENCES user_info(user_id)
);

CREATE SEQUENCE qna_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE interest_group (
	interest_group_seq	NUMBER PRIMARY KEY,
	user_id	            VARCHAR2(20),
	group_seq	        NUMBER,
	result	            CHAR,
    FOREIGN KEY(user_id) REFERENCES user_info(user_id),
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq)
);

CREATE SEQUENCE interest_group_seq START WITH 1 INCREMENT BY 1;



CREATE TABLE crew (
	crew_seq	NUMBER PRIMARY KEY,
	user_id	    VARCHAR2(20),
	group_seq	NUMBER,
	crew_image	VARCHAR2(50),
	crew_brief	VARCHAR2(50),
	type	    CHAR,
    FOREIGN KEY(user_id) REFERENCES user_info(user_id),
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq)
);

CREATE SEQUENCE crew_seq START WITH 1 INCREMENT BY 1;



CREATE TABLE suda (
	suda_seq	NUMBER PRIMARY KEY,
	crew_seq	NUMBER,
	user_id	    VARCHAR2(20),
	group_seq	NUMBER,
	content	    VARCHAR2(1000),
    FOREIGN KEY(user_id) REFERENCES user_info(user_id),
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq),
    FOREIGN KEY(crew_seq) REFERENCES crew(crew_seq)
);

CREATE SEQUENCE suda_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE selected_category (
	selected_category_seq	NUMBER PRIMARY KEY,
	group_seq	        NUMBER,
	category_seq	    NUMBER,
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq),
    FOREIGN KEY(category_seq) REFERENCES category(category_seq)
);

CREATE SEQUENCE selected_category_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE group_notice (
	group_notice_seq	NUMBER PRIMARY KEY,
	group_seq	        NUMBER,
	type	            CHAR,
	title	            VARCHAR2(30),
	content	            VARCHAR2(1000),
	filename	        VARCHAR2(50),
	regDate	            DATE DEFAULT SYSDATE,
	jungmo_date	        DATE,
	jungmo_place	    VARCHAR2(100),
	result	            CHAR,
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq)
);

CREATE SEQUENCE group_notice_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE group_album (
	group_album_seq	NUMBER PRIMARY KEY,
	group_seq	    NUMBER,
	title	        VARCHAR2(50),
	filename	    VARCHAR2(50),
	likes	        NUMBER,
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq)
);

CREATE SEQUENCE group_album_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE jungmo_member (
	jungmo_member_seq	   NUMBER PRIMARY KEY,
	user_id	               VARCHAR2(20),
	group_notice_seq	   NUMBER,
	group_seq	           NUMBER,
    FOREIGN KEY(user_id)   REFERENCES user_info(user_id),
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq),
    FOREIGN KEY(group_notice_seq) REFERENCES group_notice(group_notice_seq)
);


CREATE SEQUENCE jungmo_member_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE comments (
	comment_seq	        NUMBER PRIMARY KEY,
	user_id	            VARCHAR2(20),
	group_notice_seq	NUMBER,
	group_seq	        NUMBER,
	group_album_seq	    NUMBER,
	qna_seq	            NUMBER ,
	content	            VARCHAR2(1000),
	regDate	            DATE DEFAULT SYSDATE,
    FOREIGN KEY(user_id)   REFERENCES user_info(user_id),
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq),
    FOREIGN KEY(group_notice_seq) REFERENCES group_notice(group_notice_seq),
    FOREIGN KEY(group_album_seq) REFERENCES group_album(group_album_seq),
    FOREIGN KEY(qna_seq) REFERENCES qna(qna_seq)
);

CREATE SEQUENCE comment_seq START WITH 1 INCREMENT BY 1;








-------------------------------------------------------------------------------











