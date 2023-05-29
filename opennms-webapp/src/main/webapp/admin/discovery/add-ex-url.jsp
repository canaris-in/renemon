<%--
/*******************************************************************************
 * This file is part of Renemon(R).
 *
 * Copyright (C) 2007-2017 The Renemon Group, Inc.
 * Renemon(R) is Copyright (C) 1999-2017 The Renemon Group, Inc.
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

<%@page language="java" contentType="text/html" session="true" import="
  java.util.Map,
  java.util.TreeMap,
  org.opennms.netmgt.model.monitoringLocations.OnmsMonitoringLocation,
  org.opennms.netmgt.provision.persist.requisition.Requisition,
  org.opennms.netmgt.dao.api.*,
  org.springframework.web.context.WebApplicationContext,
  org.springframework.web.context.support.WebApplicationContextUtils,
  org.opennms.web.svclayer.api.RequisitionAccessService,
  org.opennms.netmgt.config.DiscoveryConfigFactory,
  org.opennms.netmgt.config.discovery.*,
  org.opennms.web.admin.discovery.DiscoveryServletConstants,
  org.opennms.web.admin.discovery.ActionDiscoveryServlet,
  org.opennms.web.admin.discovery.DiscoveryScanServlet
"%>
<% 
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}
%>

<%
WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());

HttpSession sess = request.getSession(false);
DiscoveryConfiguration currConfig;
if (DiscoveryServletConstants.EDIT_MODE_SCAN.equals(request.getParameter("mode"))) {
	currConfig  = (DiscoveryConfiguration) sess.getAttribute(DiscoveryScanServlet.ATTRIBUTE_DISCOVERY_CONFIGURATION);
} else if (DiscoveryServletConstants.EDIT_MODE_CONFIG.equals(request.getParameter("mode"))) {
	currConfig  = (DiscoveryConfiguration) sess.getAttribute(ActionDiscoveryServlet.ATTRIBUTE_DISCOVERY_CONFIGURATION);
} else {
	throw new ServletException("Cannot get discovery configuration from the session");
}

// Map of primary key to label (which in this case are the same)
MonitoringLocationDao locationDao = context.getBean(MonitoringLocationDao.class);
Map<String,String> locations = new TreeMap<String,String>();
for (OnmsMonitoringLocation location : locationDao.findAll()) {
	locations.put(location.getLocationName(), location.getLocationName());
}

// Map of primary key to label (which in this case are the same too)
RequisitionAccessService reqAccessService = context.getBean(RequisitionAccessService.class);
Map<String,String> foreignsources = new TreeMap<String,String>();
for (Requisition requisition : reqAccessService.getRequisitions()) {
	foreignsources.put(requisition.getForeignSource(), requisition.getForeignSource());
}

%>

<jsp:include page="/includes/bootstrap.jsp" flush="false" >
    <jsp:param name="title" value="Add Exclude URL" />
    <jsp:param name="headTitle" value="Admin" />
    <jsp:param name="quiet" value="true" />
</jsp:include>

<script type="text/javascript">
function doAddExcludeUrl() {

	opener.document.getElementById("euurl").value=document.getElementById("url").value;
	opener.document.getElementById("euforeignsource").value=document.getElementById("foreignsource").value;
	opener.document.getElementById("eulocation").value=document.getElementById("location").value;
	opener.document.getElementById("modifyDiscoveryConfig").action=opener.document.getElementById("modifyDiscoveryConfig").action+"?action=<%=DiscoveryServletConstants.addExcludeUrlAction%>";
	opener.document.getElementById("modifyDiscoveryConfig").submit();
	window.close();
	opener.document.focus();
}

</script>

<div class="row">
  <div class="col-md-12">
  <div class="card">
    <div class="card-header">
      <span>Add a URL containing a list of IP addresses to exclude</span>
    </div>
    <div class="card-body">
      <form role="form" class="form">
        <div class="form-group form-row">
          <label for="url" class="col-sm-2 col-form-label">URL</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="url" name="url"/>
          </div>
        </div>
        <div class="form-group form-row">
          <label for="foreignsource" class="col-sm-2 col-form-label">Foreign Source</label>
          <div class="col-sm-10">
            <select id="foreignsource" class="form-control custom-select" name="foreignsource">
              <option value="" <%if (!currConfig.getForeignSource().isPresent()) out.print("selected");%>>None selected</option>
              <% for (String key : foreignsources.keySet()) { %>
                <option value="<%=key%>" <%if(key.equals(currConfig.getForeignSource().orElse(null))) out.print("selected");%>><%=foreignsources.get(key)%></option>
              <% } %>
            </select>
          </div>
        </div>
        <div class="form-group form-row">
          <label for="location" class="col-sm-2 col-form-label">Location</label>
          <div class="col-sm-10">
            <select id="location" class="form-control custom-select" name="location">
              <% for (String key : locations.keySet()) { %>
                <option value="<%=key%>" <%if(key.equals(currConfig.getLocation().orElse(MonitoringLocationDao.DEFAULT_MONITORING_LOCATION_ID))) out.print("selected");%>><%=locations.get(key)%></option>
              <% } %>
            </select>
          </div>
        </div>
        <div class="form-group form-row">
          <div class="col-sm-12">
            <button type="button" class="btn btn-secondary" name="addExcludeUrl" id="addIExludeUrl" onclick="doAddExcludeUrl();">Add</button>
            <button type="button" class="btn btn-secondary" name="cancel" id="cancel" onclick="window.close();opener.document.focus();">Cancel</button>
          </div>
        </div>
      </form>
    </div> <!-- card-body -->
  </div> <!-- panel -->
  </div> <!-- column -->
</div> <!-- row -->

<jsp:include page="/includes/bootstrap-footer.jsp" flush="false" >
  <jsp:param name="quiet" value="true" />
</jsp:include>
