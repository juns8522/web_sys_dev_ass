/**
 * BlogSOAP.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package uts.wsd.soap.client;

public interface BlogSOAP extends java.rmi.Remote {
    public void delete(java.lang.String arg0, uts.wsd.soap.client.Blog arg1) throws java.rmi.RemoteException;
    public uts.wsd.soap.client.Blog[] fetch(java.lang.String arg0) throws java.rmi.RemoteException;
}
