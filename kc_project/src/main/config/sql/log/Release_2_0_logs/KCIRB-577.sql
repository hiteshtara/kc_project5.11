
-- questionnaire answer work related sql
alter table questionnaire_answer_header modify MODULE_ITEM_CODE varchar2(3);
alter table QUESTIONNAIRE_ANSWER add QUESTIONNAIRE_QUESTIONS_ID_FK number(12,0) not null;

INSERT INTO KRIM_PERM_TMPL_T (PERM_TMPL_ID, NM, DESC_TXT, KIM_TYP_ID, ACTV_IND, NMSPC_CD, OBJ_ID) 
VALUES (KRIM_PERM_TMPL_ID_S.nextVal, 'Answer Questionnaire Permission', 'Answer Questionnaire', 3, 'Y', 'KC-IDM', SYS_GUID());

INSERT INTO KRIM_PERM_T (PERM_ID, PERM_TMPL_ID, NM, DESC_TXT, ACTV_IND, NMSPC_CD, OBJ_ID) 
VALUES (KRIM_PERM_ID_S.nextVal, KRIM_PERM_TMPL_ID_S.currVal, 'Answer Protocol Questionnaire', null, 'Y', 'KC-PROTOCOL', SYS_GUID());

INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID) 
VALUES (KRIM_ROLE_PERM_ID_S.nextval, 1119, KRIM_PERM_ID_S.currVal, 'Y', SYS_GUID());

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES(KRIM_ATTR_DATA_ID_S.NEXTVAL, SYS_GUID(), '1', KRIM_PERM_ID_S.currVal, '3', '13', 'ProtocolDocument') ;

