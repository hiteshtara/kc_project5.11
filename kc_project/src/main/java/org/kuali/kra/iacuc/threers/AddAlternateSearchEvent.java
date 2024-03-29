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
package org.kuali.kra.iacuc.threers;

import java.util.List;

import org.kuali.kra.protocol.ProtocolDocumentBase;
import org.kuali.kra.rule.BusinessRuleInterface;
import org.kuali.kra.rule.event.KraDocumentEventBaseExtension;
import org.kuali.rice.krad.document.Document;

public class AddAlternateSearchEvent extends KraDocumentEventBaseExtension {

    private IacucAlternateSearch alternateSearch;
    private List<String> selectedDatabases;
    
    protected AddAlternateSearchEvent(ProtocolDocumentBase document, IacucAlternateSearch alternateSearch, List<String> selectedDatabases) {
        super("Add Alternate Search", "", document);
        
        this.alternateSearch = alternateSearch;
        this.selectedDatabases = selectedDatabases;
    }

    @SuppressWarnings("rawtypes")
    @Override
    public BusinessRuleInterface getRule() {
        return new AddAlternateSearchRule();
    }

    public IacucAlternateSearch getAlternateSearch() {
        return alternateSearch;
    }

    public void setAlternateSearch(IacucAlternateSearch alternateSearch) {
        this.alternateSearch = alternateSearch;
    }

    public List<String> getSelectedDatabases() {
        return selectedDatabases;
    }

    public void setSelectedDatabases(List<String> selectedDatabases) {
        this.selectedDatabases = selectedDatabases;
    }

}
