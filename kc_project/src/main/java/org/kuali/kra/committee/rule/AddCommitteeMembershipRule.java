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
package org.kuali.kra.committee.rule;

import org.kuali.kra.committee.rule.event.AddCommitteeMembershipEvent;
import org.kuali.rice.krad.rules.rule.BusinessRule;

/**
 * 
 * This interface addresses the adds rule for adding a new <code>CommitteeMembership</code>
 * 
 * @author Kuali Research Administration Team (kc.dev@kuali.org)
 */
public interface AddCommitteeMembershipRule extends BusinessRule {
    
    /**
     * 
     * ProcessDefinitionDefinitiones the validation rules for an <code>{@link AddCommitteeMembershipEvent}</code>
     * 
     * @param addCommitteeMembershipEvent
     * @return <code>true</code> if valid, <code>false</code> otherwise
     */
    public boolean processAddCommitteeMembershipBusinessRules(AddCommitteeMembershipEvent addCommitteeMembershipEvent);
}
