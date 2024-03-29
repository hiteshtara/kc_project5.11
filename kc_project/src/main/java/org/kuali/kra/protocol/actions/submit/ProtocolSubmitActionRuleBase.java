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
package org.kuali.kra.protocol.actions.submit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.committee.service.CommitteeService;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.protocol.ProtocolDocumentBase;
import org.kuali.kra.rules.ResearchDocumentRuleBase;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.krad.bo.BusinessObject;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.util.GlobalVariables;

/**
 * Validate a protocol submission to the IRB for review.
 */
/**
 * This class...
 */
public abstract class ProtocolSubmitActionRuleBase extends ResearchDocumentRuleBase implements ExecuteProtocolSubmitActionRule {

    private static final String MANDATORY = "M";
    private ParameterService parameterService;
    private CommitteeService committeeService;

    /**
     * @see org.kuali.kra.irb.actions.submit.ExecuteProtocolSubmitActionRule#processSubmitAction(org.kuali.kra.iacuc.IacucProtocolDocument,
     *      org.kuali.kra.irb.actions.submit.ProtocolSubmitAction)
     */
    public boolean processSubmitAction(ProtocolDocumentBase document, ProtocolSubmitAction submitAction) {

        boolean isValid = validateSubmissionType(document, submitAction);
        isValid &= validateProtocolReviewType(submitAction);
        if (StringUtils.isNotBlank(submitAction.getSubmissionTypeCode())
                && StringUtils.isNotBlank(submitAction.getProtocolReviewTypeCode())) {
            isValid &= isValidSubmReviewType(submitAction);
        }
        if (isMandatory()) {
            isValid &= validateCommittee(submitAction);
            isValid &= validateSchedule(submitAction);
        }
        isValid &= validateReviewers(submitAction);
        isValid &= checkNoSpoofing(submitAction);

        return isValid;

    }


