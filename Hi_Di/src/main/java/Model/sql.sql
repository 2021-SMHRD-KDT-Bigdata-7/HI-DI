select * from t_member;






--테이블 생성 (진기현)
CREATE TABLE t_member
(
    mb_id           VARCHAR2(20)     NOT NULL, 
    mb_pw           VARCHAR2(20)     NOT NULL, 
    mb_email        VARCHAR2(50)     NOT NULL, 
    mb_name         VARCHAR2(20)     NOT NULL, 
    mb_gender       VARCHAR2(1)      NOT NULL, 
    mb_phone        VARCHAR2(20)     NOT NULL, 
    mb_birthdate    DATE             NOT NULL, 
    mb_addr         VARCHAR2(150)    NOT NULL, 
    mb_joindate     DATE             DEFAULT SYSDATE NOT NULL, 
    admin_yn        VARCHAR2(1)      NOT NULL, 
    mb_point        NUMBER(12, 0)    DEFAULT 0 NOT NULL, 
     PRIMARY KEY (mb_id)
)
/

COMMENT ON TABLE t_member IS '회원 정보'
/

COMMENT ON COLUMN t_member.mb_id IS '회원 아이디'
/

COMMENT ON COLUMN t_member.mb_pw IS '회원 비밀번호'
/

COMMENT ON COLUMN t_member.mb_email IS '회원 이메일'
/

COMMENT ON COLUMN t_member.mb_name IS '회원 이름'
/

COMMENT ON COLUMN t_member.mb_gender IS '회원 성별'
/

COMMENT ON COLUMN t_member.mb_phone IS '회원 연락처'
/

COMMENT ON COLUMN t_member.mb_birthdate IS '회원 생년월일'
/

COMMENT ON COLUMN t_member.mb_addr IS '회원 주소'
/

COMMENT ON COLUMN t_member.mb_joindate IS '회원 가입일자'
/

COMMENT ON COLUMN t_member.admin_yn IS '관리자 여부'
/

COMMENT ON COLUMN t_member.mb_point IS '회원 포인트'
/


-- t_poll Table Create SQL
CREATE TABLE t_poll
(
    poll_seq        NUMBER(12, 0)     NOT NULL, 
    poll_title      VARCHAR2(150)     NOT NULL, 
    poll_content    VARCHAR2(4000)    NOT NULL, 
    mb_id           VARCHAR2(20)      NULL, 
    reg_date        DATE              DEFAULT SYSDATE NULL, 
     PRIMARY KEY (poll_seq)
)
/

CREATE SEQUENCE t_poll_SEQ
START WITH 1                
INCREMENT BY 1;
/

// 질문
CREATE OR REPLACE TRIGGER t_poll_AI_TRG
BEFORE INSERT ON t_poll 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_poll_SEQ.NEXTVAL
    INTO :NEW.poll_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_poll_AI_TRG;
/

--DROP SEQUENCE t_poll_SEQ;
/

COMMENT ON TABLE t_poll IS '설문조사'
/

COMMENT ON COLUMN t_poll.poll_seq IS '설문 순번'
/

COMMENT ON COLUMN t_poll.poll_title IS '설문 제목'
/

COMMENT ON COLUMN t_poll.poll_content IS '설문 설명'
/

COMMENT ON COLUMN t_poll.mb_id IS '등록자 아이디'
/

COMMENT ON COLUMN t_poll.reg_date IS '등록 일자'
/


-- t_disease Table Create SQL
CREATE TABLE t_disease
(
    dis_seq        NUMBER(12, 0)     NOT NULL, 
    dis_name       VARCHAR2(50)      NOT NULL, 
    dis_content    VARCHAR2(4000)    NOT NULL, 
    dis_symptom    VARCHAR2(4000)    NOT NULL, 
    dis_pic1       VARCHAR2(150)     NULL, 
    dis_pic2       VARCHAR2(150)     NULL, 
    dis_pic3       VARCHAR2(150)     NULL, 
    dis_pic4       VARCHAR2(150)     NULL, 
    reg_date       DATE              DEFAULT SYSDATE NOT NULL, 
    mb_id          VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (dis_seq)
)
/

CREATE SEQUENCE t_disease_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_disease_AI_TRG
BEFORE INSERT ON t_disease 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_disease_SEQ.NEXTVAL
    INTO :NEW.dis_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_disease_AI_TRG;
/

--DROP SEQUENCE t_disease_SEQ;
/

COMMENT ON TABLE t_disease IS '질병 정보'
/

COMMENT ON COLUMN t_disease.dis_seq IS '질병 순번'
/

COMMENT ON COLUMN t_disease.dis_name IS '질병 명'
/

COMMENT ON COLUMN t_disease.dis_content IS '질병 설명'
/

COMMENT ON COLUMN t_disease.dis_symptom IS '질병 증상'
/

COMMENT ON COLUMN t_disease.dis_pic1 IS '질병 사진1'
/

