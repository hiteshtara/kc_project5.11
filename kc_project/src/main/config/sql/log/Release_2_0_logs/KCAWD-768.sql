DELETE FROM KRIM_ROLE_MBR_ATTR_DATA_T
  WHERE ROLE_MBR_ID IN 
  (
    SELECT ROLE_MBR_ID FROM KRIM_ROLE_MBR_T 
    WHERE ROLE_ID IN 
      (
        SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Viewer' AND NMSPC_CD = 'KC-AWARD'
      )
    AND MBR_ID IN 
      (
        SELECT PRNCPL_ID FROM KRIM_PRNCPL_T 
        WHERE PRNCPL_NM IN ('awdbudadmin','awdbudaggregator','awdbudapprover','awdbudmaintainer','awdbudmodifier','awddocmaintainer','awdmodifier')
      )
    );

DELETE FROM KRIM_ROLE_MBR_T 
  WHERE ROLE_ID IN 
  (
    SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Viewer' AND NMSPC_CD = 'KC-AWARD'
  )
  AND MBR_ID IN 
  (
    SELECT PRNCPL_ID FROM KRIM_PRNCPL_T 
    WHERE PRNCPL_NM IN ('awdbudadmin','awdbudaggregator','awdbudapprover','awdbudmaintainer','awdbudmodifier','awddocmaintainer','awdmodifier')
  );

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR) 
VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Budget Administrator' AND NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Award' AND NMSPC_CD = 'KC-AWARD'),
'Y',SYS_GUID(),1);

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR) 
VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Budget Maintainer' AND NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Award' AND NMSPC_CD = 'KC-AWARD'),
'Y',SYS_GUID(),1);

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR) 
VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Budget Aggregator' AND NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Award' AND NMSPC_CD = 'KC-AWARD'),
'Y',SYS_GUID(),1);

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR) 
VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Budget Approver' AND NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Award' AND NMSPC_CD = 'KC-AWARD'),
'Y',SYS_GUID(),1);

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR) 
VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Budget Modifier' AND NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Award' AND NMSPC_CD = 'KC-AWARD'),
'Y',SYS_GUID(),1);

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR) 
VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Budget Viewer' AND NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Award' AND NMSPC_CD = 'KC-AWARD'),
'Y',SYS_GUID(),1);

COMMIT;