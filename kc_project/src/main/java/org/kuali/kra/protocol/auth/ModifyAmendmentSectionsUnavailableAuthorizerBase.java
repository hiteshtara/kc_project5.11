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
package org.kuali.kra.protocol.auth;


public abstract class ModifyAmendmentSectionsUnavailableAuthorizerBase extends ProtocolAuthorizerBase {

    /**
     * @see org.kuali.kra.protocol.auth.ProtocolAuthorizerBase#isAuthorized(java.lang.String, org.kuali.kra.protocol.auth.ProtocolTaskBase)
     */
    public boolean isAuthorized(String userId, ProtocolTaskBase task) {
        return hasPermission(userId, task.getProtocol(), getPermissionCreateAmendmentHook()) &&
               (!isAmendmentOrRenewal(task.getProtocol()) ||
                !canExecuteAction(task.getProtocol(), getActionTypeModifyAmendmentHook()));
    }

    protected abstract String getActionTypeModifyAmendmentHook();
    protected abstract String getPermissionCreateAmendmentHook();

}
