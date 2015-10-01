<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="blogApp" class="uts.wsd.BlogApplication" scope="session"/>

<%
String title = request.getParameter("title");
String date = request.getParameter("date");
String body = request.getParameter("body");
Blogs originalBlogs = blogApp.getBlogs();

if(title == "" || date == "" || body == "") {
	Blog tempBlog = new Blog();
	
	tempBlog.setTitle(title);
	tempBlog.setDate(date);
	tempBlog.setBody(body);
	
	session.setAttribute("tempBlog", tempBlog);
%>
	<p>There should be no blank. Click <a href="controller.jsp?action=addBlog">here</a> to go to the previous page.<p>
<%
}
else {
	User user = (User) session.getAttribute("user");
	int id = originalBlogs.getListSize() + 1;
	String email = user.getEmail();
	Blog blog = new Blog(id, email, date, title, body);
	originalBlogs.addBlog(blog);
	blogApp.setBlogsXml();
	session.setAttribute("originalBlogs", originalBlogs);
	session.setAttribute("tempBlog", null);
	response.sendRedirect("controller.jsp?action=index");

}
%>
</body>
</html>
