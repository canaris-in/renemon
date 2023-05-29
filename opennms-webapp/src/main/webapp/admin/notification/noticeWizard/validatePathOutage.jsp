<%--
/*******************************************************************************
 * This file is part of Renemon(R).
 *
 * Copyright (C) 2002-2021 The Renemon Group, Inc.
 * Renemon(R) is Copyright (C) 1999-2021 The Renemon Group, Inc.
 *
 * Renemon(R) is a registered trademark of The Renemon Group, Inc.
 *
 * Renemon(R) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * Renemon(R) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Renemon(R).  If not, see:
 *      http://www.gnu.org/licenses/
 *
 * For more information contact:
 *     Renemon(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     https://canaris.in
 *******************************************************************************/

--%>

<%@page language="java"
	contentType="text/html"
	session="true"
	import="java.util.*,
	    org.opennms.core.utils.InetAddressUtils,
		org.opennms.web.admin.notification.noticeWizard.*,
		org.opennms.web.api.Util,
		org.opennms.netmgt.filter.FilterDaoFactory,
		org.opennms.netmgt.filter.api.FilterParseException,
		org.opennms.core.utils.WebSecurityUtils
	"
%>


<%
   String newRule = WebSecurityUtils.sanitizeString(request.getParameter("newRule"));
   String criticalIp = InetAddressUtils.normalize(WebSecurityUtils.sanitizeString(request.getParameter("criticalIp")));
   if (criticalIp == null) { criticalIp = ""; }
   String criticalSvc = WebSecurityUtils.sanitizeString(request.getParameter("criticalSvc"));
   String showNodes = WebSecurityUtils.sanitizeString(request.getParameter("showNodes"));
%>

<jsp:include page="/includes/bootstrap.jsp" flush="false" >
  <jsp:param name="title" value="Validate Path Outage" />
  <jsp:param name="headTitle" value="Validate Path Outage" />
  <jsp:param name="headTitle" value="Admin" />
  <jsp:param name="breadcrumb" value="<a href='admin/index.jsp'>Admin</a>" />
  <jsp:param name="breadcrumb" value="<a href='admin/notification/index.jsp'>Configure Notifications</a>" />
  <jsp:param name="breadcrumb" value="<a href='admin/notification/noticeWizard/buildPathOutage.jsp?newRule=IPADDR+IPLIKE+*.*.*.*&showNodes=on'>Configure Path Outages</a>" />
  <jsp:param name="breadcrumb" value="Validate Path Outage" />
</jsp:include>

<script type="text/javascript" >
  
  function next()
  {
      document.addresses.userAction.value="next";
      document.addresses.submit();
  }
  
  function rebuild()
  {
      document.addresses.userAction.value="rebuild";
      document.addresses.submit();
  }
  
</script>


<div class="card">
  <div class="card-header">
    <span>
    <% if (showNodes != null && showNodes.equals("on")) { %>
        Check the nodes below to ensure that the rule has given the expected results.
        If it hasn't click the 'Rebuild' link below the table. If the results look good
        continue by clicking the 'Finish' link also below the table.
    <% } else { %>
        The rule is valid. Click the 'Rebuild' link to change the rule or else continue
        by clicking the 'Finish' link.
    <% } %>
    </span>
  </div>
  <div class="card-body">
      Current Rule: <%=newRule%>
      <br/>critical path IP address = <%=criticalIp%>
      <br/>critical path service = <%=criticalSvc%>
      <br/>
      <br/>
      <form METHOD="POST" NAME="addresses" ACTION="admin/notification/noticeWizard/notificationWizard">
        <%=Util.makeHiddenTags(request)%>
        <input type="hidden" name="userAction" value=""/>
        <input type="hidden" name="newRule" value="<%=newRule%>"/>
        <input type="hidden" name="criticalIp" value="<%=criticalIp%>"/>
        <input type="hidden" name="criticalSvc" value="<%=criticalSvc%>"/>
        <input type="hidden" name="sourcePage" value="<%=NotificationWizardServlet.SOURCE_PAGE_VALIDATE_PATH_OUTAGE%>"/>
        <div class="row">
          <div class="col-md-6">
            <% if (showNodes != null && showNodes.equals("on")) { %>
              <table class="table table-sm table-striped">
                <tr>
                  <th>
                    Node ID
                  </th>
                  <th>
                    Node Label
                  </th>
                </tr>
                <%=buildNodeTable(newRule)%>
              </table>
            <% } %>
          </div> <!-- column -->
        </div> <!-- row -->
        <% if (criticalIp.equals("")) { %>
          <p class="text-danger">You have not selected a critical path IP.
             Clicking "Finish" will clear any critical paths previously set
             for nodes matching the rule: <%= newRule %></p>
        <% } %>
      </form>
  </div> <!-- card-body -->
  <div class="card-footer">
      <a class="btn btn-secondary" href="javascript:rebuild()"><i class="fa fa-arrow-left"></i> Rebuild</a>
      <a class="btn btn-secondary" href="javascript:next()">Next <i class="fa fa-arrow-right"></i></a>
  </div> <!-- card-footer -->
</div> <!-- panel -->

<jsp:include page="/includes/bootstrap-footer.jsp" flush="false" />

<%!
  private String buildNodeTable(String rule)
      throws FilterParseException
  {
          StringBuffer buffer = new StringBuffer();
          SortedMap<Integer,String> nodes = FilterDaoFactory.getInstance().getNodeMap(rule);
          for (Integer key : nodes.keySet()) {
              buffer.append("<tr><td width=\"50%\" valign=\"top\">").append(key).append("</td>");
              buffer.append("<td width=\"50%\">");
              buffer.append(nodes.get(key));
              buffer.append("</td>");
              buffer.append("</tr>");
          }
          return buffer.toString();
  }
%>
