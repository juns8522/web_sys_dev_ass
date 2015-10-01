package uts.wsd.soap;
import java.io.IOException;

import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.Endpoint;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import uts.wsd.*;
  
@WebService
public class BlogSOAP {

	@Resource
	private WebServiceContext context;
	
	private BlogApplication getBlogApp(){
		// This needs to be local variable in your "getDiaryApp" method
		// It will not work if declared as a field.
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		
		synchronized (application) {
			BlogApplication blogApp = (BlogApplication)application.getAttribute("blogApp");
			if (blogApp == null) {
				blogApp = new BlogApplication();
				try {
					blogApp.setFilePath(application.getRealPath("WEB-INF/blogs.xml"));
				} catch (JAXBException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				application.setAttribute("diaryApp", blogApp);
			}
			return blogApp;
		}
	}
	
	@WebMethod
	public Blogs fetch(String name) {
		return getBlogApp().getBlogs(name);
	}
	
	@WebMethod
	public void delete(String name, Blog blog) {
		fetch(name).removeBlog(blog);
	}
}
