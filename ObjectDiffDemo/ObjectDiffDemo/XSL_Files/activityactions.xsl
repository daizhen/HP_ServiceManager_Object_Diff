<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Activity Actions: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <link rel="stylesheet" type="text/css" href="./{model/@name}"/>
      </head>
      <body class="{model/@name}">
        <h1>Activity Actions</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Name:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Table:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/table"/>
              </td>
            </tr>
            <tr>
              <td class="label">Mode:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/mode"/>
              </td>
            </tr>
            <tr>
              <td class="label">Condition:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/condition"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p>&#160;</p>
        <table>
          <tbody>
            <tr>
              <th>Name</th>
              <th>Condition</th>
              <th>Description</th>
              <th>Notification</th>
            </tr>
            <xsl:for-each select="model/instance/activities/activities">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="activityname"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="activitycondition"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="activitydescription"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="activitynotification"/>
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
