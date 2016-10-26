<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Message: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <link rel="stylesheet" type="text/css" href="./{model/@name}.css"/>
      </head>
      <body class="{model/@name}">
        <h1>HP Service Manager Message</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Language Code:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/syslanguage"/>
              </td>
            </tr>
            <tr>
              <td class="label">Class:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/class"/>
              </td>
            </tr>
            <tr>
              <td class="label">Message Number:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/message.id"/>
              </td>
            </tr>
            <tr>
              <td class="label">Severity:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/severity"/>
              </td>
            </tr>
            <tr>
              <td class="label">Text:</td>
              <td>
                <pre>
                  <xsl:value-of  disable-output-escaping="yes" select="model/instance/message"/>
                </pre>
              </td>
            </tr>
            <tr>
              <td class="label">Comments:</td>
              <td>
                <xsl:for-each select="model/instance/comments/comments">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
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
</xsl:stylesheet>
