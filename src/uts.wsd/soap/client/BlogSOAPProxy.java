package uts.wsd.soap.client;

public class BlogSOAPProxy implements uts.wsd.soap.client.BlogSOAP {
  private String _endpoint = null;
  private uts.wsd.soap.client.BlogSOAP blogSOAP = null;
  
  public BlogSOAPProxy() {
    _initBlogSOAPProxy();
  }
  
  public BlogSOAPProxy(String endpoint) {
    _endpoint = endpoint;
    _initBlogSOAPProxy();
  }
  
  private void _initBlogSOAPProxy() {
    try {
      blogSOAP = (new uts.wsd.soap.client.BlogSOAPServiceLocator()).getBlogSOAPPort();
      if (blogSOAP != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)blogSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)blogSOAP)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (blogSOAP != null)
      ((javax.xml.rpc.Stub)blogSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public uts.wsd.soap.client.BlogSOAP getBlogSOAP() {
    if (blogSOAP == null)
      _initBlogSOAPProxy();
    return blogSOAP;
  }
  
  public void delete(java.lang.String arg0, uts.wsd.soap.client.Blog arg1) throws java.rmi.RemoteException{
    if (blogSOAP == null)
      _initBlogSOAPProxy();
    blogSOAP.delete(arg0, arg1);
  }
  
  public uts.wsd.soap.client.Blog[] fetch(java.lang.String arg0) throws java.rmi.RemoteException{
    if (blogSOAP == null)
      _initBlogSOAPProxy();
    return blogSOAP.fetch(arg0);
  }
}
