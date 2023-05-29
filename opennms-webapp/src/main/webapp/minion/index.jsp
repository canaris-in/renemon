<%--
/*******************************************************************************
 * This file is part of Renemon(R).
 *
 * Copyright (C) 2014-2017 The Renemon Group, Inc.
 * Renemon(R) is Copyright (C) 1999-2017 The Renemon Group, Inc.
 *
 * Renemon(R) is a registered trademark of The Renemon Group, Inc.
 *
 * Renemon(R) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * Renemon(R) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Renemon(R).  If not, see:
 *      http://www.gnu.org/licenses/
 *
 * For more information contact:
 *     Renemon(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     https://canaris.in
 *******************************************************************************/

--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/includes/bootstrap.jsp" flush="false">
	<jsp:param name="title" value="Manage Minions" />
	<jsp:param name="headTitle" value="Manage Minions" />
	<jsp:param name="breadcrumb" value="<a href='admin/index.jsp'>Admin</a>" />
	<jsp:param name="breadcrumb" value="Manage Minions" />
</jsp:include>

<jsp:include page="/assets/load-assets.jsp" flush="false">
  <jsp:param name="asset" value="minion-elementList" />
</jsp:include>

<onms-minion-list></onms-minion-list>

<jsp:include page="/includes/bootstrap-footer.jsp" flush="false"/>
