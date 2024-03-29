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

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.kra.rule.event.KraDocumentEventBase;
import org.kuali.rice.core.api.util.type.KualiDecimal;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.krad.rules.rule.BusinessRule;

/**
 * This class is used by AwardPersonCreditSplitRule implementers
 */
public class AwardPersonUnitCreditSplitRuleEvent extends KraDocumentEventBase {
    private static final Log LOG = LogFactory.getLog(AwardPersonUnitCreditSplitRuleEvent.class);
    
    private AwardPerson projectPerson;
    private Map<String, KualiDecimal> totalsByCreditSplitType;
    
    /**
     * Constructs a AwardPersonCreditSplitRuleEvent
     * @param description
     * @param errorPathPrefix
     * @param document
     */
    public AwardPersonUnitCreditSplitRuleEvent(Document document, AwardPerson projectPerson, 
                                                Map<String, KualiDecimal> totalsByCreditSplitType) {
        super("Credit splits invalid", "document.awardList[0].creditSplits.*", document);
        this.projectPerson = projectPerson;
        this.totalsByCreditSplitType =  totalsByCreditSplitType;
    }

    /**
     * Gets the projectPerson attribute. 
     * @return Returns the projectPerson.
     */
    public AwardPerson getProjectPerson() {
        return projectPerson;
    }

    /**
     * @see org.kuali.rice.krad.rules.rule.event.KualiDocumentEvent#getRuleInterfaceClass()
     */
    public Class<AwardPersonUnitCreditSplitRule> getRuleInterfaceClass() {
        return AwardPersonUnitCreditSplitRule.class;
    }

    /**
     * Gets the totalsByCreditSplitType attribute. 
     * @return Returns the totalsByCreditSplitType.
     */
    public Map<String, KualiDecimal> getTotalsByCreditSplitType() {
        return totalsByCreditSplitType;
    }

    /**
     * @see org.kuali.rice.krad.rules.rule.event.KualiDocumentEvent#invokeRuleMethod(org.kuali.rice.krad.rules.rule.BusinessRule)
     */
    public boolean invokeRuleMethod(BusinessRule rule) {
        return false;
    }

    @Override
    protected void logEvent() {
        LOG.info("Logging event");
    }
}
