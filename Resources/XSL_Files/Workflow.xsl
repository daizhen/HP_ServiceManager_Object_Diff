<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Workflow: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>
          Workflow - <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
        </h1>
        <table>
          <tbody>
            <tr>
              <td>
                <p/>
              </td>
              <td>
                <p/>
              </td>
              <td class="label">HP Proprietary?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysrestricted"/>
              </td>
            </tr>
            <tr>
              <td class="label">Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
              <td class="label">Table</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/tableName"/>
              </td>
            </tr>
            <tr>
              <td class="label">Description</td>
              <td colspan="3">
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/description"/>
              </td>
            </tr>
            <tr>
              <td class="label">First phase</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/firstPhase"/>
              </td>
              <td class="label">Default phase</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/defaultPhase"/>
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
