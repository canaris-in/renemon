/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2010-2022 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2022 The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is a registered trademark of The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * OpenNMS(R) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with OpenNMS(R).  If not, see:
 *      http://www.gnu.org/licenses/
 *
 * For more information contact:
 *     OpenNMS(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     http://www.opennms.com/
 *******************************************************************************/

package org.opennms.systemreport.opennms;

import org.opennms.systemreport.AbstractSystemReportPlugin;
import org.opennms.systemreport.sanitizer.ConfigurationSanitizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;

import java.io.File;
import java.util.Map;
import java.util.TreeMap;

public class ConfigurationReportPlugin extends AbstractSystemReportPlugin {

    @Autowired
    private ConfigurationSanitizer configurationSanitizer;

    @Override
    public String getName() {
        return "Configuration";
    }

    @Override
    public String getDescription() {
        return "Append all OpenNMS configuration files (full output only)";
    }

    @Override
    public int getPriority() {
        return 20;
    }

    @Override
    public boolean getFullOutputOnly() {
        return true;
    }

    @Override
    public boolean getOutputsFiles() {
        return true;
    }

    @Override
    public Map<String, Resource> getEntries() {
        final TreeMap<String, Resource> map = new TreeMap<String, Resource>();
        File f = new File(System.getProperty("opennms.home") + File.separator + "etc");
        processFile(f, map);
        return map;
    }

    public void processFile(final File file, final Map<String, Resource> map) {
        if (file.isDirectory()) {
            for (final File f : file.listFiles()) {
                processFile(f, map);
            }
        } else {
            String filename = file.getPath();
            filename = filename.replaceFirst("^" + System.getProperty("opennms.home") + File.separator + "etc" + File.separator + "?", "");

            // skip examples, .git directories, and empty files
            if (filename.contains(File.separator + "examples" + File.separator)) {
                return;
            }
            if (filename.contains(File.separator + ".git" + File.separator)) {
                return;
            }
            if (file.length() < 1) {
                return;
            }

            map.put(filename, configurationSanitizer.getSanitizedResource(file));
        }
    }
}
