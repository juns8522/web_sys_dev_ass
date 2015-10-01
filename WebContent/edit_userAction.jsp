<%@page import="org.omg.CORBA.RepositoryIdHelper"%>
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
String email = request.getParameter("email");
String name = request.getParameter("name");
String password = request.getParameter("password");
String description = request.getParameter("description");

if(name == "" || password == "" ||  description == "") {
	User tempUser = (User) session.getAttribute("tempUser");
	
 	tempUser.setName(name);
	tempUser.setPassword(password);
	tempUser.setDescription(description);
	
	session.setAttribute("tempUser", tempUser);
%>
<p>There should be no blank. Click <a href="edit_user.jsp?email=<%=email %>">here</a> to go to the previous page.<p>
<%
}
else {
	User user = (User) session.getAttribute("user");
	
	user.setName(name);
	user.setPassword(password);
	user.setDescription(description);
	
	session.setAttribute("user", user);
	response.sendRedirect("controller.jsp?action=index");

%>
<p>Save successful. Click <a href="index.jsp">here</a> to go to the main page.</p>

<%
}
%>
</body>
</html>
