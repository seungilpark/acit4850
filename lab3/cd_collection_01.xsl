<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="cd_collection/@owner" />&apos;s CD collection
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="cd_collection/@owner" />&apos;s CD collection
                </h1>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Artist</th>
                        <th>Title</th>
                        <th>Type of CD</th>
                    </tr>
                    <xsl:apply-templates select="cd_collection/cd">
                        <xsl:sort select="pubdate" data-type="number"></xsl:sort>
                    </xsl:apply-templates>
                </table>
                <!-- <xsl:apply-templates select="menu/section" /> -->
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="cd">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="pubdate"/></td>
            <td><xsl:value-of select="artist"/></td>
            <td><xsl:value-of select="title"/></td>
            <xsl:choose>
                <xsl:when test="@type = 'album'">
                    <td>Album</td>
                </xsl:when>
                <xsl:when test="@type = 'soundtrack'">
                    <td>Soundtrack</td>
                </xsl:when>
                <xsl:when test="@type = 'compilation'">
                    <td>Compliation</td>
                </xsl:when>
            </xsl:choose>
        </tr>
        
    </xsl:template>


</xsl:stylesheet>