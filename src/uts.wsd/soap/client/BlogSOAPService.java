/**
 * BlogSOAPService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package uts.wsd.soap.client;

public interface BlogSOAPService extends javax.xml.rpc.Service {
    public java.lang.String getBlogSOAPPortAddress();

    public uts.wsd.soap.client.BlogSOAP getBlogSOAPPort() throws javax.xml.rpc.ServiceException;

    public uts.wsd.soap.client.BlogSOAP getBlogSOAPPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
