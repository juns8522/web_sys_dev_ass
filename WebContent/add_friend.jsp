<%@page contentType="application/xml"  import="uts.wsd.*"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="add_friend.xsl"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="userApp" class="uts.wsd.UserApplication" scope="session"/>
<jsp:useBean id="currentBlogs" class="uts.wsd.Blogs" scope="session"/>
<jsp:useBean id="originalBlogs" class="uts.wsd.Blogs" scope="session"/>

<page> 

<navigation><head>Add a Friend</head></navigation>

<%
if(user.getEmail() != null) {
%>
	<userLogin id="1">
		<name><%=user.getName()%></name>
	</userLogin>
	
	<blogs>
<% 
	if(request.getParameter("process") == null || !request.getParameter("process").equals("ok")) {
		String fEmail = request.getParameter("fEmail");
		
		if(fEmail != null && !fEmail.equals("")) {
		%>
		<addFriend><email><%=fEmail %></email></addFriend>
		
		<%
		}else 
		{
		%>
		<search></search>
		<%
		}
	}
	else 
	{
	%>
		<message></message>
	<%
	}
	%>
	</blogs>
	
	<%
	for(String email : user.getFriends()) {
		User friend = userApp.getUsers().getUser(email);
	%>
			<friends>
			<name><%=friend.getName() %></name>
			<email><value><%=friend.getEmail() %></value></email>
			</friends>
	<%
	}
	%>
	
	<%
}
else
{
%>
	<userLogin id = "2">
		You are not logged in.
	</userLogin>
	
<%
}
%>
</page>
