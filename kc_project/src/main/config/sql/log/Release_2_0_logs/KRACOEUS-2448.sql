CREATE SEQUENCE SEQ_QUESTON_ID INCREMENT BY 1 START WITH 1;

CREATE TABLE QUESTIONNAIRE_ANSWER_HEADER ( 
    QUESTIONNAIRE_ANSWER_HEADER_ID NUMBER(12,0) NOT NULL,
    QUESTIONNAIRE_ID_FK NUMBER(12,0) NOT NULL, 
    MODULE_ITEM_CODE NUMBER(3,0) NOT NULL, 
    MODULE_ITEM_KEY VARCHAR2(20) NOT NULL, 
    MODULE_SUB_ITEM_CODE NUMBER(3,0) NOT NULL, 
    MODULE_SUB_ITEM_KEY VARCHAR2(20) NOT NULL, 
    QUESTIONNAIRE_COMPLETED_FLAG VARCHAR2(1) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);

ALTER TABLE QUESTIONNAIRE_ANSWER_HEADER 
ADD CONSTRAINT PK_QUESTIONNAIRE_ANSWER_HEADER
PRIMARY KEY (QUESTIONNAIRE_ANSWER_HEADER_ID);

CREATE TABLE QUESTIONNAIRE_ANSWER ( 
    QUESTIONNAIRE_ANSWER_ID NUMBER(12,0) NOT NULL, 
    QUESTIONNAIRE_AH_ID_FK NUMBER(12,0) NOT NULL, 
    QUESTION_ID_FK NUMBER(6,0) NOT NULL, 
    QUESTION_NUMBER NUMBER(6,0) NOT NULL, 
    ANSWER_NUMBER NUMBER(3,0) NOT NULL, 
    ANSWER VARCHAR2(2000), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);
 
ALTER TABLE QUESTIONNAIRE_ANSWER 
ADD CONSTRAINT PK_QUESTIONNAIRE_ANSWER 
PRIMARY KEY (QUESTIONNAIRE_ANSWER_ID);

ALTER TABLE QUESTIONNAIRE_ANSWER 
ADD CONSTRAINT UQ_QUESTIONNAIRE_ANSWER 
UNIQUE (QUESTIONNAIRE_AH_ID_FK, QUESTION_NUMBER, ANSWER_NUMBER);

ALTER TABLE QUESTIONNAIRE_ANSWER 
ADD CONSTRAINT FK_QUESTIONNAIRE_ANS_COMP_ID 
FOREIGN KEY (QUESTIONNAIRE_AH_ID_FK) 
REFERENCES QUESTIONNAIRE_ANSWER_HEADER (QUESTIONNAIRE_ANSWER_HEADER_ID);

CREATE OR REPLACE VIEW OSP$QUESTIONNAIRE_ANS_HEADER AS SELECT 
    MODULE_ITEM_CODE, 
    MODULE_ITEM_KEY, 
    MODULE_SUB_ITEM_CODE, 
    MODULE_SUB_ITEM_KEY, 
    QUESTIONNAIRE_ID_FK, 
    QUESTIONNAIRE_ANSWER_HEADER_ID, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER, 
    QUESTIONNAIRE_COMPLETED_FLAG
FROM QUESTIONNAIRE_ANSWER_HEADER;

CREATE OR REPLACE VIEW OSP$QUESTIONNAIRE_ANSWERS AS SELECT 
    QUESTIONNAIRE_AH_ID_FK, 
    QUESTION_ID_FK, 
    QUESTION_NUMBER, 
    ANSWER_NUMBER, 
    ANSWER, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM QUESTIONNAIRE_ANSWER;