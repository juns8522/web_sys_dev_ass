<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="page">
		<html>
		<head></head>
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
	
	<xsl:template match = "userAlreadyExistsMsg">
		<p>the user email is already existed. Click <a href="controller.jsp?action=register">here</a> to register again.</p>
	</xsl:template>
		
	<xsl:template match = "incorrectMsg">
		<p>No blank field is required. Clink <a href="controller.jsp?action=register">here</a> to go to previous page.</p>
	</xsl:template>
</xsl:stylesheet>
