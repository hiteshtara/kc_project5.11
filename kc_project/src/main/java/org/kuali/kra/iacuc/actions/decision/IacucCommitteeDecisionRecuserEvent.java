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
package org.kuali.kra.iacuc.actions.decision;

import org.apache.commons.logging.Log;
import org.kuali.kra.iacuc.IacucProtocolDocument;
import org.kuali.kra.protocol.actions.decision.CommitteeDecisionRecuserEventBase;


public class IacucCommitteeDecisionRecuserEvent extends CommitteeDecisionRecuserEventBase<IacucCommitteeDecision> {
    
    private static final org.apache.commons.logging.Log LOG = org.apache.commons.logging.LogFactory.getLog(IacucCommitteeDecisionRecuserEvent.class);

    public IacucCommitteeDecisionRecuserEvent(IacucProtocolDocument document, IacucCommitteeDecision decision) {
        super(document, decision);
    }
    
    @Override
    protected Log getLOGHook() {
        return LOG;
    }
    
}
