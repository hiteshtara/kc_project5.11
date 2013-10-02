DELETE FROM PROTOCOL_ATTACHMENT_PERSONNEL;
DELETE FROM PROTOCOL_ATTACHMENT_PROTOCOL;
DELETE FROM PROTOCOL_ATTACHMENT_FILE;
DELETE FROM PROTOCOL_ATTACHMENT_STATUS;
DELETE FROM PROTOCOL_ATTACHMENT_TYPE_GROUP;
DELETE FROM PROTOCOL_ATTACHMENT_TYPE;
DELETE FROM PROTOCOL_ATTACHMENT_GROUP;
commit;

alter table protocol_attachment_personnel modify description varchar2(200) null;
alter table protocol_attachment_protocol 
modify (description varchar2(200) null, 
status_cd varchar2(3) null);

ALTER TABLE PROTOCOL_ATTACHMENT_PROTOCOL
	DROP CONSTRAINT UQ_PA_PROTOCOL';

INSERT INTO PROTOCOL_ATTACHMENT_STATUS ( STATUS_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 1, 'Incomplete', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_STATUS ( STATUS_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 2, 'Complete', sysdate, user );
commit;

INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 1, 'Informed Consent Document', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 2, 'Recruitment Brochure', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 3, 'Advertisement', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 4, 'Protocol Narrative', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 5, 'Investigator Brochure', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 6, 'Children''s Assent Form', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 7, 'HIPAA Research Authorization Form', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 8, 'HIPAA Waiver of Research Authorization Form', sysdate, user );
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 9, 'Adverse Event', sysdate, user );
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 10, 'Biography', sysdate, user );
INSERT INTO PROTOCOL_ATTACHMENT_TYPE ( TYPE_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 11, 'Other', sysdate, user );
commit;

INSERT INTO PROTOCOL_ATTACHMENT_GROUP ( GROUP_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 1, 'Protocol Attachments', sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_GROUP ( GROUP_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 2, 'Personnel Attachments', sysdate, user );
commit;

INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 1, 1, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 2, 2, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 3, 3, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 4, 4, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 5, 5, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 6, 6, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 7, 7, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 8, 8, 1, sysdate, user ); 
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 9, 9, 1, sysdate, user );
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 10, 11, 1, sysdate, user );
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 11, 10, 2, sysdate, user );
INSERT INTO PROTOCOL_ATTACHMENT_TYPE_GROUP ( TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER ) 
	VALUES ( 12, 11, 2, sysdate, user );
commit;