COMMENT ON COLUMN t_disease.dis_pic2 IS '질병 사진2'
/

COMMENT ON COLUMN t_disease.dis_pic3 IS '질병 사진3'
/

COMMENT ON COLUMN t_disease.dis_pic4 IS '질병 사진4'
/

COMMENT ON COLUMN t_disease.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_disease.mb_id IS '등록자 아이디'
/

ALTER TABLE t_disease
    ADD CONSTRAINT FK_t_disease_mb_id_t_member_mb FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/


-- t_checklist Table Create SQL
CREATE TABLE t_checklist
(
    check_seq     NUMBER(12, 0)    NOT NULL, 
    dis_seq       NUMBER(12, 0)    NOT NULL, 
    check_item    VARCHAR2(50)     NOT NULL, 
    reg_date      DATE             DEFAULT SYSDATE NOT NULL, 
    mb_id         VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (check_seq)
)
/

CREATE SEQUENCE t_checklist_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_checklist_AI_TRG
BEFORE INSERT ON t_checklist 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_checklist_SEQ.NEXTVAL
    INTO :NEW.check_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_checklist_AI_TRG;
/

--DROP SEQUENCE t_checklist_SEQ;
/

COMMENT ON TABLE t_checklist IS '질병 체크 리스트'
/

COMMENT ON COLUMN t_checklist.check_seq IS '체크 순번'
/

COMMENT ON COLUMN t_checklist.dis_seq IS '질병 순번'
/

COMMENT ON COLUMN t_checklist.check_item IS '체크 항목'
/

COMMENT ON COLUMN t_checklist.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_checklist.mb_id IS '등록자 아이디'
/

ALTER TABLE t_checklist
    ADD CONSTRAINT FK_t_checklist_dis_seq_t_disea FOREIGN KEY (dis_seq)
        REFERENCES t_disease (dis_seq)
/


-- t_community Table Create SQL
CREATE TABLE t_community
(
    article_seq        NUMBER(12, 0)     NOT NULL, 
    article_subject    VARCHAR2(150)     NOT NULL, 
    article_content    VARCHAR2(4000)    NOT NULL, 
    article_cnt        NUMBER(12, 0)     NOT NULL, 
    reg_date           DATE              DEFAULT SYSDATE NOT NULL, 
    mb_id              VARCHAR2(20)      NOT NULL, 
    article_file1      VARCHAR2(150)     NOT NULL, 
    article_file2      VARCHAR2(150)     NOT NULL, 
    article_file3      VARCHAR2(150)     NOT NULL, 
     PRIMARY KEY (article_seq)
)
/

CREATE SEQUENCE t_community_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_community_AI_TRG
BEFORE INSERT ON t_community 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_community_SEQ.NEXTVAL
    INTO :NEW.article_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_community_AI_TRG;
/

--DROP SEQUENCE t_community_SEQ;
/

COMMENT ON TABLE t_community IS '커뮤니티 게시판'
/

COMMENT ON COLUMN t_community.article_seq IS '게시글 순번'
/

COMMENT ON COLUMN t_community.article_subject IS '게시글 제목'
/

COMMENT ON COLUMN t_community.article_content IS '게시글 내용'
/

COMMENT ON COLUMN t_community.article_cnt IS '게시글 조회수'
/

COMMENT ON COLUMN t_community.reg_date IS '게시글 등록일자'
/

COMMENT ON COLUMN t_community.mb_id IS '작성자 아이디'
/

COMMENT ON COLUMN t_community.article_file1 IS '게시글 파일1'
/

COMMENT ON COLUMN t_community.article_file2 IS '게시글 파일2'
/

COMMENT ON COLUMN t_community.article_file3 IS '게시글 파일3'
/

ALTER TABLE t_community
    ADD CONSTRAINT FK_t_community_mb_id_t_member_ FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/


-- t_food Table Create SQL
CREATE TABLE t_food
(
    food_seq           NUMBER(12, 0)     NOT NULL, 
    food_name          VARCHAR2(50)      NOT NULL, 
    food_ingredient    VARCHAR2(4000)    NOT NULL, 
    food_calory        NUMBER(12, 0)     NOT NULL, 
    food_effect        VARCHAR2(4000)    NOT NULL, 
    reg_date           DATE              DEFAULT SYSDATE NOT NULL, 
    food_pic1          VARCHAR2(150)     NULL, 
    food_pic2          VARCHAR2(150)     NULL, 
     PRIMARY KEY (food_seq)
)
/

CREATE SEQUENCE t_food_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_food_AI_TRG
BEFORE INSERT ON t_food 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_food_SEQ.NEXTVAL
    INTO :NEW.food_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_food_AI_TRG;
/

--DROP SEQUENCE t_food_SEQ;
/

COMMENT ON TABLE t_food IS '식품 정보 테이블'
/

COMMENT ON COLUMN t_food.food_seq IS '식품 순번'
/

