<%--
 Copyright 2005-2013 The Kuali Foundation

 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.osedu.org/licenses/ECL-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>
<c:set var="viewOnly" value="${KualiForm.editingMode['viewOnly']}" scope="request" />
<c:set var="awardAttributes" value="${DataDictionary.Award.attributes}" />
<c:set var="budgetAttributes" value="${DataDictionary.Budget.attributes}" />
<c:set var="awardBudgetAttributes" value="${DataDictionary.AwardBudgetExt.attributes}" />

<c:if test="${KualiForm.editingMode['modifyCompletedBudgets']}">
	<c:set target="${KualiForm.documentActions}" property="canSave" value="true"/>
</c:if>

<kul:documentPage
	showDocumentInfo="true"
	htmlFormAction="awardBudgets"
	documentTypeName="AwardDocument"
	showTabButtons="true"
  	headerDispatch="${KualiForm.headerDispatch}"
  	headerTabActive="budgets"
  	extraTopButtons="${KualiForm.extraTopButtons}" >
  	
  	<div align="right"><kul:help documentTypeName="AwardDocument" pageName="Budget Versions" /></div>

	<c:set var="awardBudgetPage" value="true" scope = "request"/>
  	<kul:tabTop tabTitle="Budget Overview (${KualiForm.document.award.awardIdAccount})" defaultOpen="true" tabErrorKey="budgetParameters*,document.budgetVersionOverview.totalCostLimit" auditCluster="budgetParametersOverviewWarnings,awardBudgetTypeAuditErrors" tabAuditKey="document.budgetVersionOverview.totalCostLimit,document.budget.comments">
	<div class="tab-container" align="center">
      <h3>
    	Budget Overview
    	<span class="subhead-right"><kul:help parameterNamespace="KC-AWARD" parameterDetailType="Document" parameterName="awardBudgetOverviewHelpUrl" altText="help"/></span>
      </h3>
        <table cellpadding=0 cellspacing=0 summary="">
        	<tr>
                <th width="25%"><div align="right"><kul:htmlAttributeLabel attributeEntry="${awardAttributes.accountNumber}" /></div></th>
                <td width="25%" align="left" valign="middle">
                	<bean:write name="KualiForm" property="document.budgetParent.accountNumber"/>
                </td>
                <th width="25%"><div align="right">Budget Start Date</div></th>
                <td width="25%" align="left" valign="middle">
                	<fmt:formatDate value="${KualiForm.document.budgetVersionOverview.startDate}" pattern="MM/dd/yyyy" />
                </td>
            </tr>
        	<tr>
           		<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${awardAttributes.awardNumber}" /></div></th>
           		<td>
           			<bean:write name="KualiForm" property="document.budgetParent.awardNumber"/> 
           		</td>
				<th><div align="right">Budget End Date</div></th>
                <td>
                	<fmt:formatDate value="${KualiForm.document.budgetVersionOverview.endDate}" pattern="MM/dd/yyyy" />
                </td>
        	</tr>
			<tr>
				<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${budgetAttributes.budgetVersionNumber}" /></div></th>
                <td >
                	<bean:write name="KualiForm" property="document.budgetVersionOverview.budgetVersionNumber"/> 
                </td>
       			<th>
           			<div align="right">Budget Total Cost Limit:</div>
           		<td>
           			<bean:write name="KualiForm" property="document.budgetParent.budgetTotalCostLimit"/> 
           		</td>
        	</tr>
        	<tr>
				<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${awardBudgetAttributes.awardBudgetTypeCode}" /></div></th>
			    <td>
			    	<bean:write name="KualiForm" property="document.budgetVersionOverview.awardBudgetType.description"/> 
                </td>
           		<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${awardBudgetAttributes.totalCostLimit}" /></div></th>
           		<td>
           			<bean:write name="KualiForm" property="document.budgetVersionOverview.totalCostLimit"/>
           		</td>
     		</tr>
        	<tr>
				<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${awardBudgetAttributes.awardBudgetStatusCode}" /></div></th>
			    <td>
			    	<bean:write name="KualiForm" property="document.budgetVersionOverview.awardBudgetStatus.description"/>
                </td>
		        <input type="hidden" name="prevOnOffCampusFlag" value="${KualiForm.document.budgetVersionOverview.onOffCampusFlag}">
           		<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${budgetAttributes.urRateClassCode}" /></div></th>
                <td>
                	<bean:write name="KualiForm" property="document.budgetVersionOverview.urRateClass.description"/>
                	<input type="hidden" name="urRateClassCodePrevValue" value="${KualiForm.document.budgetVersionOverview.urRateClassCode}">
                </td>
        	</tr>
        	<tr>
				<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${budgetAttributes.onOffCampusFlag}" /></div></th>
                <td >
                	<bean:write name="KualiForm" property="document.budgetVersionOverview.onOffCampusFlagDescription"/>
                </td>
           		<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${budgetAttributes.ohRateClassCode}" /></div></th>
           		<td>
                	<bean:write name="KualiForm" property="document.budgetVersionOverview.rateClass.description"/>
           			<input type="hidden" name="ohRateClassCodePrevValue" value="${KualiForm.document.budgetVersionOverview.ohRateClassCode}">
           		</td>
        	</tr>
        	<tr>
				<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${awardBudgetAttributes.description}" /></div></th>
                <td colspan="3">
                	<bean:write name="KualiForm" property="document.budgetVersionOverview.description"/>
                </td>
        	</tr>
        	<tr>
				<th><div align="right"><kul:htmlAttributeLabel attributeEntry="${budgetAttributes.comments}" /></div></th>
                <td colspan="3">
                	<bean:write name="KualiForm" property="document.budgetVersionOverview.comments"/>
                </td>
        	</tr>
        </table>
    </div>
</kul:tabTop>
  
  	
  	<kra-b:budgetVersions 
  		budgetDocumentVersions="${KualiForm.document.budgetDocumentVersions}" 
  		pathToVersions="document"
  		errorKey="document.parentDocument.budgetDocumentVersion*,
  					document.award.budgetVersion*"
  		requestedStartDateInitial="${KualiForm.document.award.beginDate}"
		requestedEndDateInitial="${KualiForm.document.award.projectEndDate}"
		hierarchyParentBudgetIsComplete="true"
		/>
  	  	
  	 <kra-a:awardBudgetLimits /> 
  	
  	<kul:documentControls 
		transactionalDocument="false"
		suppressRoutingControls="true"
		extraButtonSource="${extraButtonSource}"
		extraButtonProperty="${extraButtonProperty}"
		extraButtonAlt="${extraButtonAlt}"
		viewOnly="${viewOnly}"
		suppressCancelButton="true" />
		
</kul:documentPage>
