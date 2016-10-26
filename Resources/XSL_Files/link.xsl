<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:variable name="eol" select=" '
' " />
    <html>

      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Link: <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <script src="js/jquery.js"></script>
        <script src="js/colResizable-1.3.min.js"></script>
        <script language="javascript" type="text/javascript">
          function displaydetails()
          {
          document.getElementById("lk-detail").style.display = "block";
          document.getElementById("showbutton").style.display = "none";
          document.getElementById("hidebutton").style.display = "inline";
          }
          function hidedetails()
          {
          document.getElementById("lk-detail").style.display = "none";
          document.getElementById("hidebutton").style.display = "none";
          document.getElementById("showbutton").style.display = "inline";
          }
        </script>
        <script type="text/javascript">
          $(function(){
          $("#Main").colResizable();
          });
        </script>
      </head>

      <body class="{model/@name}" onload="hidedetails()">
        <h1>Link File</h1>
        <input id="showbutton" type="button" value="Show Details" onclick="displaydetails()"/>
        <input id="hidebutton" type="button" value="Hide Details" onclick="hidedetails()"/>
        <table>
          <tr>
            <td class="label">Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
            </td>
            <td class="label">System:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/system"/>
            </td>
          </tr>
          <tr>
            <td class="label">Description:</td>
            <td colspan="3">
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/description"/>
            </td>
          </tr>
        </table>
        <p/>
        <table id="Main">
          <tr>
            <th>Source Field Name</th>
            <th>Target File Name</th>
            <th>Target Format Name</th>
            <th>Target Field Name</th>
            <th>Add Query</th>
            <th>Comments</th>
          </tr>
          <xsl:for-each select="model/instance/source.fields/source.fields">
            <xsl:variable name="rowNum" select="position()"/>
            <tr>
              <td class="main-src">
                <a href="#Line {$rowNum}">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </a>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../target.files/target.files[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../target.formats/target.formats[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../target.fields/target.fields[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../add.query/add.query[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../comment/comment[$rowNum]"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p class="sysmod">
          SysModUser: <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/>
        </p>
        <p class="sysmod">
          SysModTime: <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/>
        </p>
        <p class="sysmod">
          SysModCount: <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodcount"/>
        </p>
        <div id="lk-detail">
          <xsl:for-each select="model/instance/source.fields/source.fields">
            <xsl:variable name="rowNum" select="position()"/>
            <hr/>
            <a name="Line {$rowNum}">
              <h4>
                Link Line # <xsl:value-of  disable-output-escaping="yes" select="$rowNum"/>
              </h4>
            </a>
            <p/>
            <table>
              <tr>
                <th>Field (From/Source)</th>
                <th>Format/File (To/Target)</th>
                <th>Field (To/Target></th>
              </tr>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../target.files/target.files[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../target.fields/target.fields[$rowNum]"/>
                </td>
              </tr>
            </table>
            <p/>
            <table>
              <tr>
                <td class="label">Comment:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../comment/comment[$rowNum]"/>
                </td>
              </tr>
              <tr>
                <td class="label">Query:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../add.query/add.query[$rowNum]"/>
                </td>
              </tr>
              <tr>
                <td class="label">QBE Format:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../qbe.format/qbe.format[$rowNum]"/>
                </td>
              </tr>
              <tr>
                <td class="label">Structured Array Name:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../structure/structure[$rowNum]"/>
                </td>
              </tr>
            </table>
            <p/>
            <table>
              <tr>
                <th>Expressions</th>
              </tr>
              <xsl:if test="count(../../link.expressions/link.expressions[$rowNum]/link.expressions)=0">
                <tr>
                  <td>
                    <br/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:for-each select="../../link.expressions/link.expressions[$rowNum]/link.expressions">
                <tr>
                  <td>
                    <xsl:value-of  disable-output-escaping="yes" select="."/>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
            <p/>
            <table>
              <tr>
                <th>JavaScript</th>
              </tr>
              <tr>
                <td>
                  <!--
                					<xsl:call-template name="search-and-replace">
                						<xsl:with-param name="input" select="../../javascript.pre/javascript.pre[$rowNum]"/>
                						<xsl:with-param name="search-string" select="$eol"/>
                						<xsl:with-param name="replace-string" select=" x "/>
                					</xsl:call-template>
-->
                  <pre>
                    <xsl:value-of  disable-output-escaping="yes" select="../../javascript.pre/javascript.pre[$rowNum]"/>
                  </pre>
                </td>
              </tr>
              <xsl:if test="string-length(../../javascript.pre/javascript.pre[$rowNum])=0">
                <tr>
                  <td>
                    <br/>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <p/>
            <table>
              <tr>
                <th>Source Field (Fill To/Post From)</th>
                <th>Target Field (Fill From/Post To)</th>
              </tr>
              <xsl:for-each select="../../project.target.fields/project.target.fields[$rowNum]/project.target.fields">
                <xsl:variable name="lvl2rowNum" select="position()"/>
                <tr>
                  <td>
                    <xsl:value-of  disable-output-escaping="yes" select="."/>
                  </td>
                  <td>
                    <xsl:value-of  disable-output-escaping="yes" select="../../../project.source.fields/project.source.fields[$rowNum]/project.source.fields[$lvl2rowNum]"/>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
            <p/>
            <table>
              <tr>
                <th>Post Expressions</th>
              </tr>
              <xsl:for-each select="../../post.expressions/post.expressions[$rowNum]/post.expressions">
                <tr>
                  <td>
                    <xsl:value-of  disable-output-escaping="yes" select="."/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:if test="count(../../post.expressions/post.expressions[$rowNum]/post.expressions)=0">
                <tr>
                  <td>
                    <br/>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <p/>
            <table>
              <tr>
                <th>Post JavaScript</th>
              </tr>
              <tr>
                <td>
                  <pre>
                    <xsl:value-of  disable-output-escaping="yes" select="../../javascript.post/javascript.post[$rowNum]"/>
                  </pre>
                </td>
              </tr>
              <xsl:if test="string-length(../../javascript.post/javascript.post[$rowNum])=0">
                <tr>
                  <td>
                    <br/>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <p/>
          </xsl:for-each>
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
