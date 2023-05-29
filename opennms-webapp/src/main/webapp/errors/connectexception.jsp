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

<%@page language="java"
	contentType="text/html"
	session="true"
	isErrorPage="true"
	import="java.net.ConnectException"
%>

<%

    if (exception == null) {
        exception = (Throwable)request.getAttribute("javax.servlet.error.exception");
    }

    ConnectException e = null;

    if( exception instanceof ConnectException ) {
        e = (ConnectException)exception;
    }
    else if( exception instanceof ServletException ) {
        e = (ConnectException)((ServletException)exception).getRootCause();
    }
    else {
        throw new ServletException( "This error page does not handle this exception type.", exception );
    }    
    
%>

<jsp:include page="/includes/bootstrap.jsp" flush="false" >
  <jsp:param name="title" value="Connection Error" />
  <jsp:param name="headTitle" value="Connection Error" />
  <jsp:param name="headTitle" value="Error" />
  <jsp:param name="breadcrumb" value="Error" />
</jsp:include>

<h1>Connection Error</h1>

<p>
  Could not send an event to the Renemon event daemon due to this
  error: <%= org.opennms.web.api.Util.htmlify(e.getMessage()) %>
</p>

<p>
  Is the Renemon daemon running?
</p>

<jsp:include page="/includes/bootstrap-footer.jsp" flush="false" />
