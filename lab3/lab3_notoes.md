1. XML document is constructed with its schema, processing information, elements, and attributes.
2. Rules 
    - There must be one and only one root element for the document
    - Proper nesting
    - case-sensitive
    - 
3.  DTD (Document Type Definition) one of commonly used XML schema
    - e.g. !ATTLIST, !ELEMENT regex
    - you can define / declare an element, attributes
    - you can define the rules for nesting the element (what kinds of elements are permitted / required, what order they must be in, etc.) 

4. XSL: eXtensible Stylesheet Language
    - XSL has two parts:
        - XSLT for transformations
        - XSL-FO for formatting 
    - XSLT processor compile(?) XML and XSLT stylesheet to combine them to an output in XML HTML Text

5. to indicate parser? processor that you use XSL
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"></xsl:stylesheet>

6. template
    - match= attribute indicates to processor when to execute
    - match maps to the document structure (XML's structure and '/' representing the root element )  
    - match searches in relative paths
 <!-- add a root template -->
	<xsl:template match="/">
		<html>
			<head>
				<title>Hello</title>
			</head>
			<body>
				<p>World</p>
			</body>
		</html>
	</xsl:template>

7. xsl:value-of
    - seems like XSL is used as a presentation layer and XML as data model
    - select attribute value
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

8. xsl:apply-templates
    - you can nest(apply) another template inside of a template?
    - they seem like function calls but different 
    - By the below xsl, the "section" templates get executed for every element that matches with the context 
    - seems like you have to declare template with xsl:template (which can nest xsl:apply-templates )
    - and you apply the template by using xsl:apply-template inside of template
    - select= 
    
    <!-- apply-template example 1 -->
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
    <!-- apply-template example 2 -->
	<xsl:template match="section">
		<h2><xsl:value-of select="@title"/></h2>
	</xsl:template>

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
		<xsl:apply-templates select="item"/>
	</xsl:template>
	
	<xsl:template match="item">
		<p><xsl:value-of select="name"/></p>
	</xsl:template>


9. putting the items in a table
    <!-- sushi5.xsl -->
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


<!-- compare -->
	<xsl:template match="section">
		<h2><xsl:value-of select="@title"/></h2>
		<xsl:apply-templates select="item"/>
	</xsl:template>

    <xsl:template match="item">
		<table border="1">
			<tr>
				<td><xsl:value-of select="name"/></td>
				<td><xsl:value-of select="price"/></td>
			</tr>
		</table>
	</xsl:template>
<!-- above shows each row in a separate table -->
    
<!-- with this  -->
	
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


10. adding processing functionnality in side of template by using xsl:sort
    - xsl:sort defines a processing order for the nodes that are being passed to the processo
    <!-- gg -->
    <xsl:template match="section">
		<h2><xsl:value-of select="@title"/></h2>
		<table border="1">
			<xsl:apply-templates select="item">
				<xsl:sort select="price" data-type="number"></xsl:sort>
				<xsl:sort [order=["descending"|"ascending"]] select="name" data-type="text"></xsl:sort>
			</xsl:apply-templates>
		</table>
	</xsl:template>


11. xsl:choose/when/otherwise
    - lets you ommit null contents and does what xsl:value-of         
    - e.g. adding description with 
    - test attribute checks if the content of the element is empty
    - choose is the case when there is some content
    - otherwise is the case when its empty
<!-- has some bugs: it shows empty parenthesis() and not sorted?  -->
	<xsl:template match="item">
			<tr>
				<td><xsl:value-of select="name"/>
					(<xsl:value-of select="description"/>)</td>
				<td><xsl:value-of select="price"/></td>
			</tr>
	</xsl:template>
<!-- fixed  with xsl:choose-->
	<xsl:template match="item">
		<tr>
			<td><xsl:value-of select="name"/>
				<xsl:choose>
					<xsl:when test="description">
						(<xsl:value-of select="description"/>)
					</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
				</td>
			<td><xsl:value-of select="price"/></td>
		</tr>
	</xsl:template>



