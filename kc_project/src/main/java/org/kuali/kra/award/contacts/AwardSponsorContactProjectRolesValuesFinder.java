/*
 * Copyright 2005-2013 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.award.contacts;

import java.util.List;

import org.kuali.kra.award.home.ContactRole;
import org.kuali.kra.award.home.ContactType;

/**
 * This class finds Award Unit Contact Project Roles.
 */
public class AwardSponsorContactProjectRolesValuesFinder extends AwardContactsProjectRoleValuesFinder {

    /**
     * {@inheritDoc}
     * @see org.kuali.kra.award.contacts.AwardContactsProjectRoleValuesFinder#getKeyValues()
     */
    @Override
    @SuppressWarnings("unchecked")
    public List getKeyValues() {
        return buildKeyValues(getKeyValuesService().findAllOrderBy(getRoleType(), "description", true));
    }
    
    @Override
    protected Class<? extends ContactRole> getRoleType() {
        return ContactType.class;
    }
}
