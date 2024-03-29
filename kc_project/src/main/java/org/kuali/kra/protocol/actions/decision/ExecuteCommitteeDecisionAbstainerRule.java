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
package org.kuali.kra.protocol.actions.decision;

import org.kuali.kra.protocol.ProtocolDocumentBase;
import org.kuali.rice.krad.rules.rule.BusinessRule;

/**
 * 
 * This class manages the business rule for adding a new abstainer.
 */
public interface ExecuteCommitteeDecisionAbstainerRule<CD extends CommitteeDecision<?> > extends BusinessRule {
    /**
     * 
     * This method...
     * @param committeeDecision
     * @return
     */
    boolean proccessCommitteeDecisionAbstainerRule(ProtocolDocumentBase document, CD committeeDecision);
}