COMMENT ON COLUMN t_food.food_name IS '식품 명'
/

COMMENT ON COLUMN t_food.food_ingredient IS '식품 영양소'
/

COMMENT ON COLUMN t_food.food_calory IS '식품 칼로리'
/

COMMENT ON COLUMN t_food.food_effect IS '식품 효과'
/

COMMENT ON COLUMN t_food.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_food.food_pic1 IS '식품 사진1'
/

COMMENT ON COLUMN t_food.food_pic2 IS '식품 사진2'
/


-- t_health_food Table Create SQL
CREATE TABLE t_health_food
(
    health_food_seq           NUMBER(12, 0)     NOT NULL, 
    health_food_name          VARCHAR2(50)      NOT NULL, 
    health_food_ingredient    VARCHAR2(4000)    NOT NULL, 
    health_food_calory        NUMBER(12, 0)     NOT NULL, 
    health_food_effect        VARCHAR2(4000)    NOT NULL, 
    reg_date                  DATE              DEFAULT SYSDATE NOT NULL, 
    health_food_pic1          VARCHAR2(150)     NULL, 
    health_food_pic2          VARCHAR2(150)     NULL, 
     PRIMARY KEY (health_food_seq)
)
/

CREATE SEQUENCE t_health_food_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_health_food_AI_TRG
BEFORE INSERT ON t_health_food 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_health_food_SEQ.NEXTVAL
    INTO :NEW.health_food_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_health_food_AI_TRG;
/

--DROP SEQUENCE t_health_food_SEQ;
/

COMMENT ON TABLE t_health_food IS '건강 기능 식품'
/

COMMENT ON COLUMN t_health_food.health_food_seq IS '건강기능식품 순번'
/

COMMENT ON COLUMN t_health_food.health_food_name IS '건강기능식품 명'
/

COMMENT ON COLUMN t_health_food.health_food_ingredient IS '건강기능식품 영양소'
/

COMMENT ON COLUMN t_health_food.health_food_calory IS '건강기능식품 칼로리'
/

COMMENT ON COLUMN t_health_food.health_food_effect IS '건강기능식품 효과'
/

COMMENT ON COLUMN t_health_food.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_health_food.health_food_pic1 IS '건강기능식품 사진1'
/

COMMENT ON COLUMN t_health_food.health_food_pic2 IS '건강기능식품 사진2'
/


-- t_rehabilitation Table Create SQL
CREATE TABLE t_rehabilitation
(
    rehabi_seq       NUMBER(12, 0)     NOT NULL, 
    rehabi_name      VARCHAR2(50)      NULL, 
    rehabi_method    VARCHAR2(4000)    NULL, 
    reg_date         DATE              DEFAULT SYSDATE NULL, 
     PRIMARY KEY (rehabi_seq)
)
/

CREATE SEQUENCE t_rehabilitation_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_rehabilitation_AI_TRG
BEFORE INSERT ON t_rehabilitation 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_rehabilitation_SEQ.NEXTVAL
    INTO :NEW.rehabi_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_rehabilitation_AI_TRG;
/

--DROP SEQUENCE t_rehabilitation_SEQ;
/

COMMENT ON TABLE t_rehabilitation IS '재활 운동'
/

COMMENT ON COLUMN t_rehabilitation.rehabi_seq IS '재활 순번'
/

COMMENT ON COLUMN t_rehabilitation.rehabi_name IS '재활 운동명'
/

COMMENT ON COLUMN t_rehabilitation.rehabi_method IS '재활 운동방법'
/

COMMENT ON COLUMN t_rehabilitation.reg_date IS '등록 일자'
/


-- t_disease_history Table Create SQL
CREATE TABLE t_disease_history
(
    history_seq    NUMBER(12, 0)     NOT NULL, 
    dis_name       VARCHAR2(50)      NOT NULL, 
    dis_symptom    VARCHAR2(4000)    NOT NULL, 
    reg_date       DATE              DEFAULT SYSDATE NOT NULL, 
    mb_id          VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (history_seq)
)
/

CREATE SEQUENCE t_disease_history_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_disease_history_AI_TRG
BEFORE INSERT ON t_disease_history 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_disease_history_SEQ.NEXTVAL
    INTO :NEW.history_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_disease_history_AI_TRG;
/

--DROP SEQUENCE t_disease_history_SEQ;
/

COMMENT ON TABLE t_disease_history IS '나의 질병 히스토리'
/

COMMENT ON COLUMN t_disease_history.history_seq IS '히스토리 순번'
/

COMMENT ON COLUMN t_disease_history.dis_name IS '질병 명'
/

COMMENT ON COLUMN t_disease_history.dis_symptom IS '질병 증상'
/

COMMENT ON COLUMN t_disease_history.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_disease_history.mb_id IS '회원 아이디'
/

ALTER TABLE t_disease_history
    ADD CONSTRAINT FK_t_disease_history_mb_id_t_m FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/


