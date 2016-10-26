<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
    <xsl:template match="/" >
        <xsl:variable name="eol" select=" '
' " />
        <html>
            <head>
                <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
                <title>Process: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/></title>
                <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
            </head>
            <body class="{model/@name}">
                <h1>Process Definition</h1>
                <h3>Process Name: <xsl:value-of  disable-output-escaping="yes" select="model/instance/process"/></h3>
                <table>
                	<tr>
                		<td class="label">Save Cursor Position?</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/save.cursor.position"/></td>
                		<td class="label">Run Standard Process when complete?</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/run.standard"/></td>
                	</tr>
                	<tr>
                		<td class="label">Run in window?</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/run.in.window"/></td>
                		<td class="label">Window Title:</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/window.name"/></td>
                	</tr>
                </table>
                <p/>
                <table>
                	<tr><th>Initial Expressions</th></tr>
                	<xsl:for-each select="model/instance/pre.expressions/pre.expressions">
                		<tr><td><xsl:value-of  disable-output-escaping="yes" select="."/></td></tr>
                	</xsl:for-each>
                </table>
                <p/>
                <table>
                	<tr><th>Initial JavaScript</th></tr>
                	<tr>
                		<td>
<!--
                		<xsl:call-template name="search-and-replace">
                			<xsl:with-param name="input" select="model/instance/javascript.pre"/>
                			<xsl:with-param name="search-string" select="$eol"/>
                			<xsl:with-param name="replace-string" select=" x "/>
                		</xsl:call-template>
-->
                		  <pre><xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript.pre"/></pre>
                        </td>
                	</tr>
                </table>
                <p/>
                <h3>RAD</h3>
                <xsl:for-each select="model/instance/rad/rad">
                	<table>
                		<tr><th>Expressions evaluated before RAD call</th></tr>
                		<xsl:for-each select="pre.rad.expressions/pre.rad.expressions">
                		<tr><td><xsl:value-of  disable-output-escaping="yes" select="."/></td></tr>
                		</xsl:for-each>
                		<tr><td><br/></td></tr>
                	</table>
                	<p/>
                	<table>
                		<tr>
                			<td class="label">RAD Application:</td><td><xsl:value-of  disable-output-escaping="yes" select="application"/></td>
                			<td class="label">Condition:</td><td><xsl:value-of  disable-output-escaping="yes" select="rad.condition"/></td>
                		</tr>
                	</table>
                	<table>
                		<tr>
                			<th>Parameter Names</th>
                			<th>Parameter Values</th>
                		</tr>
                		<tr>
                			<td><xsl:for-each select="names/names"><xsl:value-of  disable-output-escaping="yes" select="."/><br/></xsl:for-each></td>
                			<td><xsl:for-each select="values/values"><xsl:value-of  disable-output-escaping="yes" select="."/><br/></xsl:for-each></td>
                		</tr>
                	</table>
                	<p/>
                	<table>
                		<tr><th>Post RAD Expressions</th></tr>
                		<xsl:for-each select="post.rad.expressions/post.rad.expressions">
                		<tr><td><xsl:value-of  disable-output-escaping="yes" select="."/></td></tr>
                		</xsl:for-each>
                		<tr><td><br/></td></tr>
                	</table>
                	<hr/><p/>
                </xsl:for-each>
                <table>
                	<tr><th>Final Expressions</th></tr>
                	<xsl:for-each select="model/instance/post.expressions/post.expressions">
                		<tr><td><xsl:value-of  disable-output-escaping="yes" select="."/></td></tr>
                	</xsl:for-each>
                </table>
                <p/>
                <table>
                	<tr><th>Final JavaScript</th></tr>
                	<tr>
                		<td>
<!--
                		<xsl:call-template name="search-and-replace">
                			<xsl:with-param name="input" select="model/instance/javascript.post"/>
                			<xsl:with-param name="search-string" select="$eol"/>
                			<xsl:with-param name="replace-string" select=" x "/>
                		</xsl:call-template>
-->
                		  <pre><xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript.post"/></pre>
                        </td>
                	</tr>
                </table>
                <p/>
                <table>
                	<tr><th>Next Process</th><th>Condition</th></tr>
                	<xsl:for-each select="model/instance/next.process/next.process">
                		<xsl:variable name="rowNum" select="position()"/>
                		<tr><td><xsl:value-of  disable-output-escaping="yes" select="."/></td><td><xsl:value-of  disable-output-escaping="yes" select="../../process.condition/process.condition[$rowNum]"/></td></tr>
                	</xsl:for-each>
                </table>
                <p/>
                <table>
                	<tr><th>SysModUser</th><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/></td></tr>
                	<tr><th>SysModTime</th><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/></td></tr>
                	<tr><th>SysModCount</th><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodcount"/></td></tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <!-- The following template is from
    	XSLT Cookbok, Second Edition by Sal Mangano. Copyright 2006 O'Reilly Media, Inc.
    	-->
    <xsl:template name="search-and-replace">
    	<xsl:param name="input"/>
    	<xsl:param name="search-string"/>
    	<xsl:param name="replace-string"/>
    	<xsl:choose>
    		<!-- See if the input contains the search string -->
    		<xsl:when test="$search-string and contains($input,$search-string)">
    			<!-- If so, then concatenate the substring before the search string 
    			to the replacement string and to the result of recursively applying 
    			this template to the remaining substring. -->
    			<xsl:value-of  disable-output-escaping="yes" select="substring-before($input,$search-string)"/>
    			<xsl:value-of  disable-output-escaping="yes" select="$replace-string"/><br/>
    			<xsl:call-template name="search-and-replace">
    				<xsl:with-param name="input" select="substring-after($input,$search-string)"/>
    				<xsl:with-param name="search-string" select="$search-string"/>
    				<xsl:with-param name="replace-string" select="$replace-string"/>
    			</xsl:call-template>
    		</xsl:when>
    		<xsl:otherwise>
    			<!-- There are no more occurrences of the search string so just return the current input string -->
    			<xsl:value-of  disable-output-escaping="yes" select="$input"/>
    		</xsl:otherwise>
    	</xsl:choose>
    </xsl:template>
</xsl:stylesheet>

