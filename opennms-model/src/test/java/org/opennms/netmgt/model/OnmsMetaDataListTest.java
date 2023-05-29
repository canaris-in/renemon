/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2019 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2019 The OpenNMS Group, Inc.
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

package org.opennms.netmgt.model;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;

import org.junit.runners.Parameterized;
import org.opennms.core.test.xml.MarshalAndUnmarshalTest;

import com.google.common.collect.Lists;

public class OnmsMetaDataListTest extends MarshalAndUnmarshalTest<OnmsMetaDataList> {
    public OnmsMetaDataListTest(Class<OnmsMetaDataList> type, OnmsMetaDataList sampleObject, String expectedJson, String expectedXml) {
        super(type, sampleObject, expectedJson, expectedXml);
    }

    @Parameterized.Parameters
    public static Collection<Object[]> data() throws IOException {
        OnmsMetaDataList listDTO = new OnmsMetaDataList();
        listDTO.setObjects(Lists.newArrayList(new OnmsMetaData("c1","k1","v1"), new OnmsMetaData("c2","k2","v2")));

        return Arrays.asList(new Object[][]{{
                OnmsMetaDataList.class,
                listDTO,
                "{\"offset\" : 0, \"count\" : 2, \"totalCount\" : 2, \"metaData\" : [ { \"context\" : \"c1\", \"key\" : \"k1\", \"value\" : \"v1\" }, { \"context\" : \"c2\", \"key\" : \"k2\", \"value\" : \"v2\" }] }",
                "<?xml version=\"1.0\" encoding=\"UTF-8\"?><meta-data-list count=\"2\" offset=\"0\" totalCount=\"2\"><meta-data><context>c1</context><key>k1</key><value>v1</value></meta-data><meta-data><context>c2</context><key>k2</key><value>v2</value></meta-data></meta-data-list>"
        }});
    }
}
