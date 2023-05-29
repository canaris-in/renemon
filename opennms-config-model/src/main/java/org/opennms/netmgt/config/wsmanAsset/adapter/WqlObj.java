/*******************************************************************************
 * This file is part of OpenNMS(R).
 * 
 * Copyright (C) 2018 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2018 The OpenNMS Group, Inc.
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
 *     http://www.gnu.org/licenses/
 * 
 * For more information contact:
 *     OpenNMS(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     http://www.opennms.com/
 *******************************************************************************/

package org.opennms.netmgt.config.wsmanAsset.adapter;


import java.io.Serializable;
import java.util.Objects;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

import org.opennms.core.xml.ValidateUsing;
import org.opennms.netmgt.config.utils.ConfigUtils;

@XmlRootElement(name = "wql")
@XmlAccessorType(XmlAccessType.FIELD)
@ValidateUsing("wsman-asset-adapter-configuration.xsd")
public class WqlObj implements Serializable {
    private static final long serialVersionUID = 2L;

    @XmlAttribute(name = "query", required = true)
    private String m_wql;

    @XmlAttribute(name = "resourceUri", required = true)
    private String m_resourceuri;
    /**
     * a human readable name for the object 
     *  NOTE: This value is used as the RRD file name and
     *  data source name. RRD only supports data source names up to 19 chars
     *  in length. If the data collector encounters an alias which
     *  exceeds 19 characters it will be truncated.
     */
    @XmlAttribute(name = "alias", required = true)
    private String m_alias;

    public WqlObj() {
    }

    public String getWql() {
        return m_wql;
    }

    public void setWql(final String wql) {
        m_wql = ConfigUtils.assertNotEmpty(wql, "wql");
    }

    public String getResourceUri() {
        return m_resourceuri;
    }

    public void setResourceUri(final String resourceUri) {
        m_resourceuri = ConfigUtils.assertNotEmpty(resourceUri, "resourceUri");
    }

    public String getAlias() {
        return m_alias;
    }

    public void setAlias(final String alias) {
        m_alias = ConfigUtils.assertNotEmpty(alias, "alias");
    }

    @Override
    public int hashCode() {
        return Objects.hash(m_resourceuri, m_wql, m_alias);
    }

    @Override
    public boolean equals(final Object obj) {
        if ( this == obj ) {
            return true;
        }

        if (obj instanceof WqlObj) {
            final WqlObj that = (WqlObj)obj;
            return Objects.equals(this.m_wql, that.m_wql)
                    && Objects.equals(this.m_resourceuri, that.m_resourceuri)
                    && Objects.equals(this.m_alias, that.m_alias);
        }
        return false;
    }

}
