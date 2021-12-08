select * from t_member;






--���̺� ���� (������)
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

COMMENT ON TABLE t_member IS 'ȸ�� ����'
/

COMMENT ON COLUMN t_member.mb_id IS 'ȸ�� ���̵�'
/

COMMENT ON COLUMN t_member.mb_pw IS 'ȸ�� ��й�ȣ'
/

COMMENT ON COLUMN t_member.mb_email IS 'ȸ�� �̸���'
/

COMMENT ON COLUMN t_member.mb_name IS 'ȸ�� �̸�'
/

COMMENT ON COLUMN t_member.mb_gender IS 'ȸ�� ����'
/

COMMENT ON COLUMN t_member.mb_phone IS 'ȸ�� ����ó'
/

COMMENT ON COLUMN t_member.mb_birthdate IS 'ȸ�� �������'
/

COMMENT ON COLUMN t_member.mb_addr IS 'ȸ�� �ּ�'
/

COMMENT ON COLUMN t_member.mb_joindate IS 'ȸ�� ��������'
/

COMMENT ON COLUMN t_member.admin_yn IS '������ ����'
/

COMMENT ON COLUMN t_member.mb_point IS 'ȸ�� ����Ʈ'
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

// ����
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

COMMENT ON TABLE t_poll IS '��������'
/

COMMENT ON COLUMN t_poll.poll_seq IS '���� ����'
/

COMMENT ON COLUMN t_poll.poll_title IS '���� ����'
/

COMMENT ON COLUMN t_poll.poll_content IS '���� ����'
/

COMMENT ON COLUMN t_poll.mb_id IS '����� ���̵�'
/

COMMENT ON COLUMN t_poll.reg_date IS '��� ����'
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

COMMENT ON TABLE t_disease IS '���� ����'
/

COMMENT ON COLUMN t_disease.dis_seq IS '���� ����'
/

COMMENT ON COLUMN t_disease.dis_name IS '���� ��'
/

COMMENT ON COLUMN t_disease.dis_content IS '���� ����'
/

COMMENT ON COLUMN t_disease.dis_symptom IS '���� ����'
/

COMMENT ON COLUMN t_disease.dis_pic1 IS '���� ����1'
/

COMMENT ON COLUMN t_disease.dis_pic2 IS '���� ����2'
/

COMMENT ON COLUMN t_disease.dis_pic3 IS '���� ����3'
/

COMMENT ON COLUMN t_disease.dis_pic4 IS '���� ����4'
/

COMMENT ON COLUMN t_disease.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_disease.mb_id IS '����� ���̵�'
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

COMMENT ON TABLE t_checklist IS '���� üũ ����Ʈ'
/

COMMENT ON COLUMN t_checklist.check_seq IS 'üũ ����'
/

COMMENT ON COLUMN t_checklist.dis_seq IS '���� ����'
/

COMMENT ON COLUMN t_checklist.check_item IS 'üũ �׸�'
/

COMMENT ON COLUMN t_checklist.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_checklist.mb_id IS '����� ���̵�'
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

COMMENT ON TABLE t_community IS 'Ŀ�´�Ƽ �Խ���'
/

COMMENT ON COLUMN t_community.article_seq IS '�Խñ� ����'
/

COMMENT ON COLUMN t_community.article_subject IS '�Խñ� ����'
/

COMMENT ON COLUMN t_community.article_content IS '�Խñ� ����'
/

COMMENT ON COLUMN t_community.article_cnt IS '�Խñ� ��ȸ��'
/

COMMENT ON COLUMN t_community.reg_date IS '�Խñ� �������'
/

COMMENT ON COLUMN t_community.mb_id IS '�ۼ��� ���̵�'
/

COMMENT ON COLUMN t_community.article_file1 IS '�Խñ� ����1'
/

COMMENT ON COLUMN t_community.article_file2 IS '�Խñ� ����2'
/

