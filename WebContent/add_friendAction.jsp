<%@page contentType="application/xml"  import="uts.wsd.*"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="add_friend.xsl"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="uts.wsd.User" scope="session"/>
<jsp:useBean id="userApp" class="uts.wsd.UserApplication" scope="session"/>


<page> 

<navigation><head>Add a Friend</head></navigation>

<%
if(user.getEmail() != null) {
%>
	<userLogin id="1">
		<name><%=user.getName()%></name>
	</userLogin>
	
<%
	String fEmail = request.getParameter("fEmail");
	User friend = userApp.getUsers().getUser(fEmail);
	
	if(friend != null) {
		String url = "add_friend.jsp?fEmail=" + fEmail;
		response.sendRedirect(url);
	}
	else {
	%>
		No Friend
	<%
	}
}
%>

</page>
