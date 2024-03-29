<%@ include file="/WEB-INF/jsp/committee/committeeMember.jsp"%>

<%@ attribute name="researchAreaReference" required="true" %>

<c:set var="membershipExpertiseAttributes" value="${DataDictionary.CommitteeMembershipExpertise.attributes}" />

<table border="0" cellpadding="0" cellspacing="0" summary="">
    <tr>
        <td>
            <kul:innerTab tabTitle="Expertise" 
                          parentTab="${parentTabValue}" 
                          defaultOpen="false"
                          useCurrentTabIndexAsKey="true" 
                          tabErrorKey="committeeHelper.newCommitteeMembershipExpertise[${memberIndex}].*,document.committeeList[0].committeeMemberships[${memberIndex}].areasOfExpertise.inactive.*,document.committeeList[0].committeeMemberships[${memberIndex}].membershipExpertise*">
                <div class="innerTab-container" align="left">
                    <table border="0" id="membership-expertise-table-${memberIndex}" cellpadding="0" cellspacing="0" class="datatable" summary="View/edit committee membership expertise">
                    
                        <%-- Header --%>
                        <tr>
                            <kul:htmlAttributeHeaderCell literalLabel="&nbsp;" scope="col" align="center" />
                            <kul:htmlAttributeHeaderCell attributeEntry="${membershipExpertiseAttributes.researchAreaCode}" scope="col" align="center" />
                            <c:if test="${!readOnly}">
                                <kul:htmlAttributeHeaderCell literalLabel="Actions" scope="col" align="center" />
                            </c:if>
                        </tr>
                        <%-- Header --%>
                        
                        <%-- New data --%>
                        <c:if test="${!readOnly}">
                            <tr>
                                <th class="infoline">
                                    <c:out value="Add:" />
                                </th>
                                
                                <td align="left" valign="middle" class="infoline">
                                    <div align="left">
                                        (select)
                                        <kul:multipleValueLookup boClassName="${researchAreaReference}" 
                                                                 lookedUpCollectionName="committeeResearchAreas"
                                                                 anchor="${currentTabIndex}.memberIndex${memberIndex}"/>
                                    </div>
                                </td>
                                
                                <td align="left" valign="middle" class="infoline">
                                    <div align=center>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                        <%-- New data --%>

                        <%-- Existing data --%>
                        <%-- Set the initial value of the error key prefix that is built up in the following loop based on testing for indices --%>
						<c:set var="inactiveAreasErrorKeyPrefix" value="document.committeeList[0].committeeMemberships[${memberIndex}].areasOfExpertise.inactive." scope="request"/>
                        <c:forEach var="membershipExpertise" items="${KualiForm.document.committeeList[0].committeeMemberships[memberIndex].membershipExpertise}" varStatus="status">
                            <tr>
                                <th class="infoline">
                                    <c:out value="${status.index+1}" />
                                </th>
                                <td align="left" valign="middle">
                                    <div align="left">
                                        ${membershipExpertise.researchAreaCode} ${membershipExpertise.researchArea.description}
                                         <!--- error handling --> <%-- Check if the research area indexed by the current iteration is an error key, and if so show the error icon --%>
										<kul:checkErrors keyMatch="${inactiveAreasErrorKeyPrefix}${status.index}.*" />
										<c:if test="${hasErrors}">
										<%-- display the error icon --%>
										<kul:fieldShowErrorIcon />
										<%-- build up the error key prefix by appending the current index --%>
										<c:set var="inactiveAreasErrorKeyPrefix" value="${inactiveAreasErrorKeyPrefix}${status.index}." scope="request" />
									</c:if> 
                                    </div>                                   
                                </td>
 
                                <c:if test="${!readOnly}">
                                    <td align="left" valign="middle">
                                        <div align="center">                    
                                            <html:image property="methodToCall.deleteCommitteeMembershipExpertise.${committeeMembership}.line${status.index}"
                                                        src='${ConfigProperties.kra.externalizable.images.url}tinybutton-delete1.gif' 
                                                        styleClass="tinybutton"/>
                                        </div>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <%-- Existing data --%>
                        
                    </table>
                </div>
            </kul:innerTab>
        </td>
    </tr>
</table>
