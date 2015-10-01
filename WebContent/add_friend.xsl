<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="page">
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
				   textarea.add, input.add { width:100%; font-size:15px;}
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
	
	<xsl:template match="search">
		<form action="controller.jsp?action=add_friendAction" method="post">
			<table class="friend">
				<tr >
					<th width="100px">Friend's Email</th>
					<td>
						<input class="add" type="text" name="fEmail"/>
					</td>
					<td><input type="submit" value="Search" /></td>
				</tr>
				
			</table>
			
		</form>
	</xsl:template>
	
	<xsl:template match="addFriend">
		<form action="controller.jsp?action=add_friendAction" method="post">
			<table class="friend">
			   <tr>
					<th width="100px">Friend's Email</th>
					<td>
						<input class="add" type="text" name="add" value="{email}"/>
					</td>
					<td><input type="submit" value="Add" /></td>
				</tr>
			</table>
		</form>
	</xsl:template>
	
	<xsl:template match="message">
		<p >
			Friend request has been sent.
		</p>
	</xsl:template>
	
	<xsl:template match="requests">
		<table class="blogs">
		<tr>
			<th>NAME</th><th>EMAIL</th><th>Accept</th><th>Reject</th>
		</tr>
		<tr class="blog">
			<xsl:apply-templates/>
		</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="requests/name">
		<td >
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="requests/email">
		<td >
			<xsl:value-of select="value"/>
		</td>
		<td>
			<form action="controller.jsp?action=decisionYes" method="post">
				<button name="rEmail" type="submit" value="{value}">Ok</button>
			</form>
		</td>
		<td>
			<form action="controller.jsp?action=decisionNo" method="post">
				<button name="rEmail" type="submit" value="{value}">No</button>
			</form>
		</td>
	</xsl:template>
	
	<xsl:template match="friends">
		<table class="blogs">
		<tr class="blog">
			<th>NAME</th><th>EMAIL</th><th>LINK</th>
		</tr>
		<tr class="blog">
			<xsl:apply-templates/>
		</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="friends/name">
		<td >
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="friends/email">
		<td >
			<xsl:value-of select="value"/>
		</td>
		<td>
			<form action="controller.jsp?action=friends_blog" method="post">
				<button name="fEmail" type="submit" value="{value}">blog</button>
			</form>
		</td>
		
	</xsl:template>
	
	<xsl:template match="fBlogs">
		<table class="blogs">
			<tr><th>DATE</th><th>TITLE</th><th>DETAIL</th></tr>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	
	<xsl:template match="fBlog">
		<tr class="blog">
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	
	<xsl:template match="fBlog/date">
		<td width="200px">
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="fBlog/title">
		<td>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="fBlog/id">
		<td width="100px">
			<form action="controller.jsp?action=fBlog_detail" method="post">
				<button name="id" type="submit" value="{idVal}">detail</button>
			</form>
		</td>
	</xsl:template>
</xsl:stylesheet>
