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
package org.kuali.kra.protocol.actions.decision;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.common.committee.bo.CommitteeMembershipBase;
import org.kuali.kra.common.committee.service.CommitteeServiceBase;
import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.protocol.ProtocolFinderDao;
import org.kuali.kra.protocol.actions.ProtocolActionBase;
import org.kuali.kra.protocol.actions.reviewcomments.ReviewCommentsBeanBase;
import org.kuali.kra.protocol.actions.submit.ProtocolActionService;
import org.kuali.kra.protocol.actions.submit.ProtocolSubmissionBase;
import org.kuali.kra.common.committee.meeting.CommitteeScheduleMinuteBase;
import org.kuali.kra.common.committee.meeting.MinuteEntryType;
import org.kuali.kra.common.committee.meeting.ProtocolMeetingVoterBase;
import org.kuali.kra.common.committee.meeting.ProtocolVoteAbstaineeBase;
import org.kuali.kra.common.committee.meeting.ProtocolVoteRecusedBase;
import org.kuali.rice.krad.bo.BusinessObject;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.service.DocumentService;
import org.mvel2.ast.Proto;

/**
 * The CommitteeDecisionService implementation.
 */
public abstract class CommitteeDecisionServiceImplBase<CD extends CommitteeDecision<? extends CommitteePersonBase> > implements CommitteeDecisionService<CD> {

    private BusinessObjectService businessObjectService;
    private ProtocolActionService protocolActionService;
    private CommitteeServiceBase committeeService;
    private DocumentService documentService;
    private ProtocolFinderDao protocolFinderDao;

    public void setBusinessObjectService(BusinessObjectService businessObjectService) {
        this.businessObjectService = businessObjectService;
    }
    
    public void setProtocolActionService(ProtocolActionService protocolActionService) {
        this.protocolActionService = protocolActionService;
    }
    
