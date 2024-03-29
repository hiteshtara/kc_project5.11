/*
 * Copyright 2005-2013 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
CREATE TABLE SH_NTE_TYP_T (
        NTE_TYP_CD                     VARCHAR2(4) CONSTRAINT SH_NTE_TYP_TN1 NOT NULL,
        OBJ_ID                         VARCHAR2(36) DEFAULT SYS_GUID() CONSTRAINT SH_NTE_TYP_TN2 NOT NULL,
        VER_NBR                        NUMBER(8) DEFAULT 1 CONSTRAINT SH_NTE_TYP_TN3 NOT NULL,
        NTE_TYP_DESC                   VARCHAR2(100),
        NTE_TYP_ACTV_IND               VARCHAR2(1),
     CONSTRAINT SH_NTE_TYP_TP1 PRIMARY KEY (
        NTE_TYP_CD) USING INDEX TABLESPACE KUL_IDX03,
     CONSTRAINT SH_NTE_TYP_TC0 UNIQUE (OBJ_ID) USING INDEX TABLESPACE KUL_IDX03
)
TABLESPACE KUL03;
