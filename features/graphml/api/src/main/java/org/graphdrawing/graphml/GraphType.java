/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2016 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2016 The OpenNMS Group, Inc.
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

//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.05.17 at 02:59:53 PM CEST 
//


package org.graphdrawing.graphml;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * 
 *       Complex type for the <graph> element.
 *     
 * 
 * <p>Java class for graph.type complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="graph.type"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element ref="{http://graphml.graphdrawing.org/xmlns}desc" minOccurs="0"/&gt;
 *         &lt;choice&gt;
 *           &lt;sequence&gt;
 *             &lt;choice maxOccurs="unbounded" minOccurs="0"&gt;
 *               &lt;element ref="{http://graphml.graphdrawing.org/xmlns}data"/&gt;
 *               &lt;element ref="{http://graphml.graphdrawing.org/xmlns}node"/&gt;
 *               &lt;element ref="{http://graphml.graphdrawing.org/xmlns}edge"/&gt;
 *               &lt;element ref="{http://graphml.graphdrawing.org/xmlns}hyperedge"/&gt;
 *             &lt;/choice&gt;
 *           &lt;/sequence&gt;
 *           &lt;element ref="{http://graphml.graphdrawing.org/xmlns}locator"/&gt;
 *         &lt;/choice&gt;
 *       &lt;/sequence&gt;
 *       &lt;attGroup ref="{http://graphml.graphdrawing.org/xmlns}graph.extra.attrib"/&gt;
 *       &lt;attribute name="id" type="{http://www.w3.org/2001/XMLSchema}NMTOKEN" /&gt;
 *       &lt;attribute name="edgedefault" use="required" type="{http://graphml.graphdrawing.org/xmlns}graph.edgedefault.type" /&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "graph.type", propOrder = {
    "desc",
    "dataOrNodeOrEdge",
    "locator"
})
public class GraphType {

    protected String desc;
    @XmlElements({
        @XmlElement(name = "data", type = DataType.class),
        @XmlElement(name = "node", type = NodeType.class),
        @XmlElement(name = "edge", type = EdgeType.class),
        @XmlElement(name = "hyperedge", type = HyperedgeType.class)
    })
    protected List<Object> dataOrNodeOrEdge;
    protected LocatorType locator;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlSchemaType(name = "NMTOKEN")
    protected String id;
    @XmlAttribute(name = "edgedefault", required = true)
    protected GraphEdgedefaultType edgedefault;
    @XmlAttribute(name = "parse.nodeids")
    protected GraphNodeidsType parseNodeids;
    @XmlAttribute(name = "parse.edgeids")
    protected GraphEdgeidsType parseEdgeids;
    @XmlAttribute(name = "parse.order")
    protected GraphOrderType parseOrder;
    @XmlAttribute(name = "parse.nodes")
    protected BigInteger parseNodes;
    @XmlAttribute(name = "parse.edges")
    protected BigInteger parseEdges;
    @XmlAttribute(name = "parse.maxindegree")
    protected BigInteger parseMaxindegree;
    @XmlAttribute(name = "parse.maxoutdegree")
    protected BigInteger parseMaxoutdegree;

    /**
     * Gets the value of the desc property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getDesc() {
        return desc;
    }

    /**
     * Sets the value of the desc property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setDesc(String value) {
        this.desc = value;
    }

    /**
     * Gets the value of the dataOrNodeOrEdge property.
     *
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the dataOrNodeOrEdge property.
     *
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getDataOrNodeOrEdge().add(newItem);
     * </pre>
     *
     *
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DataType }
     * {@link NodeType }
     * {@link EdgeType }
     * {@link HyperedgeType }
     *
     *
     */
    public List<Object> getDataOrNodeOrEdge() {
        if (dataOrNodeOrEdge == null) {
            dataOrNodeOrEdge = new ArrayList<>();
        }
        return this.dataOrNodeOrEdge;
    }

    /**
     * Gets the value of the locator property.
     *
     * @return
     *     possible object is
     *     {@link LocatorType }
     *
     */
    public LocatorType getLocator() {
        return locator;
    }

    /**
     * Sets the value of the locator property.
     *
     * @param value
     *     allowed object is
     *     {@link LocatorType }
     *
     */
    public void setLocator(LocatorType value) {
        this.locator = value;
    }

    /**
     * Gets the value of the id property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setId(String value) {
        this.id = value;
    }

    /**
     * Gets the value of the edgedefault property.
     *
     * @return
     *     possible object is
     *     {@link GraphEdgedefaultType }
     *
     */
    public GraphEdgedefaultType getEdgedefault() {
        return edgedefault;
    }

    /**
     * Sets the value of the edgedefault property.
     *
     * @param value
     *     allowed object is
     *     {@link GraphEdgedefaultType }
     *
     */
    public void setEdgedefault(GraphEdgedefaultType value) {
        this.edgedefault = value;
    }

    /**
     * Gets the value of the parseNodeids property.
     *
     * @return
     *     possible object is
     *     {@link GraphNodeidsType }
     *
     */
    public GraphNodeidsType getParseNodeids() {
        return parseNodeids;
    }

    /**
     * Sets the value of the parseNodeids property.
     *
     * @param value
     *     allowed object is
     *     {@link GraphNodeidsType }
     *
     */
    public void setParseNodeids(GraphNodeidsType value) {
        this.parseNodeids = value;
    }

    /**
     * Gets the value of the parseEdgeids property.
     *
     * @return
     *     possible object is
     *     {@link GraphEdgeidsType }
     *
     */
    public GraphEdgeidsType getParseEdgeids() {
        return parseEdgeids;
    }

    /**
     * Sets the value of the parseEdgeids property.
     *
     * @param value
     *     allowed object is
     *     {@link GraphEdgeidsType }
     *
     */
    public void setParseEdgeids(GraphEdgeidsType value) {
        this.parseEdgeids = value;
    }

    /**
     * Gets the value of the parseOrder property.
     *
     * @return
     *     possible object is
     *     {@link GraphOrderType }
     *
     */
    public GraphOrderType getParseOrder() {
        return parseOrder;
    }

    /**
     * Sets the value of the parseOrder property.
     *
     * @param value
     *     allowed object is
     *     {@link GraphOrderType }
     *     
     */
    public void setParseOrder(GraphOrderType value) {
        this.parseOrder = value;
    }

    /**
     * Gets the value of the parseNodes property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getParseNodes() {
        return parseNodes;
    }

    /**
     * Sets the value of the parseNodes property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setParseNodes(BigInteger value) {
        this.parseNodes = value;
    }

    /**
     * Gets the value of the parseEdges property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getParseEdges() {
        return parseEdges;
    }

    /**
     * Sets the value of the parseEdges property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setParseEdges(BigInteger value) {
        this.parseEdges = value;
    }

    /**
     * Gets the value of the parseMaxindegree property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getParseMaxindegree() {
        return parseMaxindegree;
    }

    /**
     * Sets the value of the parseMaxindegree property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setParseMaxindegree(BigInteger value) {
        this.parseMaxindegree = value;
    }

    /**
     * Gets the value of the parseMaxoutdegree property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getParseMaxoutdegree() {
        return parseMaxoutdegree;
    }

    /**
     * Sets the value of the parseMaxoutdegree property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setParseMaxoutdegree(BigInteger value) {
        this.parseMaxoutdegree = value;
    }

}
