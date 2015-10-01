<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String description = request.getParameter("description");
%>
<jsp:useBean id="userApp" class="uts.wsd.UserApplication" scope="session"/>

</head>
<body>

<%
Users users = userApp.getUsers();
if (!email.equals("") && !password.equals("")  && !name.equals("")  && !description.equals("") ) {
	if(users.getUser(email) != null)
	{
%>
<p>the user email is already existed. Click <a href="controller.jsp?action=register">here</a> to register again.</p>
<%
	}
	else
	{
		User user = new User(email, password, name, description);
		session.setAttribute("user", user);
		
		users.addUser(user);
		userApp.setUsersXml();
		
		response.sendRedirect("controller.jsp?action=index");
	}
}else {
%>
<p>No blank field is required. Clink <a href="controller.jsp?action=register">here</a> to go to previous page.</p>
<%
}
%>
</body>
</html>
