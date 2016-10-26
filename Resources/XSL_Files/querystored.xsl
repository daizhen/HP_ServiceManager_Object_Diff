<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Stored Query: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>
          Stored Query: <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
        </h1>
        <h3>
          Description: <xsl:value-of  disable-output-escaping="yes" select="model/instance/description"/>
        </h3>
        <table>
          <tr>
            <td class="label">File</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/filename"/>
            </td>
          </tr>
          <tr>
            <td class="label">Format Name</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/format"/>
            </td>
          </tr>
          <tr>
            <td class="label">QBE Format</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/qbe.format"/>
            </td>
          </tr>
          <tr>
            <td class="label">Script</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/script"/>
            </td>
          </tr>
          <tr>
            <td class="label">Pop no records message?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/pop.message"/>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">Query</td>
          </tr>
          <tr>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/query"/>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <th>Sort Fields</th>
            <th>Access List</th>
          </tr>
          <tr>
            <td>
              <xsl:for-each select="model/instance/sort.fields/sort.fields">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
              <xsl:if test="count(model/instance/sort.fields/sort.fields)=0">
                <br/>
              </xsl:if>
            </td>
            <td>
              <xsl:for-each select="model/instance/access.list/access.list">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
              <xsl:if test="count(model/instance/access.list/access.list)=0">
                <br/>
              </xsl:if>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">Application</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/application"/>
            </td>
          </tr>
          <tr>
            <td class="label">Parameter Names</td>
            <td class="label">Parameter Values</td>
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
              <xsl:if test="count(model/instance/values/values)=0">
                <br/>
              </xsl:if>
            </td>
          </tr>
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
</xsl:stylesheet>
