<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" indent="no"/>
<xsl:strip-space elements="*"/>
	<!--MENU-->
	<xsl:template match="MENU" mode="top">
		<xsl:apply-templates select="MENU-ITEM"  mode="top"/>
	</xsl:template>

	<!--MENU-ITEM-->
	<xsl:template match="MENU-ITEM"  mode="top">
   		<xsl:choose>
           <!-- active menu with link-->
           	<xsl:when test="MENU-ITEM[@ID=/LAYOUT/@ID] or @ID=/LAYOUT/@ID">
     <td align="center"><a href="{@HREF}" class="amenu"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a></td>
     <td width="30" align="right" ><img src="images/mark_active.gif" /></td>
            </xsl:when>
            
            
            <xsl:otherwise>
     <td align="center"><a href="{@HREF}" class="menu"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a></td>
     <td width="30" align="right"><img src="images/mark.gif" /></td>
            </xsl:otherwise>
	    </xsl:choose>
		<xsl:if test="position()!=last()">
		<td width="20" align="center" ><img src="images/line.gif" width="1" height="15" /></td>
	</xsl:if>
	</xsl:template>	

</xsl:stylesheet>
