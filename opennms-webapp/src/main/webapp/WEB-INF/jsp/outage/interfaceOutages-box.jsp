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
 *     https://canaris.in
 *******************************************************************************/

--%>

<%-- 
  This page is included by other JSPs to create a box containing an
  abbreviated list of outages.
  
  It expects that a <base> tag has been set in the including page
  that directs all URLs to be relative to the servlet context.
--%>

<%@page language="java"
	contentType="text/html"
	session="true"
	import="
		org.opennms.web.outage.*
	"
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="/WEB-INF/taglib.tld" prefix="onms" %>

<%
    int nodeId = (Integer)request.getAttribute("nodeId");
	String ipAddr = (String)request.getAttribute("ipAddr");
    Outage[] outages = (Outage[])request.getAttribute("outages");
%>
<c:set var="ipAddr"><%=ipAddr%></c:set>

<c:url var="outageLink" value="outage/list.htm">
  <c:param name="filter" value="intf=${ipAddr}"/>
</c:url>

<div class="card">
<div class="card-header">
  <span><a href="<c:out value="${outageLink}"/>">Recent&nbsp;Outages</a></span>
</div>

<table class="table table-sm severity">

<% if(outages.length == 0) { %>
  <tr>
    <td>There have been no outages on this interface in the last 24 hours.</td>
  </tr>
<% } else { %>
  <tr>
    <th>Service</th>
    <th>Lost</th>
    <th>Regained</th>
    <th>Outage ID</th>
  </tr>
  <%
     for( int i=0; i < outages.length; i++ ) {
     Outage outage = outages[i];
     pageContext.setAttribute("outage", outage);
  %>
     <% if( outages[i].getRegainedServiceTime() == null ) { %>
       <tr class="severity-Critical">
     <% } else { %>
       <tr class="severity-Cleared">
     <% } %>
      <c:url var="serviceLink" value="element/service.jsp">
        <c:param name="node" value="<%=String.valueOf(nodeId)%>"/>
        <c:param name="intf" value="<%=outages[i].getIpAddress()%>"/>
        <c:param name="service" value="<%=String.valueOf(outages[i].getServiceId())%>"/>
      </c:url>
      <td class="divider"><a href="<c:out value="${serviceLink}"/>"><c:out value="<%=outages[i].getServiceName()%>"/></a></td>
      <td class="divider"><onms:datetime date="${outage.lostServiceTime}" /></td>
      <% if( outages[i].getRegainedServiceTime() == null ) { %>
        <td class="divider"><b>DOWN</b></td>
      <% } else { %>        
        <td class="divider"><onms:datetime date="${outage.regainedServiceTime}" /></td>
      <% } %>
      <td class="divider"><a href="outage/detail.htm?id=<%=outages[i].getId()%>"><%=outages[i].getId()%></a></td>  
     </tr>
  <% } %>
<% } %>

</table>
</div>
