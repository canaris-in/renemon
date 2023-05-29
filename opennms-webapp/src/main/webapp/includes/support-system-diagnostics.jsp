<%--
/*******************************************************************************
 * This file is part of Renemon(R).
 *
 * Copyright (C) 2002-2018 The Renemon Group, Inc.
 * Renemon(R) is Copyright (C) 1999-2018 The Renemon Group, Inc.
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

<div class="card">
    <div class="card-header">
        <span>System Diagnostics</span>
    </div>
    <div class="card-body">
        <table class="table">
            <tr>
                <td style="border-top: none;"><a href="admin/support/systemReport.htm" class="btn btn-secondary" role="button" style="width: 100%">Generate System Report</a></td>
                <td style="border-top: none;">Generate &quot;support-friendly&quot; information about your Renemon instance and system environment.</td>
            </tr>
            <tr>
                <td style="border-top: none;"><a href="admin/nodemanagement/instrumentationLogReader.jsp" class="btn btn-secondary" role="button" style="width: 100%">Collectd Statistics</a></td>
                <td style="border-top: none;">Get detailed statistics about your configured performance data collection.</td>
            </tr>
            <tr>
                <td style="border-top: none;"><a href="about/index.jsp" class="btn btn-secondary" role="button" style="width: 100%">About Renemon</a></td>
                <td style="border-top: none;">Get an overview about your running Renemon instance such as Java Version, Operating System, PostgreSQL version and Time Series Strategy.</td>
            </tr>
        </table>
    </div>
</div>
