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
package org.kuali.kra.protocol.actions.print;

import java.util.List;

import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.questionnaire.answer.AnswerHeader;

public interface ProtocolQuestionnairePrintingService {

    /**
     * This method is to set up the questionnaire print list.  Then sorted it.
     * @param answerHeaders
     * @param protocol
     * @param questionnairesToPrints
     */
    public void setupQnPrintOption(List<AnswerHeader> answerHeaders, ProtocolBase protocol, List<QuestionnairePrintOption> questionnairesToPrints);

}
