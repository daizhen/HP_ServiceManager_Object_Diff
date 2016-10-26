<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Template: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <link rel="stylesheet" type="text/css" href="./{model/@name}.css"/>
      </head>
      <body class="{model/@name}">
        <h1>Template</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Table name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/tablename"/>
              </td>
            </tr>
            <tr>
              <td class="label">Folder</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/folder"/>
              </td>
            </tr>
            <tr>
              <td class="label">Authorized roles</td>
              <td>
                <xsl:for-each select="model/instance/role">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </xsl:for-each>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th>Captin</th>
              <th>Type</th>
              <th>Value</th>
              <th>Field</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/templateInfo/templateInfo">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./caption"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./type"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./display"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./field"/>
                </td>
              </tr>
            </xsl:for-each>
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
