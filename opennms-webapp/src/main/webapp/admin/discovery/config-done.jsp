<%--
/*******************************************************************************
 * This file is part of Renemon(R).
 *
 * Copyright (C) 2002-2014 The Renemon Group, Inc.
 * Renemon(R) is Copyright (C) 1999-2014 The Renemon Group, Inc.
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
 *     http://www.opennms.com/
 *******************************************************************************/

--%>

<%@page language="java"
	contentType="text/html"
	session="true"
%>

<% String breadcrumb1 = "<a href='admin/index.jsp'> Admin </a>"; %>
<% String breadcrumb2 = "<a href='admin/discovery/index.jsp'> Discovery </a>"; %>
<% String breadcrumb3 = "Configuration Updated"; %>

<jsp:include page="/includes/bootstrap.jsp" flush="false" >
  <jsp:param name="title" value="Discovery Configuration Updated" />
  <jsp:param name="headTitle" value="Discovery" />
  <jsp:param name="headTitle" value="Admin" />
  <jsp:param name="location" value="admin" />
  <jsp:param name="breadcrumb" value="<%=breadcrumb1%>" />
  <jsp:param name="breadcrumb" value="<%=breadcrumb2%>" />
  <jsp:param name="breadcrumb" value="<%=breadcrumb3%>" />
</jsp:include>

<div class="card">
  <div class="card-header">
    <span>Discovery Configuration Updated</span>
  </div>
  <div class="card-body">
    <p>
      The discovery configuration has been updated successfully and the discovery subsystem has been reloaded. The next scan
      will begin after the configured initial sleep time.
    </p>

    <p><a href='admin/index.jsp'>Return to the admin page</a></p>
    <p><a href='admin/discovery/index.jsp'>Return to the discovery configuration page</a></p>

  </div> <!-- card-body -->
</div> <!-- panel -->

<jsp:include page="/includes/bootstrap-footer.jsp" flush="false" />

