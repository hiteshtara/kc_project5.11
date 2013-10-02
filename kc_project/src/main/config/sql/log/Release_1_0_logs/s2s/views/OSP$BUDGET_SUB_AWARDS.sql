create or replace view OSP$BUDGET_SUB_AWARDS as 
	select A.PROPOSAL_NUMBER,A.VERSION_NUMBER,A.SUB_AWARD_NUMBER,ORGANIZATION_NAME,
				SUB_AWARD_STATUS_CODE,B.SUB_AWARD_XFD_FILE SUB_AWARD_XFD_FILE,A.SUB_AWARD_XFD_FILE_NAME,
				A.COMMENTS,A.XFD_UPDATE_USER,A.XFD_UPDATE_TIMESTAMP,B.SUB_AWARD_XML_FILE SUB_AWARD_XML_FILE,
				A.TRANSLATION_COMMENTS,A.XML_UPDATE_USER,A.XML_UPDATE_TIMESTAMP,A.UPDATE_TIMESTAMP,A.UPDATE_USER	
	from BUDGET_SUB_AWARDS A,BUDGET_SUB_AWARD_FILES B
	where A.PROPOSAL_NUMBER = B.PROPOSAL_NUMBER 
			and A.VERSION_NUMBER = B.VERSION_NUMBER
			and A.SUB_AWARD_NUMBER = B.SUB_AWARD_NUMBER(+);