-- t_poll_items Table Create SQL
CREATE TABLE t_poll_items
(
    item_seq        NUMBER(12, 0)     NOT NULL, 
    poll_seq        NUMBER(12, 0)     NOT NULL, 
    item_name       VARCHAR2(150)     NOT NULL, 
    item_content    VARCHAR2(4000)    NOT NULL, 
     PRIMARY KEY (item_seq)
)
/

CREATE SEQUENCE t_poll_items_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_poll_items_AI_TRG
BEFORE INSERT ON t_poll_items 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_poll_items_SEQ.NEXTVAL
    INTO :NEW.item_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_poll_items_AI_TRG;
/

--DROP SEQUENCE t_poll_items_SEQ;
/

COMMENT ON TABLE t_poll_items IS '설문 아이템'
/

COMMENT ON COLUMN t_poll_items.item_seq IS '설문 아이템 순번'
/

COMMENT ON COLUMN t_poll_items.poll_seq IS '설문 순번'
/

COMMENT ON COLUMN t_poll_items.item_name IS '아이템 항목'
/

COMMENT ON COLUMN t_poll_items.item_content IS '아이템 보충설명'
/

ALTER TABLE t_poll_items
    ADD CONSTRAINT FK_t_poll_items_poll_seq_t_pol FOREIGN KEY (poll_seq)
        REFERENCES t_poll (poll_seq)
/


-- t_user_check Table Create SQL
CREATE TABLE t_user_check
(
    user_check_seq       NUMBER(12, 0)    NOT NULL, 
    check_seq            NUMBER(12, 0)    NOT NULL, 
    user_check_result    VARCHAR2(1)      NOT NULL, 
    reg_date             DATE             DEFAULT SYSDATE NOT NULL, 
    mb_id                VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (user_check_seq)
)
/

CREATE SEQUENCE t_user_check_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_user_check_AI_TRG
BEFORE INSERT ON t_user_check 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_user_check_SEQ.NEXTVAL
    INTO :NEW.user_check_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_user_check_AI_TRG;
/

--DROP SEQUENCE t_user_check_SEQ;
/

COMMENT ON TABLE t_user_check IS '사용자 체크 결과'
/

COMMENT ON COLUMN t_user_check.user_check_seq IS '사용자체크 순번'
/

COMMENT ON COLUMN t_user_check.check_seq IS '체크 순번'
/

COMMENT ON COLUMN t_user_check.user_check_result IS '체크 결과'
/

COMMENT ON COLUMN t_user_check.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_user_check.mb_id IS '등록자 아이디'
/

ALTER TABLE t_user_check
    ADD CONSTRAINT FK_t_user_check_check_seq_t_ch FOREIGN KEY (check_seq)
        REFERENCES t_checklist (check_seq)
/

ALTER TABLE t_user_check
    ADD CONSTRAINT FK_t_user_check_mb_id_t_member FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/


-- t_comment Table Create SQL
CREATE TABLE t_comment
(
    comment_seq        NUMBER(12, 0)     NOT NULL, 
    article_seq        NUMBER(12, 0)     NOT NULL, 
    comment_content    VARCHAR2(4000)    NOT NULL, 
    reg_date           DATE              DEFAULT SYSDATE NOT NULL, 
    mb_id              VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (comment_seq)
)
/

CREATE SEQUENCE t_comment_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_comment_AI_TRG
BEFORE INSERT ON t_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_comment_SEQ.NEXTVAL
    INTO :NEW.comment_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_comment_AI_TRG;
/

--DROP SEQUENCE t_comment_SEQ;
/

COMMENT ON TABLE t_comment IS '댓글 정보'
/

COMMENT ON COLUMN t_comment.comment_seq IS '댓글 순번'
/

COMMENT ON COLUMN t_comment.article_seq IS '원글 순번'
/

COMMENT ON COLUMN t_comment.comment_content IS '댓글 내용'
/

COMMENT ON COLUMN t_comment.reg_date IS '댓글 등록일자'
/

COMMENT ON COLUMN t_comment.mb_id IS '작성자 아이디'
/

ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_article_seq_t_com FOREIGN KEY (article_seq)
        REFERENCES t_community (article_seq)
/

ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_mb_id_t_member_mb FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/


-- t_recommend Table Create SQL
CREATE TABLE t_recommend
(
    reco_seq           NUMBER(12, 0)    NOT NULL, 
    food_seq           NUMBER(12, 0)    NULL, 
    health_food_seq    NUMBER(12, 0)    NULL, 
    rehabi_seq         NUMBER(12, 0)    NULL, 
    reg_date           DATE             DEFAULT SYSDATE NOT NULL, 
    mb_id              VARCHAR2(20)     NOT NULL, 
    history_seq        NUMBER(12, 0)    NOT NULL, 
     PRIMARY KEY (reco_seq)
)
/

