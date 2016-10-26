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
          ServiceCenter DisplayOption: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>Display Application Option Definition</h1>
        <table>
          <tr>
            <td class="label">Screen ID:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/screen.id"/>
            </td>
            <td class="label">Action:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/action"/>
            </td>
          </tr>
          <tr>
            <td class="label">Unique ID:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/id"/>
            </td>
            <td class="label">Modifies Record:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/modify.record"/>
            </td>
          </tr>
          <tr>
            <td class="label">GUI Option:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/gui.option"/>
            </td>
            <td class="label">Balloon Help (If Option&lt;200):</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/labels/balloon"/>
            </td>
          </tr>
          <tr>
            <td class="label">Text Option:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/txt.option"/>
            </td>
            <td class="label">Default Label:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/labels/default"/>
            </td>
          </tr>
          <tr>
            <td class="label">Bank:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/txt.bank"/>
            </td>
            <td class="label">Text Alternative:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/labels/txt.alternative"/>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">Condition:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/condition"/>
            </td>
          </tr>
          <tr>
            <td class="label">User Condition:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/user.condition"/>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <th>Pre RAD Expressions</th>
          </tr>
          <xsl:for-each select="model/instance/post.expressions/post.expressions">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:if test="count(model/instance/post.expressions/post.expressions)=0">
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
            <th>Pre JavaScript</th>
          </tr>
          <tr>
            <td>
              <xsl:call-template name="search-and-replace">
                <xsl:with-param name="input" select="model/instance/javascript.pre"/>
                <xsl:with-param name="search-string" select="$eol"/>
                <xsl:with-param name="replace-string" select=" x "/>
              </xsl:call-template>

            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">RAD Application:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/rad/application"/>
            </td>
          </tr>
          <tr>
            <td class="label">Separate Thread?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/rad/new.thread"/>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <th>Names</th>
            <th>Values</th>
          </tr>
          <tr>
            <td>
              <xsl:for-each select="model/instance/rad/names/names">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
            </td>
            <td>
              <xsl:for-each select="model/instance/rad/values/values">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <th>Post RAD Expressions</th>
          </tr>
          <xsl:for-each select="model/instance/post.rad.expressions/post.rad.expressions">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:if test="count(model/instance/post.rad.expressions/post.rad.expressions)=0">
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
              <xsl:call-template name="search-and-replace">
                <xsl:with-param name="input" select="model/instance/javascript.post"/>
                <xsl:with-param name="search-string" select="$eol"/>
                <xsl:with-param name="replace-string" select=" x "/>
              </xsl:call-template>

            </td>
          </tr>
        </table>
        <p/>
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
