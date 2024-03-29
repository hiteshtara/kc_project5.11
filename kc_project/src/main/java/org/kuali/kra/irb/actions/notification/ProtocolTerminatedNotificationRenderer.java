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
package org.kuali.kra.irb.actions.notification;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.kuali.kra.irb.Protocol;
import org.kuali.kra.irb.notification.IRBNotificationRenderer;

/**
 * Renders additional fields for the Notify IRB notification.
 */
public class ProtocolTerminatedNotificationRenderer extends IRBNotificationRenderer {

    private static final long serialVersionUID = -6321174692715820351L;

    private String actionComments;

    /**
     * Constructs a Notify IRB notification renderer.
     * @param protocol
     * @param actionComments
     */
    public ProtocolTerminatedNotificationRenderer(Protocol protocol, String actionComments) {
        super(protocol);
        
        this.actionComments = actionComments;
    }
    
    public String getActionComments() {
        return actionComments;
    }

    public void setActionComments(String actionComments) {
        this.actionComments = actionComments;
    }
    
    /**
     * {@inheritDoc}
     * @see org.kuali.kra.common.notification.NotificationContext#replaceContextVariables(java.lang.String)
     */
    @Override
    public Map<String, String> getDefaultReplacementParameters() {
        Map<String, String> params = super.getDefaultReplacementParameters();
        params.put("{TERMINATED_DATE}", (new SimpleDateFormat("d'-'MMM'-'yyyy")).format(new Date()));
        return params;
    }

}