CREATE SEQUENCE t_recommend_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_recommend_AI_TRG
BEFORE INSERT ON t_recommend 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_recommend_SEQ.NEXTVAL
    INTO :NEW.reco_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_recommend_AI_TRG;
/

--DROP SEQUENCE t_recommend_SEQ;
/

COMMENT ON TABLE t_recommend IS '추천 건강 관리'
/

COMMENT ON COLUMN t_recommend.reco_seq IS '추천 순번'
/

COMMENT ON COLUMN t_recommend.food_seq IS '식품 순번'
/

COMMENT ON COLUMN t_recommend.health_food_seq IS '건강기능식품 순번'
/

COMMENT ON COLUMN t_recommend.rehabi_seq IS '재활 순번'
/

COMMENT ON COLUMN t_recommend.reg_date IS '추천 일자'
/

COMMENT ON COLUMN t_recommend.mb_id IS '회원 아이디'
/

COMMENT ON COLUMN t_recommend.history_seq IS '회원 증상 순번'
/

ALTER TABLE t_recommend
    ADD CONSTRAINT FK_t_recommend_food_seq_t_food FOREIGN KEY (food_seq)
        REFERENCES t_food (food_seq)
/

ALTER TABLE t_recommend
    ADD CONSTRAINT FK_t_recommend_health_food_seq FOREIGN KEY (health_food_seq)
        REFERENCES t_health_food (health_food_seq)
/

ALTER TABLE t_recommend
    ADD CONSTRAINT FK_t_recommend_rehabi_seq_t_re FOREIGN KEY (rehabi_seq)
        REFERENCES t_rehabilitation (rehabi_seq)
/

ALTER TABLE t_recommend
    ADD CONSTRAINT FK_t_recommend_mb_id_t_member_ FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/

ALTER TABLE t_recommend
    ADD CONSTRAINT FK_t_recommend_history_seq_t_d FOREIGN KEY (history_seq)
        REFERENCES t_disease_history (history_seq)
/


-- t_point Table Create SQL
CREATE TABLE t_point
(
    point_seq     NUMBER(12, 0)    NOT NULL, 
    point         NUMBER(12, 0)    DEFAULT 0 NOT NULL, 
    point_memo    VARCHAR2(150)    NOT NULL, 
    reg_date      DATE             DEFAULT SYSDATE NOT NULL, 
    mb_id         VARCHAR2(20)     NOT NULL, 
    point_kind    VARCHAR2(1)      NULL, 
     PRIMARY KEY (point_seq)
)
/

CREATE SEQUENCE t_point_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_point_AI_TRG
BEFORE INSERT ON t_point 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_point_SEQ.NEXTVAL
    INTO :NEW.point_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_point_AI_TRG;
/

--DROP SEQUENCE t_point_SEQ;
/

COMMENT ON TABLE t_point IS '포인트 지급 및 사용 정보'
/

COMMENT ON COLUMN t_point.point_seq IS '포인트 순번'
/

COMMENT ON COLUMN t_point.point IS '포인트 점수'
/

COMMENT ON COLUMN t_point.point_memo IS '포인트 사유'
/

COMMENT ON COLUMN t_point.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_point.mb_id IS '회원 아이디'
/

COMMENT ON COLUMN t_point.point_kind IS '포인트 구분'
/

ALTER TABLE t_point
    ADD CONSTRAINT FK_t_point_mb_id_t_member_mb_i FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/


-- t_hospital Table Create SQL
CREATE TABLE t_hospital
(
    hos_seq           NUMBER(12, 0)    NOT NULL, 
    hos_name          VARCHAR2(50)     NOT NULL, 
    hos_addr          VARCHAR2(150)    NOT NULL, 
    hos_phone         VARCHAR2(20)     NOT NULL, 
    hos_latitude      NUMBER(17,14)    NOT NULL, 
    hos_longitude     NUMBER(17,14)    NOT NULL, 
    hos_facilities    VARCHAR2(150)    NOT NULL, 
    reg_date          DATE             DEFAULT SYSDATE NOT NULL, 
    mb_id             VARCHAR2(20)     NOT NULL, 
    hos_pic1          VARCHAR2(150)    NULL, 
    hos_pic2          VARCHAR2(150)    NULL, 
    hos_pic3          VARCHAR2(150)    NULL, 
     PRIMARY KEY (hos_seq)
)
/

CREATE SEQUENCE t_hospital_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_hospital_AI_TRG
BEFORE INSERT ON t_hospital 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_hospital_SEQ.NEXTVAL
    INTO :NEW.hos_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_hospital_AI_TRG;
/

--DROP SEQUENCE t_hospital_SEQ;
/

COMMENT ON TABLE t_hospital IS '병원 정보 테이블'
/

COMMENT ON COLUMN t_hospital.hos_seq IS '병원 순번'
/

COMMENT ON COLUMN t_hospital.hos_name IS '병원 명'
/

COMMENT ON COLUMN t_hospital.hos_addr IS '병원 주소'
/

