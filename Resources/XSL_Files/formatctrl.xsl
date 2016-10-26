<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
    <xsl:template match="/" >
    <xsl:variable name="eol" select=" '
' " />
        <html>
            <head>
                <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
                <title>Format Control: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/></title>
                <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
            </head>
            <body class="{model/@name}">
                <h1>Format Control</h1>
                <div class="MainInfo">
				<table id="main">
					<tr>
						<td class="label">Name</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/></td>
					</tr>
					<tr>
						<td class="label">File Name</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/file.name"/></td>
					</tr>
					<tr>
						<td class="label">System</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/system"/></td>
					</tr>
					<tr>
						<td class="label">Query Format</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/query.format"/></td>
					</tr>
					<tr>
						<td class="label">Default QBE Format</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/default.qbe"/></td>
					</tr>
				</table>
				<p/>
				<table id="flags">
					<tr>
						<td class="label">Save Copy?</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.copy"/></td>
					</tr>
					<tr>
						<td class="label">Stored Form Name?</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/format.field"/></td>
					</tr>
					<tr>
						<td class="label">Run Script?</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/script"/></td>
					</tr>
					<tr>
						<td class="label">Use Default Sort?</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.sort"/></td>
					</tr>
				</table>
				<p/>
				<table id="sortSequence">
					<tr><th>Default Sort sequence for queries</th></tr>
					<xsl:for-each select="model/instance/default.sort/default.sort">
						<tr><td><xsl:value-of  disable-output-escaping="yes" select="."/></td></tr>
					</xsl:for-each>
					<xsl:if test="count(model/instance/default.sort/default.sort)=0">
						<tr><td><br/></td></tr>
					</xsl:if>
				</table>
				<p/>
				<table id="initializationExpressions">
					<tr><th>Initialization Expressions</th></tr>
					<xsl:for-each select="model/instance/init.expr/init.expr">
						<tr><td><xsl:value-of  disable-output-escaping="yes" select="."/></td></tr>
					</xsl:for-each>
					<xsl:if test="count(model/instance/init.expr/init.expr)=0">
						<tr><td><br/></td></tr>
					</xsl:if>
				</table>
				<p/>
                </div>
				<table class="sysmod">
					<tr>
						<td class="label">SysModUser</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/></td>
					</tr>
					<tr>
						<td class="label">SysModTime</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/></td>
					</tr>
					<tr>
						<td class="label">SysModCount</td><td><xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodcount"/></td>
					</tr>
				</table>
				<p/>
				<hr/>
				<h3>Views</h3>
                <div class="Views">
				<h4>QBE Formats</h4>
				<table id="QbeFormats">
					<tr>
						<th>QBE Format Name</th>
						<th>Comment</th>
						<th>Condition</th>
					</tr>
					<xsl:if test="count(model/instance/qbeformats/qbeformats)=0">
						<tr><td><br/></td><td><br/></td><td><br/></td></tr>
					</xsl:if>
					<xsl:for-each select="model/instance/qbeformats/qbeformats">
						<tr>
							<td><xsl:value-of  disable-output-escaping="yes" select="qbe.formats"/></td>
							<td><xsl:value-of  disable-output-escaping="yes" select="qbe.comments"/></td>
							<td><xsl:value-of  disable-output-escaping="yes" select="qbe.conditions"/></td>
						</tr>
					</xsl:for-each>
				</table>
				<h4>Alternate Views</h4>
				<table id="AlternateViews">
					<tr>
						<th>Display Format Name</th>
						<th>Condition</th>
					</tr>
					<xsl:if test="count(model/instance/views/views)=0">	
						<tr><td><br/></td><td><br/></td></tr>
					</xsl:if>
					<xsl:for-each select="model/instance/views/views">
						<tr>
							<td><xsl:value-of  disable-output-escaping="yes" select="alternate.views"/></td>
							<td><xsl:value-of  disable-output-escaping="yes" select="view.conditions"/></td>
						</tr>
					</xsl:for-each>
				</table>
                </div>
				<hr/>
				<h3>Queries</h3>
                <div class="Queries">
				<xsl:for-each select="model/instance/queries/queries">
					<table class="query">
						<tr>
							<td class="label">Line #</td><td><xsl:value-of  disable-output-escaping="yes" select="position()"/></td>
						</tr>
						<tr>
							<td class="label">Add</td><td><xsl:value-of  disable-output-escaping="yes" select="add"/></td>
						</tr>
						<tr>
							<td class="label">Update</td><td><xsl:value-of  disable-output-escaping="yes" select="update"/></td>
						</tr>
						<tr>
							<td class="label">Delete</td><td><xsl:value-of  disable-output-escaping="yes" select="delete"/></td>
						</tr>
						<tr>
							<td class="label">Display</td><td><xsl:value-of  disable-output-escaping="yes" select="display"/></td>
						</tr>
						<tr>
							<td class="label">Required</td><td><xsl:value-of  disable-output-escaping="yes" select="required"/></td>
						</tr>
						<tr>
							<td class="label">Initial</td><td><xsl:value-of  disable-output-escaping="yes" select="query.init"/></td>
						</tr>
						<tr>
							<td class="label">Filename</td><td><xsl:value-of  disable-output-escaping="yes" select="file"/></td>
						</tr>
						<tr>
							<td class="label">Field Name to Check</td><td><xsl:value-of  disable-output-escaping="yes" select="field.name"/></td>
						</tr>
						<tr>
							<td class="label">Query</td><td><xsl:value-of  disable-output-escaping="yes" select="query"/></td>
						</tr>
						<tr>
							<td class="label">Message</td><td><xsl:value-of  disable-output-escaping="yes" select="message"/></td>
						</tr>
						<tr>
							<td class="label">Comments</td><td><xsl:value-of  disable-output-escaping="yes" select="comments"/></td>
						</tr>
					</table>
					<p/>
				</xsl:for-each>
                </div>
				<hr/>
				<h3>Calculations</h3>
                <div class="Calculations">
				<xsl:for-each select="model/instance/calculations/calculations">
					<table class="calculation">
						<tr>
							<td class="label">Line #</td><td><xsl:value-of  disable-output-escaping="yes" select="position()"/></td>
						</tr>
						<tr>
							<td class="label">Add</td><td><xsl:value-of  disable-output-escaping="yes" select="add"/></td>
						</tr>
						<tr>
							<td class="label">Update</td><td><xsl:value-of  disable-output-escaping="yes" select="update"/></td>
						</tr>
						<tr>
							<td class="label">Delete</td><td><xsl:value-of  disable-output-escaping="yes" select="delete"/></td>
						</tr>
						<tr>
							<td class="label">Display</td><td><xsl:value-of  disable-output-escaping="yes" select="display"/></td>
						</tr>
						<tr>
							<td class="label">Initial</td><td><xsl:value-of  disable-output-escaping="yes" select="calc.init"/></td>
						</tr>
						<tr>
							<td class="label">Calculation</td><td><xsl:value-of  disable-output-escaping="yes" select="calculation"/></td>
						</tr>
						<tr>
							<td class="label">Comments</td><td><xsl:value-of  disable-output-escaping="yes" select="comments"/></td>
						</tr>
					</table>
					<p/>
				</xsl:for-each>
                </div>
				<hr/>
				<h3>JavaScript</h3>
                <div class="JavaScript">
				<xsl:for-each select="model/instance/javascript/javascript">
					<table class="javascript">
						<tr>
							<td class="label">Line #</td><td><xsl:value-of  disable-output-escaping="yes" select="position()"/></td>
						</tr>
						<tr>
							<td class="label">Add</td><td><xsl:value-of  disable-output-escaping="yes" select="javascript.add"/></td>
						</tr>
						<tr>
							<td class="label">Update</td><td><xsl:value-of  disable-output-escaping="yes" select="javascript.update"/></td>
						</tr>
						<tr>
							<td class="label">Delete</td><td><xsl:value-of  disable-output-escaping="yes" select="javascript.delete"/></td>
						</tr>
						<tr>
							<td class="label">Display</td><td><xsl:value-of  disable-output-escaping="yes" select="javascript.display"/></td>
						</tr>
						<tr>
							<td class="label">Initial</td><td><xsl:value-of  disable-output-escaping="yes" select="javascript.init"/></td>
						</tr>
						<tr>
							<td class="label">JavaScript</td>
