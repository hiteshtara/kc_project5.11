CREATE TABLE PROPOSAL_EXEMPT_NUMBER (
    PROPOSAL_EXEMPT_NUMBER_ID NUMBER (12, 0) , 
    PROPOSAL_SPECIAL_REVIEW_ID NUMBER (12, 0) , 
    EXEMPTION_TYPE_CODE VARCHAR2 (3) , 
    UPDATE_USER VARCHAR2 (60) , 
    UPDATE_TIMESTAMP DATE, 
    VER_NBR NUMBER (8, 0) DEFAULT 1, 
    OBJ_ID VARCHAR2 (36) DEFAULT SYS_GUID () ) ;

ALTER TABLE PROPOSAL_EXEMPT_NUMBER 
    ADD CONSTRAINT PK_PROPOSAL_EXEMPT_NUMBER 
            PRIMARY KEY (PROPOSAL_EXEMPT_NUMBER_ID) ;
ALTER TABLE PROPOSAL_EXEMPT_NUMBER 
    ADD CONSTRAINT FK_PROP_EXEMPTION_TYPE_CODE
            FOREIGN KEY (EXEMPTION_TYPE_CODE) 
                REFERENCES EXEMPTION_TYPE (EXEMPTION_TYPE_CODE) ;
ALTER TABLE PROPOSAL_EXEMPT_NUMBER 
    ADD CONSTRAINT FK_PROPOSAL_SPECIAL_REVIEW_ID 
            FOREIGN KEY (PROPOSAL_SPECIAL_REVIEW_ID) 
                REFERENCES PROPOSAL_SPECIAL_REVIEW (PROPOSAL_SPECIAL_REVIEW_ID) ; 
                
CREATE SEQUENCE SEQ_PROPOSAL_EXEMPT_NUMBER_ID INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE SEQ_PROPOSAL_SPECIAL_REVIEW_ID INCREMENT BY 1 START WITH 1;

ALTER TABLE PROPOSAL_SPECIAL_REVIEW
ADD EXPIRATION_DATE DATE;

ALTER TABLE PROPOSAL_SPECIAL_REVIEW
DISABLE CONSTRAINT UQ_PROPOSAL_SPECIAL_REVIEW;

ALTER TABLE PROPOSAL_NOTEPAD
DISABLE CONSTRAINT UQ_PROPOSAL_NOTEPAD;

commit;