COMMENT ON COLUMN t_community.article_file3 IS '�Խñ� ����3'
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

COMMENT ON TABLE t_food IS '��ǰ ���� ���̺�'
/

COMMENT ON COLUMN t_food.food_seq IS '��ǰ ����'
/

COMMENT ON COLUMN t_food.food_name IS '��ǰ ��'
/

COMMENT ON COLUMN t_food.food_ingredient IS '��ǰ �����'
/

COMMENT ON COLUMN t_food.food_calory IS '��ǰ Į�θ�'
/

COMMENT ON COLUMN t_food.food_effect IS '��ǰ ȿ��'
/

COMMENT ON COLUMN t_food.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_food.food_pic1 IS '��ǰ ����1'
/

COMMENT ON COLUMN t_food.food_pic2 IS '��ǰ ����2'
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

COMMENT ON TABLE t_health_food IS '�ǰ� ��� ��ǰ'
/

COMMENT ON COLUMN t_health_food.health_food_seq IS '�ǰ���ɽ�ǰ ����'
/

COMMENT ON COLUMN t_health_food.health_food_name IS '�ǰ���ɽ�ǰ ��'
/

COMMENT ON COLUMN t_health_food.health_food_ingredient IS '�ǰ���ɽ�ǰ �����'
/

COMMENT ON COLUMN t_health_food.health_food_calory IS '�ǰ���ɽ�ǰ Į�θ�'
/

COMMENT ON COLUMN t_health_food.health_food_effect IS '�ǰ���ɽ�ǰ ȿ��'
/

COMMENT ON COLUMN t_health_food.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_health_food.health_food_pic1 IS '�ǰ���ɽ�ǰ ����1'
/

COMMENT ON COLUMN t_health_food.health_food_pic2 IS '�ǰ���ɽ�ǰ ����2'
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

COMMENT ON TABLE t_rehabilitation IS '��Ȱ �'
/

COMMENT ON COLUMN t_rehabilitation.rehabi_seq IS '��Ȱ ����'
/

COMMENT ON COLUMN t_rehabilitation.rehabi_name IS '��Ȱ ���'
/

COMMENT ON COLUMN t_rehabilitation.rehabi_method IS '��Ȱ ����'
/

COMMENT ON COLUMN t_rehabilitation.reg_date IS '��� ����'
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

COMMENT ON TABLE t_disease_history IS '���� ���� �����丮'
/

COMMENT ON COLUMN t_disease_history.history_seq IS '�����丮 ����'
/

COMMENT ON COLUMN t_disease_history.dis_name IS '���� ��'
/

COMMENT ON COLUMN t_disease_history.dis_symptom IS '���� ����'
/

COMMENT ON COLUMN t_disease_history.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_disease_history.mb_id IS 'ȸ�� ���̵�'
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

COMMENT ON TABLE t_poll_items IS '���� ������'
/

COMMENT ON COLUMN t_poll_items.item_seq IS '���� ������ ����'
/

COMMENT ON COLUMN t_poll_items.poll_seq IS '���� ����'
/

COMMENT ON COLUMN t_poll_items.item_name IS '������ �׸�'
/

COMMENT ON COLUMN t_poll_items.item_content IS '������ ���漳��'
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

COMMENT ON TABLE t_user_check IS '����� üũ ���'
/

COMMENT ON COLUMN t_user_check.user_check_seq IS '�����üũ ����'
/

COMMENT ON COLUMN t_user_check.check_seq IS 'üũ ����'
/

COMMENT ON COLUMN t_user_check.user_check_result IS 'üũ ���'
/

COMMENT ON COLUMN t_user_check.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_user_check.mb_id IS '����� ���̵�'
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

COMMENT ON TABLE t_comment IS '��� ����'
/

COMMENT ON COLUMN t_comment.comment_seq IS '��� ����'
/

COMMENT ON COLUMN t_comment.article_seq IS '���� ����'
/

