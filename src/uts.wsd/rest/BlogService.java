package uts.wsd.rest;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;

import uts.wsd.*;

import java.io.*;
import java.text.ParseException;

@Path("/blogApp")
public class BlogService {

	@Path("hello")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String hello() {
		return "Hello World";
	}

	@Context
	private ServletContext application;

	private BlogApplication getBlogApp() throws JAXBException, IOException {
		// The web server can handle requests from different clients in parallel.
		// These are called "threads".
		//
		// We do NOT want other threads to manipulate the application object at the same
		// time that we are manipulating it, otherwise bad things could happen.
		//
		// The "synchronized" keyword is used to lock the application object while
		// we're manpulating it.
		synchronized (application) {
			BlogApplication blogApp = (BlogApplication)application.getAttribute("blogApp");
			if (blogApp == null) {
				blogApp = new BlogApplication();
				blogApp.setFilePath(application.getRealPath("WEB-INF/blogs.xml"));
				application.setAttribute("blogApp", blogApp);
			}
			return blogApp;
		}
	}

	@Path("blogs")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Blogs getBlogs(String email, @QueryParam("startDate") String startDate, @QueryParam("endDate") String endDate) throws JAXBException, IOException, ParseException
	{
		Blogs blogs = getBlogApp().getBlogs();
		Blogs tempBlogs = blogs;
		
		if(startDate == null && endDate == null)
			return tempBlogs;
		else {
			if(endDate == null) {
				tempBlogs.removeBeforeDate(startDate);
			}
			else if(startDate == null) {
				tempBlogs.removeAfterDate(endDate);
			}
			else {
				tempBlogs.removeBeforeDate(startDate);
				tempBlogs.removeAfterDate(endDate);
			}
		}
		return tempBlogs;
	}
	
}
