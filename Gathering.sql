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

INSERT INTO user_info VALUES('aaaa', '1111', '����', '����ŷ', '1', TO_DATE('1989-11-24'), 
        'email@email.com', '010-1111-1111', '����� �߶��� ���', '0');
        
INSERT INTO user_info VALUES('bbbb', '1111', '����', '����ŷ', '1', TO_DATE('1989-06-06'), 
        'email@email.com', '010-1111-1111', '��⵵ ������ �絿', '1');
        
INSERT INTO user_info VALUES('cccc', '1111', '����', '����ŷ', '1', TO_DATE('1991-11-13'), 
        'email@email.com', '010-1111-1111', '����� ������ ������', '1');
        
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

INSERT INTO group_info VALUES(group_seq.NEXTVAL, '�󱸿���Ű', '�󱸸� �����ϴ� ������Դϴ�', '���� �ƴ� ���� �Ϸ� �׽ð��� �� �����մϴ� �����ϰ� ������',
                '����� ������', '���Ѿ���');
INSERT INTO group_info VALUES(group_seq.NEXTVAL, '�౸�հ���ȣ', '�౸�� �����ϴ� ������Դϴ�', '���� �ƴ� ���� �Ϸ� �׽ð��� �౸ �����մϴ� �����ϰ� ������',
                '����� ���ʱ�', '10');

---------------------------------------------------------------------------------------------------------------
CREATE TABLE category (
	category_seq NUMBER PRIMARY KEY,
	category1	VARCHAR2(20),
	category2	VARCHAR2(20)	
);

CREATE SEQUENCE category_seq START WITH 1 INCREMENT BY 1;

INSERT INTO category VALUES(category_seq.NEXTVAL, '������', '��');
INSERT INTO category VALUES(category_seq.NEXTVAL, '������', '�౸');
INSERT INTO category VALUES(category_seq.NEXTVAL, '������', '�߱�');
INSERT INTO category VALUES(category_seq.NEXTVAL, '������', '�ｺ');
INSERT INTO category VALUES(category_seq.NEXTVAL, '������', '����');

INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '��Ÿ');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '�巳');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '�ǾƳ�');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '����');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '�۰�');

INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '��������');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '�ؿܿ���');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '���');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', '����');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����', 'ķ��');

INSERT INTO category VALUES(category_seq.NEXTVAL, '��ȭ', '������');
INSERT INTO category VALUES(category_seq.NEXTVAL, '��ȭ', '����');
INSERT INTO category VALUES(category_seq.NEXTVAL, '��ȭ', '��ȭ');
INSERT INTO category VALUES(category_seq.NEXTVAL, '��ȭ', '����ȸ');
INSERT INTO category VALUES(category_seq.NEXTVAL, '��ȭ', '�ܼ�Ʈ');

INSERT INTO category VALUES(category_seq.NEXTVAL, '����Ȱ��', '��ο�');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����Ȱ��', '������');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����Ȱ��', 'ȯ�����');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����Ȱ��', '������ȣ');
INSERT INTO category VALUES(category_seq.NEXTVAL, '����Ȱ��', '��ɳ���');

INSERT INTO category VALUES(category_seq.NEXTVAL, '�ݷ�����', '������');
INSERT INTO category VALUES(category_seq.NEXTVAL, '�ݷ�����', '�����');
INSERT INTO category VALUES(category_seq.NEXTVAL, '�ݷ�����', '�����');
INSERT INTO category VALUES(category_seq.NEXTVAL, '�ݷ�����', '�����');
INSERT INTO category VALUES(category_seq.NEXTVAL, '�ݷ�����', '��ġ��');

---------------------------------------------------------------------------------------------------------------

CREATE TABLE user_interest (
	user_id	    VARCHAR2(20),
	category1	VARCHAR2(20),
    FOREIGN KEY(user_id) REFERENCES user_info(user_id)
);

INSERT INTO user_interest VALUES('aaaa', '������');
INSERT INTO user_interest VALUES('aaaa', '�ݷ�����');

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











