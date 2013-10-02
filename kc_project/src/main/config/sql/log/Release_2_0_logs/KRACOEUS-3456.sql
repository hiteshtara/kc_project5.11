-- Create Institutional Proposal Viewer person and user for unit IN-CARD descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'DeptIP', 'Viewer', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'IN-CARD','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '78 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'deptipviewer@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1078', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2078', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'deptipviewer', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Institutional Proposal Viewer';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'IN-CARD', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Institutional Proposal Maintainer person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'InstProposal', 'Maintainer', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '79 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'ipmaintainer@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1078', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2078', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'ipmaintainer', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Institutional Proposal Maintainer';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Intellectual Property Review Maintainer person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'IPReview', 'Maintainer', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '80 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'iprevmaintainer@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1080', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2080', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'iprevmaintainer', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Intellectual Property Review Maintainer';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

COMMIT;