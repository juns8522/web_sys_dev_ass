<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="page">
		<!-- TODO: Auto-generated template -->
		<html>
			<head>
				<style>
				   table.blogs { padding-top:40px; width: 100%; text-align:center; }
				   th {background-color: #4E78A0; color:#FFFFFF;}
				   tr.blog { background-color: #eee; }
				   .navigation {background: #4E78A0; height: 35px;}
				   .userLogin {background: #eee; border: solid 1px #333; width: 100%; height: 55px;}
				   .link {text-align: right;};
				   ul {list-style-type:none; margin:0; padding:0; overflow:hidden;}
				   li { float:left; }
 				   a:link.navi,a:visited.navi { display:block; width:120px; font-weight:bold; color:#FFFFFF; background-color:#4E78A0;
										text-align:center; padding:4px; text-decoration:none; text-transform:uppercase; }
				   a:hover.navi,a:active.navi { background-color:#62B1F6; }
				   textarea.add, input.add { width:100%; height:100%; font-size:15px;}
				</style>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="navigation">
		<h1><xsl:value-of select="head"/></h1>
		<div class="navigation">
			<ul>
				<li><a href="controller.jsp?action=index" class="navi">Home</a></li>					
				<li><a href="controller.jsp?action=addBlog" class="navi">Add Blog</a></li>
				<li><a href="controller.jsp?action=add_friend" class="navi">Friends</a></li>
				<li><a href="controller.jsp?action=request" class="navi">Request</a></li>
			</ul>
		</div>
	</xsl:template>
	
	<xsl:template match="userLogin">
			<div class="userLogin">
				<xsl:choose>
					<xsl:when test="@id = 1">
						You are logged in as <xsl:value-of select="name"/><br></br>
						<table>
							<tr><td><form action="logout.jsp" method="post">
								<button name="logout" type="submit">Logout</button>
							</form></td>
							<td><form action="edit_user.jsp" method="post">
								<button name="edit" type="submit">My Account</button>
							</form></td></tr>
						</table>
					</xsl:when>
					<xsl:otherwise>
						
							<table class="login">
							<tr><form action="loginAction.jsp" method="post">
							<td>Email</td><td><input type="text" name="email"/></td>
							<td>Password</td><td><input type="password" name="password"/></td>
							<td></td><td><input type="Submit" value="Login"/></td></form></tr>
							<tr><td></td><td></td><td></td><td></td><td></td>
							<td>
								<form action="register.jsp" method="post">
									<button name="register" type="submit">Register</button>
								</form>
							</td></tr>
							</table>
						
					</xsl:otherwise>
				</xsl:choose>
			</div>
			
	</xsl:template>
	
	<xsl:template match="link">
		<p class="link">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match="link/logout">
		<a href="logout.jsp">Logout</a>
	</xsl:template>
	
	<xsl:template match="link/login">
		<a href="controller.jsp?action=index">Login</a>
	</xsl:template>
	
	<xsl:template match="link/register">
		<a href="register.jsp">Register</a>
	</xsl:template>
	
	<xsl:template match="blogs">
		<table class="blogs">
			<tr><th>DATE</th><th>TITLE</th><th>DETAIL</th><th>DELETE</th></tr>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	
	<xsl:template match="blog">
		<tr class="blog">
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	
	<xsl:template match="date">
		<td width="200px">
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="title">
		<td>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="blog/id">
		<td width="100px">
			<form action="controller.jsp?action=blog" method="post">
				<button name="id" type="submit" value="{idVal}">detail</button>
			</form>
		</td>
		<td width="100px">
			<form action="controller.jsp?action=delete" method="post">
				<button name="id" type="submit" value="{idVal}">delete</button>
			</form>
		</td>
	</xsl:template>
	
	<xsl:template match="blogDetail">
		<table class="blogs">
			<tr class="blog"><th width="100px">DATE</th><td><xsl:value-of select="date"/></td></tr>
			<tr class="blog"><th>TITLE</th><td><xsl:value-of select="title"/></td></tr>
			
			<tr class="blog"><th>By</th><td><xsl:value-of select="name"/></td></tr>
			<tr class="blog" height="400px" style="overFlow-y:scroll"><th>BODY</th><td><xsl:value-of select="body"/></td></tr>
		</table>
	</xsl:template>
	
	<xsl:template match="addBlog">
		<xsl:choose>
			<xsl:when test="@id = 1">
				<form action="controller.jsp?action=add_blogAction" method="post">
					<table class="blogs">
						<tr class="blog"><th width="100px">DATE</th><td><input class="add" type="text" name="date" value="{date/dateVal}" readonly="readonly"/></td></tr>
						<tr class="blog"><th>TITLE</th><td><input class="add" type="text" name="title"/></td></tr>
						<tr class="blog" height="400px" style="overFlow-y:scroll"><th>BODY</th><td><textarea class="add" name="body"></textarea></td></tr>
					</table>
					<input type="submit" value="Add"/>
				</form>
				<form action="controller.jsp?action=index" method="post">
					<button type="submit" >Cancel</button>
				</form>
			</xsl:when>
			<xsl:otherwise>
				<form action="controller.jsp?action=add_blogAction" method="post">
					<table class="blogs">
						<tr class="blog"><th width="100px">DATE</th><td><input class="add" type="text" name="date" value="{date/dateVal}" readonly="readonly"/></td></tr>
						<tr class="blog"><th>TITLE</th><td><input class="add" type="text" name="title" value="{title/titleVal}"/></td></tr>
						<tr class="blog" height="400px" style="overFlow-y:scroll"><th>BODY</th><td><textarea class="add" name="body"><xsl:value-of select="body/bodyVal"/></textarea></td></tr>
					</table>
					<input type="submit" value="Add"/>
				</form>
				<form action="controller.jsp?action=index" method="post">
					<button type="submit" >Cancel</button>
				</form>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="register">
		<form action="controller.jsp?action=welcome" method="post">
			<table class="blogs">
				<tr class="blog"><th width="100px">EMAIL</th><td><input class="add" type="text" name="email"/></td></tr>
				<tr class="blog"><th>PASSWORD</th><td><input class="add" type="password" name="password"/></td></tr>
				<tr class="blog"><th>NAME</th><td><input class="add" type="text" name="name"/></td></tr>
				<tr class="blog" height="400px" style="overFlow-y:scroll"><th>SHORT DESCRIPTION</th><td><textarea class="add" name="description"></textarea></td></tr>
				<tr><td><input type="submit" value="Add"/></td><td><a href="controller.jsp?action=index">Cancel</a></td></tr>
			</table>
		</form>
	</xsl:template>
	
</xsl:stylesheet>
