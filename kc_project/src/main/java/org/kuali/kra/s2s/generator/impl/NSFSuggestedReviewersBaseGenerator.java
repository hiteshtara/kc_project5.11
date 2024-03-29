/*
 * Copyright 2005-2013 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
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
package org.kuali.kra.s2s.generator.impl;

import org.kuali.kra.proposaldevelopment.bo.ProposalAbstract;
import org.kuali.kra.s2s.generator.S2SBaseFormGenerator;

/**
 * This abstract class has methods that are common to all the versions of NSFSuggestedReviewes form.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */

public abstract class NSFSuggestedReviewersBaseGenerator extends S2SBaseFormGenerator {

    protected static final String SUGGESTED_REVIEWERS = "12";
    protected static final String REVIEWERS_NOT_TO_INCLUDE = "14";

    /**
     * 
     * This method returns the abstract Details based on the AbstractTypeCode from the ProposalAbstract
     * 
     * @param abstractType abstract type code.
     * @return abstractText(String) abstract details corresponding to the abstract type code.
     */
    protected String getAbstractText(String abstractType) {

        String abstractText = null;
        for (ProposalAbstract proposalAbstract : pdDoc.getDevelopmentProposal().getProposalAbstracts()) {
            if (proposalAbstract.getAbstractTypeCode() != null && proposalAbstract.getAbstractTypeCode().equals(abstractType)) {
                abstractText = proposalAbstract.getAbstractDetails();
                break;
            }
        }
        return abstractText;
    }
}
