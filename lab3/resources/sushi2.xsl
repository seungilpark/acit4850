<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="menu/@restaurant_name"/></title>
			</head>
			<body>
				<h1><xsl:value-of select="menu/@restaurant_name"/></h1>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>
