<%@page contentType="application/xml"  import="uts.wsd.*"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="add_friend.xsl"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="friend" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="blogApp" class="uts.wsd.BlogApplication" scope="session"/>
<% %>
<page> 

<navigation><head><%=friend.getName() %>'s BLOG</head></navigation>
<%
if(user.getEmail() != null) {
%>
	<userLogin id="1">
		<name><%=user.getName()%></name>
	</userLogin>
	
	<fBlogs>
<%
	int i = 0;
    Blogs friendsBlogs = blogApp.getBlogs(friend.getEmail());
	for(Blog blog : friendsBlogs.getList()) {
		blog = friendsBlogs.getList().get(i++);
%>
	<fBlog>
			<date><%=blog.getDate()%></date>
			<title><%=blog.getTitle()%></title>
			<id><idVal><%=blog.getId()%></idVal></id>
	</fBlog>
	
<%
	}
%>
	</fBlogs>
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
