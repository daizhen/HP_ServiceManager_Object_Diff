<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Script Library: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>ScriptLibrary</h1>
        <h3>
          Name: <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
        </h3>
        <h3>
          Package: <xsl:value-of  disable-output-escaping="yes" select="model/instance/package"/>
        </h3>
        <h3>
          System? <xsl:value-of  disable-output-escaping="yes" select="model/instance/prgnsystem"/>
        </h3>
        <table>
          <tbody>
            <tr>
              <th>Script:</th>
            </tr>
            <tr>
              <td>
                <pre>
                  <xsl:value-of  disable-output-escaping="yes" select="model/instance/script"/>
                </pre>
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