COMMENT ON COLUMN t_hospital.hos_phone IS '병원 전화'
/

COMMENT ON COLUMN t_hospital.hos_latitude IS '병원 위도'
/

COMMENT ON COLUMN t_hospital.hos_longitude IS '병원 경도'
/

COMMENT ON COLUMN t_hospital.hos_facilities IS '병원 시설'
/

COMMENT ON COLUMN t_hospital.reg_date IS '등록 일자'
/

COMMENT ON COLUMN t_hospital.mb_id IS '등록자 아이디'
/

COMMENT ON COLUMN t_hospital.hos_pic1 IS '병원 사진1'
/

COMMENT ON COLUMN t_hospital.hos_pic2 IS '병원 사진2'
/

COMMENT ON COLUMN t_hospital.hos_pic3 IS '병원 사진3'
/

ALTER TABLE t_hospital
    ADD CONSTRAINT FK_t_hospital_mb_id_t_member_m FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/


-- t_mb_answer Table Create SQL
CREATE TABLE t_mb_answer
(
    answer_seq       NUMBER(12, 0)    NOT NULL, 
    item_seq         NUMBER(12, 0)    NOT NULL, 
    answer_result    VARCHAR2(20)     NOT NULL, 
    answer_date      DATE             NOT NULL, 
    mb_id            VARCHAR2(20)     NOT NULL, 
    reg_date         DATE             DEFAULT SYSDATE NULL, 
     PRIMARY KEY (answer_seq)
)
/

CREATE SEQUENCE t_mb_answer_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_mb_answer_AI_TRG
BEFORE INSERT ON t_mb_answer 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_mb_answer_SEQ.NEXTVAL
    INTO :NEW.answer_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_mb_answer_AI_TRG;
/

--DROP SEQUENCE t_mb_answer_SEQ;
/

COMMENT ON TABLE t_mb_answer IS '회원 설문 응답 조사'
/

COMMENT ON COLUMN t_mb_answer.answer_seq IS '응답 순번'
/

COMMENT ON COLUMN t_mb_answer.item_seq IS '설문 아이템 순번'
/

COMMENT ON COLUMN t_mb_answer.answer_result IS '응답 결과'
/

COMMENT ON COLUMN t_mb_answer.answer_date IS '응답 날짜'
/

COMMENT ON COLUMN t_mb_answer.mb_id IS '응답자 아이디'
/

COMMENT ON COLUMN t_mb_answer.reg_date IS '등록 날짜'
/

ALTER TABLE t_mb_answer
    ADD CONSTRAINT FK_t_mb_answer_item_seq_t_poll FOREIGN KEY (item_seq)
        REFERENCES t_poll_items (item_seq)
/

ALTER TABLE t_mb_answer
    ADD CONSTRAINT FK_t_mb_answer_mb_id_t_member_ FOREIGN KEY (mb_id)
        REFERENCES t_member (mb_id)
/
---------------------------------------------------------------------
(DAO 쿼리)

-- 테이블 복사/백업
CREATE TABLE t_member_20211203_171342 AS 
SELECT * FROM t_member;

-- 백업 테이블에서 원본 테이블로 데이터 복사(Auto Increment 컬럼 제외)
INSERT INTO t_member 
    (mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point)
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point 
FROM t_member_20211203_171342;

-- 테이블 ROW 갯수 확인
SELECT count(*) 
FROM t_member;

-- 조건에 맞는 ROW 조회
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
WHERE mb_id = 'mb_id 1';

-- 모든 컬럼 PK기준 역순으로 조회
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
ORDER BY mb_id DESC;

-- 모든 컬럼 100건 조회 - 일반정렬
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
WHERE ROWNUM <= 100;

-- 모든 컬럼 100건 조회 - 역순정렬
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM (
    --ROW_NUMBER() : 1등이 2명이어도 1,2등으로 나눈다.
    --RANK() : 1등이 두명이면 다음 순위는 3등이 된다.
    --DENSE_RANK() : 1등이 두명이면 다음 순위는 2등이 된다.
    SELECT ROW_NUMBER() OVER (ORDER BY mb_id DESC) AS rn, 
        mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
    FROM t_member)
WHERE rn <= 100;

-- SELECT 값에 따라 수정된 다른 값을 출력
SELECT mb_id, 
    CASE
        --WHEN 조건 THEN 리턴값
        WHEN mb_pw = 'A' THEN CONCAT(mb_pw, 'Type1')  AType1
                            --CONCAT(A,B) == AB 합치기
        WHEN mb_pw = 'B' THEN CONCAT(mb_pw, 'Type2')
        WHEN mb_pw = 'C' THEN CONCAT(mb_pw, 'Type3')
        ELSE CONCAT(mb_pw, 'Type4') END AS mb_pwType, 
    mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member;

-- 특정 컬럼 중복 제거
SELECT DISTINCT mb_pw
FROM t_member;

