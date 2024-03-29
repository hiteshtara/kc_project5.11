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
package org.kuali.kra.iacuc.actions.print;

import org.kuali.kra.iacuc.IacucProtocol;
import org.kuali.kra.iacuc.notification.IacucProtocolNotificationRenderer;
import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.protocol.actions.print.ProtocolPrintWatermarkBase;
import org.kuali.kra.protocol.notification.ProtocolNotificationRendererBase;

public class IacucProtocolPrintWatermark extends ProtocolPrintWatermarkBase implements IacucWatermarkable {

    @Override
    protected ProtocolNotificationRendererBase getNewProtocolNotificationRendererInstanceHook(ProtocolBase protocol) {
        return new IacucProtocolNotificationRenderer((IacucProtocol)protocol);
    }

}
