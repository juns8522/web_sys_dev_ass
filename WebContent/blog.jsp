<%@page contentType="application/xml"  import="uts.wsd.*"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="index.xsl"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="blog" class="uts.wsd.Blog" scope="session"/>


<page> 

<navigation><head><%=user.getName() %>'s BLOG</head></navigation>

<userLogin id="1">
	<name><%=user.getName()%></name>
</userLogin>
	
	<blogDetail>
		<date><%=blog.getDate() %></date>
		<title><%=blog.getTitle() %></title>
		<name><%=user.getName() %></name>
		<body><%=blog.getBody().trim().replaceAll("\n", "<newline/>\n") %></body>
	</blogDetail>	
</page>
