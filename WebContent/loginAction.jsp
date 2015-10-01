<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String filePath = application.getRealPath("WEB-INF/users.xml");
	String filePathBlogs = application.getRealPath("WEB-INF/blogs.xml");
%>
<jsp:useBean id="userApp" class="uts.wsd.UserApplication" scope="application">
    <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<jsp:useBean id="blogApp" class="uts.wsd.BlogApplication" scope="application">
    <jsp:setProperty name="blogApp" property="filePath" value="<%=filePathBlogs%>"/>
</jsp:useBean>

<%
User user = userApp.getUsers().login(request.getParameter("email"), request.getParameter("password"));

if(user != null)
{
	session.setAttribute("user", user);
	session.setAttribute("blogApp", blogApp);
	Blogs currentBlogs = blogApp.getBlogs(user.getEmail());
	session.setAttribute("currentBlogs", currentBlogs);
	session.setAttribute("originalBlogs", blogApp.getBlogs());
	
	response.sendRedirect("index.jsp");
}
else
{
%>
<p>Password incorrect. Click <a href="controller.jsp?action=index">here</a> to try again.</p>
<%
}
%>
</body>
</html>
