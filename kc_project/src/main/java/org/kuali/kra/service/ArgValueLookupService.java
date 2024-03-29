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
package org.kuali.kra.service;

import java.util.List;

import org.kuali.kra.bo.ArgValueLookup;


public interface ArgValueLookupService {

    /**
     * This method gets a sorted list of unique argument names and formats them to be used with the 
     * updateLookupReturn_Callback JavaScript function of kuali_applications.js.  
     * 
     * @return unique argument names formatted for updateLookupReturn_Callback
     */
    String getArgumentNames();

    /**
     * this method returns all the values mentioned in the arg_lookup_value table for the given argument name
     */
    public List<ArgValueLookup> getArgumentValues(String argumentName);
 }
