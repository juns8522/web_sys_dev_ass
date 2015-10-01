/**
 * BlogSOAPServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package uts.wsd.soap.client;

public class BlogSOAPServiceLocator extends org.apache.axis.client.Service implements uts.wsd.soap.client.BlogSOAPService {

    public BlogSOAPServiceLocator() {
    }


    public BlogSOAPServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public BlogSOAPServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BlogSOAPPort
    private java.lang.String BlogSOAPPort_address = "http://localhost:8080/assignmentV4/soap/blog";

    public java.lang.String getBlogSOAPPortAddress() {
        return BlogSOAPPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BlogSOAPPortWSDDServiceName = "BlogSOAPPort";

    public java.lang.String getBlogSOAPPortWSDDServiceName() {
        return BlogSOAPPortWSDDServiceName;
    }

    public void setBlogSOAPPortWSDDServiceName(java.lang.String name) {
        BlogSOAPPortWSDDServiceName = name;
    }

    public uts.wsd.soap.client.BlogSOAP getBlogSOAPPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BlogSOAPPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBlogSOAPPort(endpoint);
    }

    public uts.wsd.soap.client.BlogSOAP getBlogSOAPPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            uts.wsd.soap.client.BlogSOAPPortBindingStub _stub = new uts.wsd.soap.client.BlogSOAPPortBindingStub(portAddress, this);
            _stub.setPortName(getBlogSOAPPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBlogSOAPPortEndpointAddress(java.lang.String address) {
        BlogSOAPPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (uts.wsd.soap.client.BlogSOAP.class.isAssignableFrom(serviceEndpointInterface)) {
                uts.wsd.soap.client.BlogSOAPPortBindingStub _stub = new uts.wsd.soap.client.BlogSOAPPortBindingStub(new java.net.URL(BlogSOAPPort_address), this);
                _stub.setPortName(getBlogSOAPPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("BlogSOAPPort".equals(inputPortName)) {
            return getBlogSOAPPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://soap.wsd.uts/", "BlogSOAPService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://soap.wsd.uts/", "BlogSOAPPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BlogSOAPPort".equals(portName)) {
            setBlogSOAPPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