COMMENT ON COLUMN t_comment.comment_content IS '��� ����'
/

COMMENT ON COLUMN t_comment.reg_date IS '��� �������'
/

COMMENT ON COLUMN t_comment.mb_id IS '�ۼ��� ���̵�'
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

COMMENT ON TABLE t_recommend IS '��õ �ǰ� ����'
/

COMMENT ON COLUMN t_recommend.reco_seq IS '��õ ����'
/

COMMENT ON COLUMN t_recommend.food_seq IS '��ǰ ����'
/

COMMENT ON COLUMN t_recommend.health_food_seq IS '�ǰ���ɽ�ǰ ����'
/

COMMENT ON COLUMN t_recommend.rehabi_seq IS '��Ȱ ����'
/

COMMENT ON COLUMN t_recommend.reg_date IS '��õ ����'
/

COMMENT ON COLUMN t_recommend.mb_id IS 'ȸ�� ���̵�'
/

COMMENT ON COLUMN t_recommend.history_seq IS 'ȸ�� ���� ����'
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

COMMENT ON TABLE t_point IS '����Ʈ ���� �� ��� ����'
/

COMMENT ON COLUMN t_point.point_seq IS '����Ʈ ����'
/

COMMENT ON COLUMN t_point.point IS '����Ʈ ����'
/

COMMENT ON COLUMN t_point.point_memo IS '����Ʈ ����'
/

COMMENT ON COLUMN t_point.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_point.mb_id IS 'ȸ�� ���̵�'
/

COMMENT ON COLUMN t_point.point_kind IS '����Ʈ ����'
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

COMMENT ON TABLE t_hospital IS '���� ���� ���̺�'
/

COMMENT ON COLUMN t_hospital.hos_seq IS '���� ����'
/

COMMENT ON COLUMN t_hospital.hos_name IS '���� ��'
/

COMMENT ON COLUMN t_hospital.hos_addr IS '���� �ּ�'
/

COMMENT ON COLUMN t_hospital.hos_phone IS '���� ��ȭ'
/

COMMENT ON COLUMN t_hospital.hos_latitude IS '���� ����'
/

COMMENT ON COLUMN t_hospital.hos_longitude IS '���� �浵'
/

COMMENT ON COLUMN t_hospital.hos_facilities IS '���� �ü�'
/

COMMENT ON COLUMN t_hospital.reg_date IS '��� ����'
/

COMMENT ON COLUMN t_hospital.mb_id IS '����� ���̵�'
/

COMMENT ON COLUMN t_hospital.hos_pic1 IS '���� ����1'
/

COMMENT ON COLUMN t_hospital.hos_pic2 IS '���� ����2'
/

COMMENT ON COLUMN t_hospital.hos_pic3 IS '���� ����3'
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

COMMENT ON TABLE t_mb_answer IS 'ȸ�� ���� ���� ����'
/

COMMENT ON COLUMN t_mb_answer.answer_seq IS '���� ����'
/

COMMENT ON COLUMN t_mb_answer.item_seq IS '���� ������ ����'
/

COMMENT ON COLUMN t_mb_answer.answer_result IS '���� ���'
/

COMMENT ON COLUMN t_mb_answer.answer_date IS '���� ��¥'
/

COMMENT ON COLUMN t_mb_answer.mb_id IS '������ ���̵�'
/

COMMENT ON COLUMN t_mb_answer.reg_date IS '��� ��¥'
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
(DAO ����)

-- ���̺� ����/���
CREATE TABLE t_member_20211203_171342 AS 
SELECT * FROM t_member;

-- ��� ���̺��� ���� ���̺�� ������ ����(Auto Increment �÷� ����)
INSERT INTO t_member 
    (mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point)
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point 
FROM t_member_20211203_171342;

-- ���̺� ROW ���� Ȯ��
SELECT count(*) 
FROM t_member;

