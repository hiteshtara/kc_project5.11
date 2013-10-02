CREATE TABLE AWARD_PAYMENT_SCHEDULE ( 
	AWARD_PAYMENT_SCHEDULE_ID NUMBER(12,0) NOT NULL, 
	AWARD_ID NUMBER(12,0) NOT NULL, 
	AWARD_NUMBER VARCHAR2(10) NOT NULL, 
	SEQUENCE_NUMBER NUMBER(4,0) NOT NULL, 
	DUE_DATE DATE NOT NULL, 
	AMOUNT NUMBER(12,2), 
	UPDATE_TIMESTAMP DATE NOT NULL, 
	UPDATE_USER VARCHAR2(60) NOT NULL, 
	SUBMIT_DATE DATE, 
	SUBMITTED_BY VARCHAR2(9), 
	INVOICE_NUMBER VARCHAR2(10), 
	STATUS_DESCRIPTION VARCHAR2(50),
	STATUS VARCHAR2(5),
	VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
	OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);

ALTER TABLE AWARD_PAYMENT_SCHEDULE 
ADD CONSTRAINT PK_AWARD_PAYMENT_SCHEDULE 
PRIMARY KEY (AWARD_PAYMENT_SCHEDULE_ID);

ALTER TABLE AWARD_PAYMENT_SCHEDULE 
ADD CONSTRAINT FK_AWARD_PAYMENT_SCHEDULE 
FOREIGN KEY (AWARD_ID) 
REFERENCES AWARD (AWARD_ID);

CREATE OR REPLACE VIEW OSP$AWARD_PAYMENT_SCHEDULE AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER, 
	DUE_DATE, 
	AMOUNT, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER, 
	SUBMIT_DATE, 
	SUBMITTED_BY, 
	INVOICE_NUMBER, 
	STATUS_DESCRIPTION
FROM AWARD_PAYMENT_SCHEDULE;


COMMIT;