-- Group By 문과 Having문을 이용하여 Select
SELECT mb_pw, AVG(mb_point)
FROM t_member
GROUP BY mb_pw
HAVING AVG(mb_point) > 50;

-- 날짜 범위에 해당하는 ROW를 조회
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
WHERE mb_birthdate BETWEEN 
    TO_DATE('2015-10-01 23:59:59','yyyy/mm/dd hh24:mi:ss') AND 
    TO_DATE('2015-11-30 23:59:59','yyyy/mm/dd hh24:mi:ss');
-- 또는 WHERE mb_birthdate BETWEEN '2015-10-01' AND '2015-11-30';

-- 날짜별 통계
SELECT TO_CHAR(mb_birthdate, 'yyyy-mm-dd') AS mb_birthdate, COUNT(*) count
FROM t_member
GROUP BY TO_CHAR(mb_birthdate, 'yyyy-mm-dd')
ORDER BY mb_birthdate DESC;

-- Inner Join을 이용한 조회
-- 기준 테이블과 조인 테이블 모두 데이터가 존재해야 조회됨
SELECT m1.mb_id, m1.mb_pw, m1.mb_email, m1.mb_name, m1.mb_gender, m1.mb_phone, m1.mb_birthdate, m1.mb_addr, m1.mb_joindate, m1.admin_yn, m1.mb_point, 
    d1.mb_id, d1.dis_seq, d1.dis_name, d1.dis_content, d1.dis_symptom, d1.dis_pic1, d1.dis_pic2, d1.dis_pic3, d1.dis_pic4, d1.reg_date, 
    u.mb_id, u.check_seq, u.user_check_seq, u.user_check_result, u.reg_date, 
    c1.mb_id, c1.article_seq, c1.article_subject, c1.article_content, c1.article_cnt, c1.reg_date, c1.article_file1, c1.article_file2, c1.article_file3, 
    c2.mb_id, c2.article_seq, c2.comment_seq, c2.comment_content, c2.reg_date, 
    r.history_seq, r.mb_id, r.rehabi_seq, r.health_food_seq, r.food_seq, r.reco_seq, r.reg_date, 
    p.mb_id, p.point_seq, p.point, p.point_memo, p.reg_date, p.point_kind, 
    h.mb_id, h.hos_seq, h.hos_name, h.hos_addr, h.hos_phone, h.hos_latitude, h.hos_longitude, h.hos_facilities, h.reg_date, h.hos_pic1, h.hos_pic2, h.hos_pic3, 
    d2.mb_id, d2.history_seq, d2.dis_name, d2.dis_symptom, d2.reg_date, 
    m2.mb_id, m2.item_seq, m2.answer_seq, m2.answer_result, m2.answer_date, m2.reg_date
FROM t_member m1 
    INNER JOIN t_disease d1 ON m1.mb_id = d1.mb_id
    INNER JOIN t_user_check u ON m1.mb_id = u.mb_id
    INNER JOIN t_community c1 ON m1.mb_id = c1.mb_id AND c2.article_seq = c1.article_seq
    INNER JOIN t_comment c2 ON m1.mb_id = c2.mb_id
    INNER JOIN t_recommend r ON m1.mb_id = r.mb_id
    INNER JOIN t_point p ON m1.mb_id = p.mb_id
    INNER JOIN t_hospital h ON m1.mb_id = h.mb_id
    INNER JOIN t_disease_history d2 ON m1.mb_id = d2.mb_id AND r.history_seq = d2.history_seq
    INNER JOIN t_mb_answer m2 ON m1.mb_id = m2.mb_id
WHERE m1.mb_id = 'mb_id 1' AND ROWNUM <= 100;

-- Outer Join을 이용한 조회
-- 기준 테이블에만 데이터가 존재하면 조회됨(이때 조인테이블의 컬럼값은 NULL)
-- RIGHT OUTER JOIN은 기준, 조인 테이블 바뀐 것
SELECT m1.mb_id, m1.mb_pw, m1.mb_email, m1.mb_name, m1.mb_gender, m1.mb_phone, m1.mb_birthdate, m1.mb_addr, m1.mb_joindate, m1.admin_yn, m1.mb_point, 
    d1.mb_id, d1.dis_seq, d1.dis_name, d1.dis_content, d1.dis_symptom, d1.dis_pic1, d1.dis_pic2, d1.dis_pic3, d1.dis_pic4, d1.reg_date, 
    u.mb_id, u.check_seq, u.user_check_seq, u.user_check_result, u.reg_date, 
    c1.mb_id, c1.article_seq, c1.article_subject, c1.article_content, c1.article_cnt, c1.reg_date, c1.article_file1, c1.article_file2, c1.article_file3, 
    c2.mb_id, c2.article_seq, c2.comment_seq, c2.comment_content, c2.reg_date, 
    r.history_seq, r.mb_id, r.rehabi_seq, r.health_food_seq, r.food_seq, r.reco_seq, r.reg_date, 
    p.mb_id, p.point_seq, p.point, p.point_memo, p.reg_date, p.point_kind, 
    h.mb_id, h.hos_seq, h.hos_name, h.hos_addr, h.hos_phone, h.hos_latitude, h.hos_longitude, h.hos_facilities, h.reg_date, h.hos_pic1, h.hos_pic2, h.hos_pic3, 
    d2.mb_id, d2.history_seq, d2.dis_name, d2.dis_symptom, d2.reg_date, 
    m2.mb_id, m2.item_seq, m2.answer_seq, m2.answer_result, m2.answer_date, m2.reg_date
