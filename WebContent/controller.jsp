<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="uts.wsd.*"%>

<%
String filePath = application.getRealPath("WEB-INF/users.xml");
String filePathBlog = application.getRealPath("WEB-INF/blogs.xml");
%>
<jsp:useBean id="userApp" class="uts.wsd.UserApplication" scope="application">
    <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<jsp:useBean id="blogApp" class="uts.wsd.BlogApplication" scope="application">
    <jsp:setProperty name="blogApp" property="filePath" value="<%=filePathBlog%>"/>
</jsp:useBean>

<%
Blogs originalBlogs = blogApp.getBlogs();
User user = (User) session.getAttribute("user");
Blogs currentBlogs = blogApp.getBlogs(user.getEmail());

String action = request.getParameter("action");
String id = request.getParameter("id");
String target="";

if(action.equals("index") || action.equals("register") || action.equals("welcome") || action.equals("add_blogAction")
		|| action.equals("edit_userAction") || action.equals("add_friend") || action.equals("request")) {
	target = action + ".jsp";
}
else if(action.equals("blog")) {
	target = "blog.jsp";
	request.setAttribute("currentBlogs", currentBlogs);
	if(id != null) {
		try{
			int intId = Integer.parseInt(id);
			Blog blog = currentBlogs.getBlog(intId);
			session.setAttribute("blog", blog);
		}
		catch(Exception e) {
			;	
		}
	}
}
else if(action.equals("addBlog")) {
	target = "add_blog.jsp";
}
else if(action.equals("delete")) {
	target = "index.jsp";
	
	if(!id.equals("")) {
		try{
			int intId = Integer.parseInt(id);
			Blog blog = originalBlogs.getBlog(intId);
			originalBlogs.removeBlog(blog);
			originalBlogs.setBlogId();
			blogApp.setBlogsXml();
			currentBlogs = blogApp.getBlogs(user.getEmail());
			
		}
		catch(Exception e) {
			;	
		}
	}
	blogApp.setBlogsXml();
}

else if(action.equals("add_friendAction")) {
	String fEmail = request.getParameter("fEmail");
	String email = request.getParameter("add");
	if(fEmail != null && !fEmail.equals("")) {
		if(userApp.getUsers().getUser(fEmail) != null) {
			target = "add_friend.jsp?fEmail=" + fEmail;
		}
		else
			target = "add_friend.jsp";
	}
	else if(!email.equals("")) {
		User friend = userApp.getUsers().getUser(email);
		friend.addRequest(user.getEmail());
		userApp.setUsersXml();
		target = "add_friend.jsp?process=ok";
	}
	target = "add_friendAction.jsp";
}
else if(action.equals("decisionYes")) {
	String rEmail = request.getParameter("rEmail");
	user.addFriends(rEmail);
	User friend = userApp.getUsers().getUser(rEmail);
	friend.addFriends(user.getEmail());
	user.removeRequest(rEmail);
	friend.removeRequest(user.getEmail());
	userApp.setUsersXml();
	target = "request.jsp";
}
else if(action.equals("decisionNo")) {
	String rEmail = request.getParameter("rEmail");
	User friend = userApp.getUsers().getUser(rEmail);
	user.removeRequest(rEmail);
	friend.removeRequest(user.getEmail());
	userApp.setUsersXml();
	target = "request.jsp";
}
else if(action.equals("friends_blog")) {
	String fEmail = request.getParameter("fEmail");
	User friend = userApp.getUsers().getUser(fEmail);
	session.setAttribute("friend", friend);
	target = "friends_blog.jsp";
}
else if(action.equals("fBlog_detail")) {
	if(id != null) {
		try{
			int intId = Integer.parseInt(id);
			Blog blog = originalBlogs.getBlog(intId);
			session.setAttribute("blog", blog);
		}
		catch(Exception e) {
			;	
		}
	}
	target = "fBlog_detail.jsp";
}
session.setAttribute("originalBlogs", originalBlogs);
session.setAttribute("currentBlogs", currentBlogs);
session.setAttribute("blogApp", blogApp);
session.setAttribute("userApp", userApp);

RequestDispatcher dispatcher = request.getRequestDispatcher(target);
dispatcher.forward(request, response);
%>
