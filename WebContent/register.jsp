<%@page contentType="application/xml"  import="uts.wsd.*, java.util.*, java.text.*"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="index.xsl"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="blog" class="uts.wsd.Blog" scope="session"/>
<jsp:useBean id="tempBlog" class="uts.wsd.Blog" scope="session"/>
<%
Date date = new Date();
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
String currentDate = dateFormat.format(date);
%>

<page> 

<navigation><head>Register</head></navigation>

<register></register>

</page>
