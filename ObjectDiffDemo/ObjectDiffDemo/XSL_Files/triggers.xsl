<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <xsl:variable name="eol" select=" '
' " />
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Script Panel Definition: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>Script Panel Definition</h1>
        <table>
          <tr>
            <td class="label">Script Name</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/script.name"/>
            </td>
            <td class="label">Is this the first panel?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/starting.point"/>
            </td>
          </tr>
          <tr>
            <td class="label">Form Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/script.format"/>
            </td>
            <td class="label">Cluster Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="/model/instance/cluster"/>
            </td>
          </tr>
          <tr>
            <td class="label">Display Screen Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/display.screen"/>
            </td>
            <td/>
            <td/>
          </tr>
        </table>
        <h4>Conditions for the execution of this script</h4>
        <table>
          <tr>
            <td class="label">Skip Display:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/bypass.display"/>
            </td>
          </tr>
          <tr>
            <td class="label">Bypass Cond:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/bypass.cond"/>
            </td>
          </tr>
          <tr>
            <td class="label">Enter=Continue?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/enter"/>
            </td>
          </tr>
        </table>
        <p/>
        <h4>Statements to execute after the form executes and before the application runs</h4>
        <table>
          <tr>
            <th>Pre RAD Statements</th>
          </tr>
          <xsl:for-each select="model/instance/statements/statements">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:if test="count(model/instance/statements/statements)=0">
            <tr>
              <td>
                <br/>
              </td>
            </tr>
          </xsl:if>
        </table>
        <p/>
        <h4>Javascript to execute after the form executes and before the application runs</h4>
        <table>
          <tr>
            <th>Pre RAD JavaScript</th>
          </tr>
          <tr>
            <td>
              <!--
						<xsl:call-template name="search-and-replace">
							<xsl:with-param name="input" select="model/instance/javascript.pre"/>
							<xsl:with-param name="search-string" select="$eol"/>
							<xsl:with-param name="replace-string" select="x "/>
						</xsl:call-template>
-->
              <pre>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript.pre"/>
              </pre>
              <xsl:if test="string-length(model/instance/javascript.pre)=0">
                <br/>
              </xsl:if>
            </td>
          </tr>
        </table>
        <p/>
        <h4>Application to run after the form executes</h4>
        <table>
          <tr>
            <td class="label">RAD Application:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/application"/>
            </td>
          </tr>
          <tr>
            <td class="label">Names</td>
            <td class="label">Values</td>
          </tr>
          <tr>
            <td>
              <xsl:for-each select="model/instance/names/names">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
              <xsl:if test="count(model/instance/names/names)=0">
                <br/>
              </xsl:if>
            </td>
            <td>
              <xsl:for-each select="model/instance/values/values">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
            </td>
          </tr>
        </table>
        <p/>
        <h4>Statements to execute after the form executes and after the application runs</h4>
        <table>
          <tr>
            <th>Post RAD Statements</th>
          </tr>
          <xsl:for-each select="model/instance/post.statements/post.statements">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:if test="count(model/instance/post.statements/post.statements)=0">
            <tr>
              <td>
                <br/>
              </td>
            </tr>
          </xsl:if>
        </table>
        <p/>
        <h4>Javascript to execute after the form executes and after the application runs</h4>
        <table>
          <tr>
            <th>Post RAD JavaScript</th>
          </tr>
          <tr>
            <td>
              <!--
						<xsl:call-template name="search-and-replace">
							<xsl:with-param name="input" select="model/instance/javascript.post"/>
							<xsl:with-param name="search-string" select="$eol"/>
							<xsl:with-param name="replace-string" select="x "/>
						</xsl:call-template>
-->
              <pre>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript.post"/>
              </pre>
              <xsl:if test="string-length(model/instance/javascript.post)=0">
                <br/>
              </xsl:if>
            </td>
          </tr>
        </table>
        <p/>
        <h4>Names of the scripts to be processed next</h4>
        <table>
          <thead>
            <tr>
              <th>Next Script</th>
              <th>Condition</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/exits/exits">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../exit.cond/exit.cond[$rowNum]"/>
                </td>
              </tr>
            </xsl:for-each>
            <xsl:if test="count(model/instance/statements/statements)=0">
              <tr>
                <td>
                  <br/>
                </td>
                <td>
                  <br/>
                </td>
              </tr>
            </xsl:if>
          </tbody>
        </table>
        <p/>
        <table class="sysmod">
          <tbody>
            <tr>
              <th>SysModUser</th>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/>
              </td>
            </tr>
            <tr>
              <th>SysModTime</th>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/>
              </td>
            </tr>
            <tr>
              <th>SysModCount</th>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodcount"/>
              </td>
            </tr>
          </tbody>
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
        <xsl:value-of  disable-output-escaping="yes" select="$replace-string"/>
        <br/>
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
