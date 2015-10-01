<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.navigation {background: #4E78A0; height: 35px;}
	ul {list-style-type:none; margin:0; padding:0; overflow:hidden;}
    li { float:left; }
 	a:link.navi,a:visited.navi { display:block; width:120px; font-weight:bold; color:#FFFFFF; background-color:#4E78A0;
							text-align:center; padding:4px; text-decoration:none; text-transform:uppercase; }
	a:hover.navi,a:active.navi { background-color:#62B1F6; }
</style>
</head>
<body>

<%
	String filePath = application.getRealPath("WEB-INF/users.xml");
%>
<jsp:useBean id="userApp" class="uts.wsd.UserApplication" scope="application">
    <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<%
String email = request.getParameter("email");
User user = null;
if(email != null ) {
	user = (User) session.getAttribute("tempUser");
	
}
else {
	User original = (User) session.getAttribute("user");
	user = new User();
	user.copyFields(original);
	session.setAttribute("tempUser", user);
}
%>
<h1>My Account</h1>

<div class="navigation">
	<ul>			
		<li><a href="controller.jsp?action=index" class="navi">Home</a></li>
		<li><a href="controller.jsp?action=addBlog" class="navi">Add Blog</a></li>
		<li><a href="controller.jsp?action=friend" class="navi">Friends</a></li>
		<li><a href="controller.jsp?action=search" class="navi">Search</a></li>
	</ul>
</div>

<form action="controller.jsp?action=edit_userAction" method="POST">
<table>
	<tr><td>Email</td><td><input type="text" name="email" value="<%=user.getEmail()%>" readonly="readonly"></td></tr>
	<tr><td>Full name</td><td><input type="text" name="name" value="<%=user.getName()%>"></td></tr>
	<tr><td>Password</td><td><input type="password" name="password" value="<%=user.getPassword()%>"></td></tr>
	<tr><td>Short Description</td>
	<td><textarea rows="10" cols="30" name="description"><%=user.getDescription()%></textarea></td></tr>
	<tr><td></td><td><input type="submit" value="Save"></td></tr>
</table>
</form>
<p>Return to the <a href="controller.jsp?action=index">main page</a>.</p>
</body>
</html>