FROM t_member m1 
    LEFT OUTER JOIN t_disease d1 ON m1.mb_id = d1.mb_id
    LEFT OUTER JOIN t_user_check u ON m1.mb_id = u.mb_id
    LEFT OUTER JOIN t_community c1 ON m1.mb_id = c1.mb_id AND c2.article_seq = c1.article_seq
    LEFT OUTER JOIN t_comment c2 ON m1.mb_id = c2.mb_id
    LEFT OUTER JOIN t_recommend r ON m1.mb_id = r.mb_id
    LEFT OUTER JOIN t_point p ON m1.mb_id = p.mb_id
    LEFT OUTER JOIN t_hospital h ON m1.mb_id = h.mb_id
    LEFT OUTER JOIN t_disease_history d2 ON m1.mb_id = d2.mb_id AND r.history_seq = d2.history_seq
    LEFT OUTER JOIN t_mb_answer m2 ON m1.mb_id = m2.mb_id
WHERE m1.mb_id = 'mb_id 1' AND ROWNUM <= 100;

-- 해당 테이블을 참조하는 테이블의 최신 Row만 조회
SELECT m1.mb_id, m1.mb_pw, m1.mb_email, m1.mb_name, m1.mb_gender, m1.mb_phone, m1.mb_birthdate, m1.mb_addr, m1.mb_joindate, m1.admin_yn, m1.mb_point, 
    d1.mb_id, d1.dis_seq, d1.dis_name, d1.dis_content, d1.dis_symptom, d1.dis_pic1, d1.dis_pic2, d1.dis_pic3, d1.dis_pic4, d1.reg_date, 
    u.mb_id, u.check_seq, u.user_check_seq, u.user_check_result, u.reg_date, 
    c1.mb_id, c1.article_seq, c1.article_subject, c1.article_content, c1.article_cnt, c1.reg_date, c1.article_file1, c1.article_file2, c1.article_file3, 
    c2.mb_id, c2.article_seq, c2.comment_seq, c2.comment_content, c2.reg_date, 
    r.history_seq, r.mb_id, r.rehabi_seq, r.health_food_seq, r.food_seq, r.reco_seq, r.reg_date, 
    p.mb_id, p.point_seq, p.point, p.point_memo, p.reg_date, p.point_kind, 
    h.mb_id, h.hos_seq, h.hos_name, h.hos_addr, h.hos_phone, h.hos_latitude, h.hos_longitude, h.hos_facilities, h.reg_date, h.hos_pic1, h.hos_pic2, h.hos_pic3, 
    d2.mb_id, d2.history_seq, d2.dis_name, d2.dis_symptom, d2.reg_date, 
    m2.mb_id, m2.item_seq, m2.answer_seq, m2.answer_result, m2.answer_date, m2.reg_date
FROM t_member m1 
    LEFT OUTER JOIN t_disease d1 ON m1.mb_id = d1.mb_id
    LEFT OUTER JOIN t_user_check u ON m1.mb_id = u.mb_id
    LEFT OUTER JOIN t_community c1 ON m1.mb_id = c1.mb_id AND c2.article_seq = c1.article_seq
    LEFT OUTER JOIN t_comment c2 ON m1.mb_id = c2.mb_id
    LEFT OUTER JOIN t_recommend r ON m1.mb_id = r.mb_id
    LEFT OUTER JOIN t_point p ON m1.mb_id = p.mb_id
    LEFT OUTER JOIN t_hospital h ON m1.mb_id = h.mb_id
    LEFT OUTER JOIN t_disease_history d2 ON m1.mb_id = d2.mb_id AND r.history_seq = d2.history_seq
    LEFT OUTER JOIN t_mb_answer m2 ON m1.mb_id = m2.mb_id
    -- t_mb_answer 테이블의 마지막 Row만 조회 하기 위한 JOIN
    LEFT OUTER JOIN t_mb_answer m2_lastrow ON 
        (m1.item_seq = m2_lastrow.item_seq AND m1.mb_id = m2_lastrow.mb_id AND m2.answer_seq < m2_lastrow.answer_seq)
WHERE m1.mb_id = 'mb_id 1' AND 
    -- t_mb_answer 테이블의 마지막 Row만 조회 하기 위한 WHERE
    m2_lastrow.answer_seq IS NULL AND ROWNUM <= 100;