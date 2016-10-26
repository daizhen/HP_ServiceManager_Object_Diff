<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Trigger: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>Trigger</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Trigger Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/trigger.name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Table Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/table.name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Trigger Type</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/trigger.type"/>
              </td>
            </tr>
            <tr>
              <td class="label">Application</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/application.name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Script</td>
              <td>
                <pre>
                  <xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript"/>
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