-- ���ǿ� �´� ROW ��ȸ
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
WHERE mb_id = 'mb_id 1';

-- ��� �÷� PK���� �������� ��ȸ
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
ORDER BY mb_id DESC;

-- ��� �÷� 100�� ��ȸ - �Ϲ�����
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
WHERE ROWNUM <= 100;

-- ��� �÷� 100�� ��ȸ - ��������
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM (
    --ROW_NUMBER() : 1���� 2���̾ 1,2������ ������.
    --RANK() : 1���� �θ��̸� ���� ������ 3���� �ȴ�.
    --DENSE_RANK() : 1���� �θ��̸� ���� ������ 2���� �ȴ�.
    SELECT ROW_NUMBER() OVER (ORDER BY mb_id DESC) AS rn, 
        mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
    FROM t_member)
WHERE rn <= 100;

-- SELECT ���� ���� ������ �ٸ� ���� ���
SELECT mb_id, 
    CASE
        --WHEN ���� THEN ���ϰ�
        WHEN mb_pw = 'A' THEN CONCAT(mb_pw, 'Type1')  AType1
                            --CONCAT(A,B) == AB ��ġ��
        WHEN mb_pw = 'B' THEN CONCAT(mb_pw, 'Type2')
        WHEN mb_pw = 'C' THEN CONCAT(mb_pw, 'Type3')
        ELSE CONCAT(mb_pw, 'Type4') END AS mb_pwType, 
    mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member;

-- Ư�� �÷� �ߺ� ����
SELECT DISTINCT mb_pw
FROM t_member;

-- Group By ���� Having���� �̿��Ͽ� Select
SELECT mb_pw, AVG(mb_point)
FROM t_member
GROUP BY mb_pw
HAVING AVG(mb_point) > 50;

-- ��¥ ������ �ش��ϴ� ROW�� ��ȸ
SELECT mb_id, mb_pw, mb_email, mb_name, mb_gender, mb_phone, mb_birthdate, mb_addr, mb_joindate, admin_yn, mb_point
FROM t_member
WHERE mb_birthdate BETWEEN 
    TO_DATE('2015-10-01 23:59:59','yyyy/mm/dd hh24:mi:ss') AND 
    TO_DATE('2015-11-30 23:59:59','yyyy/mm/dd hh24:mi:ss');
-- �Ǵ� WHERE mb_birthdate BETWEEN '2015-10-01' AND '2015-11-30';

-- ��¥�� ���
SELECT TO_CHAR(mb_birthdate, 'yyyy-mm-dd') AS mb_birthdate, COUNT(*) count
FROM t_member
GROUP BY TO_CHAR(mb_birthdate, 'yyyy-mm-dd')
ORDER BY mb_birthdate DESC;

-- Inner Join�� �̿��� ��ȸ
-- ���� ���̺�� ���� ���̺� ��� �����Ͱ� �����ؾ� ��ȸ��
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

-- Outer Join�� �̿��� ��ȸ
-- ���� ���̺��� �����Ͱ� �����ϸ� ��ȸ��(�̶� �������̺��� �÷����� NULL)
-- RIGHT OUTER JOIN�� ����, ���� ���̺� �ٲ� ��
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

-- �ش� ���̺��� �����ϴ� ���̺��� �ֽ� Row�� ��ȸ
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
    -- t_mb_answer ���̺��� ������ Row�� ��ȸ �ϱ� ���� JOIN
    LEFT OUTER JOIN t_mb_answer m2_lastrow ON 
        (m1.item_seq = m2_lastrow.item_seq AND m1.mb_id = m2_lastrow.mb_id AND m2.answer_seq < m2_lastrow.answer_seq)
WHERE m1.mb_id = 'mb_id 1' AND 
    -- t_mb_answer ���̺��� ������ Row�� ��ȸ �ϱ� ���� WHERE
    m2_lastrow.answer_seq IS NULL AND ROWNUM <= 100;