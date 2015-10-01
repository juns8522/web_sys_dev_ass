<%@page contentType="application/xml"  import="uts.wsd.*"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="index.xsl"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="currentBlogs" class="uts.wsd.Blogs" scope="session"/>

<page> 
<navigation><head>BLOG</head></navigation>


<%
if(user.getEmail() != null) {
%>
	<userLogin id="1">
		<name><%=user.getName()%></name>
	</userLogin>
	
	<blogs>
<%
	int i = 0;
    for(Blog blog : currentBlogs.getList()) {
		blog = currentBlogs.getList().get(i++);
		
%>
	
		<blog>
			<date><%=blog.getDate()%></date>
			<title><%=blog.getTitle()%></title>
			<id><idVal><%=blog.getId()%></idVal></id>
		</blog>
	
<%
	}
%>
	</blogs>
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
