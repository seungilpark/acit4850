<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="menu/@restaurant_name"/></title>
			</head>
			<body>
				<h1><xsl:value-of select="menu/@restaurant_name"/></h1>
				<xsl:apply-templates select="menu/section"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="section">
		<h2><xsl:value-of select="@title"/></h2>
		<table border="1">
			<xsl:apply-templates select="item"/>
		</table>
	</xsl:template>
	
	<xsl:template match="item">
			<tr>
				<td><xsl:value-of select="name"/></td>
				<td><xsl:value-of select="price"/></td>
			</tr>
	</xsl:template>

</xsl:stylesheet>
