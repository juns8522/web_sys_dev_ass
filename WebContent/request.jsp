<%@page contentType="application/xml"  import="uts.wsd.*, java.util.*"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="add_friend.xsl"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="userApp" class="uts.wsd.UserApplication" scope="session"/>
<jsp:useBean id="currentBlogs" class="uts.wsd.Blogs" scope="session"/>
<jsp:useBean id="originalBlogs" class="uts.wsd.Blogs" scope="session"/>

<page> 

<navigation><head>Requests</head></navigation>

<%
User futureFriend = null;
ArrayList<String> requests = user.getRequests();

%>

<%
for( String email : requests) {
	
	futureFriend = userApp.getUsers().getUser(email);
	if(futureFriend != null) {
%>
<requests>
	<name><%=futureFriend.getName() %></name>
	<email><value><%=futureFriend.getEmail() %></value></email>
</requests>
<%
	}
}

%>
</page>
