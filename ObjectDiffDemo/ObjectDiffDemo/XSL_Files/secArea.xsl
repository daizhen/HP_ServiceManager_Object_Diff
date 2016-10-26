<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
    <xsl:template match="/" >
        <html>
            <head>
                <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
                <title>Security Area:  <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/></title>
                <link rel="stylesheet" type="text/css" href="./default.css"/>
                <link rel="stylesheet" type="text/css" href="./{model/@name}.css"/>
            </head>
            <body class="{model/@name}">
                <h1>Security Area</h1>
                <table>
				    <tbody>
                        <tr>
                            <td class="label">Name:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/></td>
	       				</tr>
                        <tr>
                            <td class="label">Module:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/module"/></td>
	       				</tr>
                        <tr>
                            <td class="label">Description:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/description"/></td>
	       				</tr>
    				</tbody>
                </table>
                <p/>
                <h2>Default Rights</h2>
                <p>These rights will be inherited by all new roles</p>
                <table>
				    <tbody>
                        <tr>
                            <td class="label">View:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/view"/></td>
	       				</tr>
                        <tr>
                            <td class="label">New:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/new"/></td>
	       				</tr>
                        <tr>
                            <td class="label">Modify Template:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/modifyTemplate"/></td>
	       				</tr>
                        <tr>
                            <td class="label">Update:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/update"/></td>
	       				</tr>
                        <tr>
                            <td class="label">Delete/Close:</td>
				    		<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/delete"/></td>
	       				</tr>
    				</tbody>
                </table>
                <p/>
                <h2>Roles</h2>
                <h2>Default Settings</h2>
                <p>These settings will be inherited by all new roles</p>
    			<table>
    				<tbody>
    					<tr>
    						<th class="w50">Setting ID</th>
    						<th class="w50">Setting Value</th>
    					</tr>
    					<xsl:for-each select="model/instance/settingId/settingId"><xsl:variable name="rowNum" select="position()"/>
    						<tr>
    							<td> <xsl:value-of  disable-output-escaping="yes" select="."/></td>
    							<td> <xsl:value-of  disable-output-escaping="yes" select="../../settingValue/settingValue[$rowNum]"/></td>
    						</tr>
    					</xsl:for-each>
    				</tbody>
    			</table>
    			<p/>
    			<table class="sysmod">
    				<tbody>
    					<tr>
    						<th>SysModUser</th>
    						<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/></td>
    					</tr>
    					<tr>
    						<th>SysModTime</th>
    						<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/></td>
    					</tr>
    					<tr>
    						<th>SysModCount</th>
    						<td> <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodcount"/></td>
    					</tr>
    				</tbody>
    			</table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