<!--
							<td>
				                <xsl:call-template name="search-and-replace">
			                	<xsl:with-param name="input" select="javascript.expression"/>
			                	<xsl:with-param name="search-string" select="$eol"/>
			                	<xsl:with-param name="replace-string" select=" x "/>
				                </xsl:call-template>
							</td>
-->                            
                            <td><pre><xsl:value-of  disable-output-escaping="yes" select="javascript.expression"/></pre></td>
						</tr>
					</table>
					<p/>
				</xsl:for-each>
                </div>
				<hr/>
				<h3>Validations</h3>
                <div class="Validations">
				<p id="popup">Use Pop-up Messages: <xsl:value-of  disable-output-escaping="yes" select="model/instance/validation.popup"/></p>
				<xsl:for-each select="model/instance/validations/validations">
					<table class="validation">
						<tr>
							<td class="label">Line #</td><td><xsl:value-of  disable-output-escaping="yes" select="position()"/></td>
						</tr>
						<tr>
							<td class="label">Add</td><td><xsl:value-of  disable-output-escaping="yes" select="add"/></td>
						</tr>
						<tr>
							<td class="label">Update</td><td><xsl:value-of  disable-output-escaping="yes" select="update"/></td>
						</tr>
						<tr>
							<td class="label">Delete</td><td><xsl:value-of  disable-output-escaping="yes" select="delete"/></td>
						</tr>
						<tr>
							<td class="label">Display</td><td><xsl:value-of  disable-output-escaping="yes" select="display"/></td>
						</tr>
						<tr>
							<td class="label">Initial</td><td><xsl:value-of  disable-output-escaping="yes" select="val.init"/></td>
						</tr>
						<tr>
							<td class="label">Set Focus To</td><td><xsl:value-of  disable-output-escaping="yes" select="set.field"/></td>
						</tr>
						<tr>
							<td class="label">Validation</td><td><xsl:value-of  disable-output-escaping="yes" select="validation"/></td>
						</tr>
						<tr>
							<td class="label">Message ID</td><td><xsl:value-of  disable-output-escaping="yes" select="message.id"/></td>
						</tr>
						<tr>
							<td class="label">Message</td><td><xsl:value-of  disable-output-escaping="yes" select="message"/></td>
						</tr>
						<tr>
							<td class="label">Comments</td><td><xsl:value-of  disable-output-escaping="yes" select="comments"/></td>
						</tr>
					</table>
					<p/>
				</xsl:for-each>
                </div>
				<hr/>
				<h3>Subroutines</h3>
                <div class="Subroutines">
				<xsl:for-each select="model/instance/subroutines/subroutines">
					<table class="subroutine">
						<tr>
							<td class="label">Line #</td><td><xsl:value-of  disable-output-escaping="yes" select="position()"/></td>
						</tr>
						<tr>
							<td class="label">Add</td><td><xsl:value-of  disable-output-escaping="yes" select="add"/></td>
						</tr>
						<tr>
							<td class="label">Update</td><td><xsl:value-of  disable-output-escaping="yes" select="update"/></td>
						</tr>
						<tr>
							<td class="label">Delete</td><td><xsl:value-of  disable-output-escaping="yes" select="delete"/></td>
						</tr>
						<tr>
							<td class="label">Display</td><td><xsl:value-of  disable-output-escaping="yes" select="display"/></td>
						</tr>
						<tr>
							<td class="label">Initial</td><td><xsl:value-of  disable-output-escaping="yes" select="sub.init"/></td>
						</tr>
						<tr>
							<td class="label">Before</td><td><xsl:value-of  disable-output-escaping="yes" select="before"/></td>
						</tr>
						<tr>
							<td class="label">Error Message</td><td><xsl:value-of  disable-output-escaping="yes" select="message"/></td>
						</tr>
						<tr>
							<td class="label">Message ID</td><td><xsl:value-of  disable-output-escaping="yes" select="sub.msg.id"/></td>
						</tr>
						<tr>
							<td class="label">Comments</td><td><xsl:value-of  disable-output-escaping="yes" select="comments"/></td>
						</tr>
						<tr>
							<td class="label">Application</td><td><xsl:value-of  disable-output-escaping="yes" select="application"/></td>
						</tr>
					</table>
					<table>
						<tr><th>Names</th><th>Values</th></tr>
						<tr>
							<td>
								<xsl:for-each select="names/names">
									<xsl:value-of  disable-output-escaping="yes" select="."/><br/>
								</xsl:for-each>
								<xsl:if test="count(names/names)=0">
									<br/>
								</xsl:if>
							</td>
							<td>
								<xsl:for-each select="values/values">
									<xsl:value-of  disable-output-escaping="yes" select="."/><br/>
								</xsl:for-each>
								<xsl:if test="count(values/values)=0">
									<br/>
								</xsl:if>
							</td>
						</tr>
					</table>
					<p/>
				</xsl:for-each>
				<hr/>
                </div>
				<h3>Additional Options</h3>
                <div class="AdditionalOptions">
				<table class="additional_option_top">
					<tr>
						<td class="label">Form to Display:</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/display.format"/></td>
					</tr>
					<tr>
						<td class="label">Use As Master:</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.master"/></td>
					</tr>
					<tr>
						<td class="label">Allow Edit:</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.edit"/></td>
					</tr>
					<tr>
						<td class="label">Allow Input:</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.input"/></td>
					</tr>
				</table>
				<p/>
				<xsl:for-each select="model/instance/add.options/add.options">
					<table class="additional_option">
						<tr>
							<td class="label">Line #</td><td><xsl:value-of  disable-output-escaping="yes" select="position()"/></td>
						</tr>
						<tr>
							<td class="label">Option</td><td><xsl:value-of  disable-output-escaping="yes" select="option"/></td>
						</tr>
						<tr>
							<td class="label">Description</td><td><xsl:value-of  disable-output-escaping="yes" select="description"/></td>
						</tr>
						<tr>
							<td class="label">Description ID</td><td><xsl:value-of  disable-output-escaping="yes" select="opt.desc.id"/></td>
						</tr>
						<tr>
							<td class="label">Condition</td><td><xsl:value-of  disable-output-escaping="yes" select="condition"/></td>
						</tr>
						<tr>
							<td class="label">Reset</td><td><xsl:value-of  disable-output-escaping="yes" select="reset"/></td>
						</tr>
						<tr>
							<td class="label">Message</td><td><xsl:value-of  disable-output-escaping="yes" select="message"/></td>
						</tr>
						<tr>
							<td class="label">Comments</td><td><xsl:value-of  disable-output-escaping="yes" select="comments"/></td>
						</tr>
						<tr>
							<td class="label">Application</td><td><xsl:value-of  disable-output-escaping="yes" select="application"/></td>
						</tr>
					</table>
					<table>
						<tr><th>Names</th><th>Values</th></tr>
						<tr>
							<td>
								<xsl:for-each select="names/names">
									<xsl:value-of  disable-output-escaping="yes" select="."/><br/>
								</xsl:for-each>
								<xsl:if test="count(names/names)=0">
									<br/>
								</xsl:if>
							</td>
							<td>
								<xsl:for-each select="values/values">
									<xsl:value-of  disable-output-escaping="yes" select="."/><br/>
								</xsl:for-each>
								<xsl:if test="count(values/values)=0">
									<br/>
								</xsl:if>
							</td>
						</tr>
					</table>
					<p/>
				</xsl:for-each>
                </div>
				<hr/>
				<h3>Privileges</h3>
                <div class="Privileges">
				<table>
					<tr><th>Function</th><th>Condition</th></tr>
					<tr>
						<td class="label">Add</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.add"/></td>
					</tr>
					<tr>
						<td class="label">Update</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.update"/></td>
					</tr>
					<tr>
						<td class="label">Delete</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.delete"/></td>
					</tr>
					<tr>
						<td class="label">Find</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.find"/></td>
					</tr>
					<tr>
						<td class="label">Fill</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.fill"/></td>
					</tr>
					<tr>
						<td class="label">Print</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.print"/></td>
					</tr>
					<tr>
						<td class="label">Access from DB Mgr</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/database.access"/></td>
					</tr>
					<tr>
						<td class="label">Query Window</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.query"/></td>
					</tr>
					<tr>
						<td class="label">Count Records</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.count"/></td>
					</tr>
					<tr>
						<td class="label">Validity Lookup</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.validity"/></td>
					</tr>
					<tr>
						<td class="label">Views</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.views"/></td>
					</tr>
					<tr>
						<td class="label">Edit Array</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.expand"/></td>
					</tr>
					<tr>
						<td class="label">Load</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.load"/></td>
					</tr>
					<tr>
						<td class="label">Unload</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.unload"/></td>
					</tr>
					<tr>
						<td class="label">Mass Add</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.mass.add"/></td>
					</tr>
					<tr>
						<td class="label">Mass update</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.mass.update"/></td>
					</tr>
					<tr>
						<td class="label">Complex Update</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.complex"/></td>
					</tr>
					<tr>
						<td class="label">Mass Delete</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.mass.delete"/></td>
					</tr>
					<tr>
						<td class="label">Reset</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.reset"/></td>
					</tr>
					<tr>
						<td class="label">Regen</td>
						<td><xsl:value-of  disable-output-escaping="yes" select="model/instance/db.regen"/></td>
					</tr>
				</table>
                </div>
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