    /**
     * If the committee is mandatory, verify that a committee has been selected.
     */
    private boolean validateCommittee(ProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isBlank(submitAction.getNewCommitteeId())) {
            valid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".committeeId",
                    KeyConstants.ERROR_PROTOCOL_COMMITTEE_NOT_SELECTED);
        }
        return valid;
    }

    /**
     * If the schedule is mandatory, verify that a schedule has been selected.
     */
    private boolean validateSchedule(ProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isBlank(submitAction.getNewScheduleId())) {
            valid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".scheduleId",
                    KeyConstants.ERROR_PROTOCOL_SCHEDULE_NOT_SELECTED);
        }
        return valid;
    }

    /**
     * Validate the Submission Type.
     */
    private boolean validateSubmissionType(ProtocolDocumentBase document, ProtocolSubmitAction submitAction) {
        boolean isValid = true;
        String submissionTypeCode = submitAction.getSubmissionTypeCode();
        if (StringUtils.isBlank(submissionTypeCode)) {
            // If the user didn't select a submission type, i.e. he/she choose the "select:" option,
            // then the Submission Type Code will be "blank".
            isValid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".submissionTypeCode",
                    KeyConstants.ERROR_PROTOCOL_SUBMISSION_TYPE_NOT_SELECTED);
        }
        else {
            isValid = isValidSubmTypeQual(submitAction);
        }
        return isValid;
    }

    /**
     * Validate the ProtocolBase Review Type.
     */
    private boolean validateProtocolReviewType(ProtocolSubmitAction submitAction) {
        boolean isValid = true;
        String protocolReviewTypeCode = submitAction.getProtocolReviewTypeCode();
        if (StringUtils.isBlank(protocolReviewTypeCode)) {
            // If the user didn't select a review type, i.e. he/she choose the "select:" option,
            // then the ProtocolBase Review Type Code will be "blank".
            isValid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".protocolReviewTypeCode",
                    KeyConstants.ERROR_PROTOCOL_REVIEW_TYPE_NOT_SELECTED);
        }
        else if (isReviewTypeInvalid(protocolReviewTypeCode)) {
            isValid = false;
            this.reportError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".protocolReviewTypeCode",
                    KeyConstants.ERROR_PROTOCOL_REVIEW_TYPE_INVALID, new String[] { protocolReviewTypeCode });
        }
        return isValid;
    }

    /**
     * Validate the reviewers.
     */
    private boolean validateReviewers(ProtocolSubmitAction submitAction) {
        boolean isValid = true;
        return isValid;
    }


    /**
     * 
     * This method checks to make sure that the reviewers list submitted is actually the same as that made available for that
     * protocol, committee and schedule, i.e. no spoofing of hidden input fields has taken place.
     * 
     * @param submitAction
     * @return
     */
    public boolean checkNoSpoofing(ProtocolSubmitAction submitAction) {
        boolean isValid = true;
        return isValid;
    }

    private boolean isValidSubmReviewType(ProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isNotBlank(submitAction.getSubmissionTypeCode())
                && StringUtils.isNotBlank(submitAction.getProtocolReviewTypeCode())) {            
            
        }
        return valid;
    }

    private boolean isValidSubmTypeQual(ProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isNotBlank(submitAction.getSubmissionTypeCode())) {
            Map<String, String> fieldValues = new HashMap<String, String>();
            fieldValues.put("submissionTypeCode", submitAction.getSubmissionTypeCode());
        }
        return valid;
    }

    private boolean isSubmissionTypeInvalid(String submissionTypeCode) {
        return !existsUnique(getProtocolSubmissionTypeClassHook(), "submissionTypeCode", submissionTypeCode);
    }

    protected abstract Class<? extends ProtocolSubmissionTypeBase> getProtocolSubmissionTypeClassHook();
    

    private boolean isReviewTypeInvalid(String reviewTypeCode) {
        return !existsUnique(getProtocolReviewTypeClassHook(), "reviewTypeCode", reviewTypeCode);
    }
    
    protected abstract Class<? extends ProtocolReviewTypeBase> getProtocolReviewTypeClassHook();

    /**
     * Returns true if exactly one instance of a given business object type exists in the Database; false otherwise.
     * 
     * @param boType
     * @param propertyName the name of the BO field to query
     * @param keyField the field to test against.
     * @return true if one object exists; false if no objects or more than one are found
     */
    private boolean existsUnique(Class<? extends BusinessObject> boType, String propertyName, String keyField) {
        if (keyField != null) {
            BusinessObjectService businessObjectService = KraServiceLocator.getService(BusinessObjectService.class);
            Map<String, String> fieldValues = new HashMap<String, String>();
            fieldValues.put(propertyName, keyField);
            if (businessObjectService.countMatching(boType, fieldValues) == 1) {
                return true;
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    private BusinessObject getBo(Class<? extends BusinessObject> boType, String propertyName, String keyField) {
        Map<String, String> fieldValues = new HashMap<String, String>();
        fieldValues.put(propertyName, keyField);

        List<BusinessObject> results = (List<BusinessObject>) getBusinessObjectService().findMatching(boType, fieldValues);
        if (results.isEmpty()) {
            return null;
        }
        else {
            return results.get(0);
        }
    }

    /**
     * Is it mandatory for the submission to contain the committee and schedule?
     * 
     * @return true if mandatory; otherwise false
     */
    private boolean isMandatory() {
        final String param = this.getParameterService().getParameterValueAsString(getProtocolDocumentClassHook(),
                Constants.PARAMETER_IRB_COMM_SELECTION_DURING_SUBMISSION);

        return StringUtils.equalsIgnoreCase(MANDATORY, param);
    }

    protected abstract Class<? extends ProtocolDocumentBase> getProtocolDocumentClassHook();


    /**
     * Looks up and returns the ParameterService.
     * 
     * @return the parameter service.
     */
    protected ParameterService getParameterService() {
        if (this.parameterService == null) {
            this.parameterService = KraServiceLocator.getService(ParameterService.class);
        }
        return this.parameterService;
    }

    private CommitteeService getCommitteeService() {
        if (null == this.committeeService) {
            this.committeeService = KraServiceLocator.getService(CommitteeService.class);
        }
        return this.committeeService;
    }

    /**
     * 
     * This method can be used in production for injecting a real committee service, and in testing it can be used for setting a
     * mock service.
     * 
     * @param committeeService
     */
    public void setCommitteeService(CommitteeService committeeService) {
        this.committeeService = committeeService;
    }

}