    public void setCommitteeService(CommitteeServiceBase committeeService) {
        this.committeeService = committeeService;
    }

    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }

    /**
     * {@inheritDoc}
     * @see org.kuali.kra.irb.actions.decision.CommitteeDecisionService#setCommitteeDecision(org.kuali.kra.irb.ProtocolBase, 
     *      org.kuali.kra.irb.actions.decision.CommitteeDecision)
     */
    public void processCommitteeDecision(ProtocolBase protocol, CD committeeDecision) throws Exception {
        ProtocolSubmissionBase submission = getSubmission(protocol);
        
        if (submission != null) {
            submission.setCommitteeDecisionMotionTypeCode(committeeDecision.getMotionTypeCode());
            submission.setYesVoteCount(committeeDecision.getYesCount());
            submission.setNoVoteCount(committeeDecision.getNoCount());
            submission.setAbstainerCount(committeeDecision.getAbstainCount());
            submission.setRecusedCount(committeeDecision.getRecusedCount());
            submission.setVotingComments(committeeDecision.getVotingComments());
            
            addReviewComments(submission, committeeDecision.getReviewCommentsBean());

            ProtocolActionBase protocolAction = getNewProtocolActionInstanceHook(protocol, submission, getProtocolActionTypeCodeForRecordCommitteeDecisionHook());
            protocolAction.setComments(committeeDecision.getVotingComments());
            protocolActionService.updateProtocolStatus(protocolAction, protocol);
            protocol.getProtocolActions().add(protocolAction);
            businessObjectService.save(protocolAction);
            
            List<CommitteeMembershipBase> committeeMemberships =  
                committeeService.getAvailableMembers(protocol.getProtocolSubmission().getCommitteeId(), protocol.getProtocolSubmission().getScheduleId());
            
            proccessAbstainers(committeeDecision, committeeMemberships, protocol, submission.getScheduleIdFk(), submission.getSubmissionId());
            proccessRecusers(committeeDecision, committeeMemberships, protocol, submission.getScheduleIdFk(), submission.getSubmissionId());
            
            documentService.saveDocument(protocol.getProtocolDocument());
            protocol.refresh();
        }
    }

    protected abstract String getProtocolActionTypeCodeForRecordCommitteeDecisionHook();

    protected abstract ProtocolActionBase getNewProtocolActionInstanceHook(ProtocolBase protocol, ProtocolSubmissionBase submission, String recordCommitteeDecisionActionCode);
    

    protected void proccessAbstainers(CD committeeDecision, List<CommitteeMembershipBase> committeeMemberships, 
            ProtocolBase protocol, Long scheduleIdFk, Long submissionIdFk) {       
        if (!committeeDecision.getAbstainers().isEmpty()) {
            //there are abstainers, lets save them
            for (CommitteePersonBase person : committeeDecision.getAbstainers()) {
                for (CommitteeMembershipBase membership : committeeMemberships) {
                    if (membership.getCommitteeMembershipId().equals(person.getMembershipId())) {
                        //check to see if it is already been persisted
                        Map fieldValues = getFieldValuesMap(protocol.getProtocolId(), scheduleIdFk, membership.getPersonId(), membership.getRolodexId(), submissionIdFk);
                        
                        if (businessObjectService.findMatching(getProtocolVoteAbstaineeBOClassHook(), fieldValues).size() == 0) {
                            //we found a match, and has not been saved, lets make a ProtocolVoteAbstaineeBase and save it
                            saveProtocolMeetingVoter(getNewProtocolVoteAbstaineeInstanceHook(), protocol, scheduleIdFk, membership.getPersonId(), membership.getRolodexId(), submissionIdFk);
                        }
                        break;
                    }
                }
            }
        }       
        if (!committeeDecision.getAbstainersToDelete().isEmpty()) {
            for (CommitteePersonBase person : committeeDecision.getAbstainersToDelete()) {
                for (CommitteeMembershipBase membership : committeeMemberships) {
                    if (membership.getCommitteeMembershipId().equals(person.getMembershipId())) {
                        Map fieldValues = getFieldValuesMap(protocol.getProtocolId(), scheduleIdFk, membership.getPersonId(), membership.getRolodexId(), submissionIdFk);
                        businessObjectService.deleteMatching(getProtocolVoteAbstaineeBOClassHook(), fieldValues);
                    }
                }
            }
            committeeDecision.getAbstainersToDelete().clear();
        }
        
    }
    
    protected abstract Class<? extends ProtocolVoteAbstaineeBase> getProtocolVoteAbstaineeBOClassHook();

    protected abstract ProtocolVoteAbstaineeBase getNewProtocolVoteAbstaineeInstanceHook();

    
    
    protected void proccessRecusers(CD committeeDecision, List<CommitteeMembershipBase> committeeMemberships, 
            ProtocolBase protocol, Long scheduleIdFk, Long submissionIdFk) {     
        
        if (!committeeDecision.getRecused().isEmpty()) {
            //there are recusers, lets save them
            for (CommitteePersonBase person : committeeDecision.getRecused()) {
                for (CommitteeMembershipBase membership : committeeMemberships) {
                    if (membership.getCommitteeMembershipId().equals(person.getMembershipId())) {
                        //check to see if it is already been persisted
                        Map fieldValues = getFieldValuesMap(protocol.getProtocolId(), scheduleIdFk, membership.getPersonId(), membership.getRolodexId(), submissionIdFk);                        
                        if (businessObjectService.findMatching(getProtocolVoteRecusedBOClassHook(), fieldValues).size() == 0) {
                            //we found a match, and has not been saved, lets make a ProtocolVoteAbstaineeBase and save it
                            saveProtocolMeetingVoter(getNewProtocolVoteRecusedInstanceHook(), protocol, scheduleIdFk, membership.getPersonId(), membership.getRolodexId(), submissionIdFk);
                        }
                        break;
                    }
                }
            }
        }
        
        if (!committeeDecision.getRecusedToDelete().isEmpty()) {
            for (CommitteePersonBase person : committeeDecision.getRecusedToDelete()) {
                for (CommitteeMembershipBase membership : committeeMemberships) {
                    if (membership.getCommitteeMembershipId().equals(person.getMembershipId())) {
                        Map fieldValues = getFieldValuesMap(protocol.getProtocolId(), scheduleIdFk, membership.getPersonId(), membership.getRolodexId(),submissionIdFk);
                        businessObjectService.deleteMatching(getProtocolVoteRecusedBOClassHook(), fieldValues);
                    }
                }
            }
            committeeDecision.getRecusedToDelete().clear();
        }
    }
    
    protected abstract ProtocolVoteRecusedBase getNewProtocolVoteRecusedInstanceHook();
    
    

    protected abstract Class<? extends ProtocolVoteRecusedBase> getProtocolVoteRecusedBOClassHook();
    

    protected void saveProtocolMeetingVoter(ProtocolMeetingVoterBase voter, ProtocolBase protocol, Long scheduleIdFk, String personId, Integer rolodexId, Long submissionIdFk) {
        voter.setProtocol(protocol);
        voter.setProtocolIdFk(protocol.getProtocolId());
        voter.setSubmissionIdFk(submissionIdFk);
        voter.setRolodexId( rolodexId );
        voter.setPersonId(personId);
        voter.setNonEmployeeFlag(personId==null);
        businessObjectService.save(voter);
    }
    

    protected abstract Map<String, Object> getFieldValuesMap(Long protocolId, Long scheduleIdFk, String personId, Integer rolodexId, Long submissionIdFk);
    
    protected abstract ProtocolSubmissionBase getSubmission(ProtocolBase protocol);
    
    protected void addReviewComments(ProtocolSubmissionBase submission, ReviewCommentsBeanBase reviewCommentsBean) {
        int nextEntryNumber = 0;
        for (CommitteeScheduleMinuteBase minute : reviewCommentsBean.getReviewComments()) {
            minute.setEntryNumber(nextEntryNumber);
            // comments are retrieved based on schedule, so should not change other protocol's review comments
            if (StringUtils.isBlank(minute.getMinuteEntryTypeCode())) {
                minute.setMinuteEntryTypeCode(MinuteEntryType.PROTOCOL);
            }
            if (StringUtils.isNotBlank(minute.getMinuteEntryTypeCode())
                    && MinuteEntryType.PROTOCOL.equals(minute.getMinuteEntryTypeCode())) {
                // only "protocol" typpe should be populated with submissionid & protocolid
                if (minute.getSubmissionIdFk() == null) {
                    minute.setSubmissionIdFk(submission.getSubmissionId());
                }
                if (minute.getProtocolIdFk() == null) {
                    minute.setProtocolIdFk(submission.getProtocolId());
                }
            }
            if (minute.getScheduleIdFk() == null) {
                minute.setScheduleIdFk(submission.getScheduleIdFk());
            }
            nextEntryNumber++;
        }
    }
    
    /**
     * {@inheritDoc}
     * @see org.kuali.kra.irb.actions.decision.CommitteeDecisionService#getAbstainers(java.lang.String, int)
     */
    public List<ProtocolVoteAbstaineeBase> getAbstainers(String protocolNumber, int submissionNumber) {
        List<ProtocolVoteAbstaineeBase> protocolVoteAbstainers = new ArrayList<ProtocolVoteAbstaineeBase>();

        for (ProtocolSubmissionBase protocolSubmission : protocolFinderDao.findProtocolSubmissions(protocolNumber, submissionNumber)) {
            protocolVoteAbstainers.addAll(protocolSubmission.getAbstainers());
        }
        
        return protocolVoteAbstainers;
    }
    
    /**
     * {@inheritDoc}
     * @see org.kuali.kra.irb.actions.decision.CommitteeDecisionService#getRecusers(java.lang.String, int)
     */
    public List<ProtocolVoteRecusedBase> getRecusers(String protocolNumber, int submissionNumber) {
        List<ProtocolVoteRecusedBase> protocolVoteRecusers = new ArrayList<ProtocolVoteRecusedBase>();
        
        for (ProtocolSubmissionBase protocolSubmission : protocolFinderDao.findProtocolSubmissions(protocolNumber, submissionNumber)) {
            protocolSubmission.refreshReferenceObject("recusers");
            protocolVoteRecusers.addAll(protocolSubmission.getRecusers());
        }
        
        return protocolVoteRecusers;
    }

    public void setProtocolFinderDao(ProtocolFinderDao protocolFinderDao) {
        this.protocolFinderDao = protocolFinderDao;
    }
    
}
