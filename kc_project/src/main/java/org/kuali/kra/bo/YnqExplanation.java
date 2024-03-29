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
package org.kuali.kra.bo;


public class YnqExplanation extends KraPersistableBusinessObjectBase {

    private String explanationType;

    private String questionId;

    private String explanation;

    private YnqExplanationType ynqExplanationType;

    public YnqExplanation() {
        super();
    }

    public String getExplanationType() {
        return explanationType;
    }

    public void setExplanationType(String explanationType) {
        this.explanationType = explanationType;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public YnqExplanationType getYnqExplanationType() {
        return ynqExplanationType;
    }

    public void setYnqExplanationType(YnqExplanationType ynqExplanationType) {
        this.ynqExplanationType = ynqExplanationType;
    }
}
