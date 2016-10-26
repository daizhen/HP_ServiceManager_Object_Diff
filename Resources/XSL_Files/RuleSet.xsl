<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Rule Set: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>
          RuleSet - <xsl:value-of  disable-output-escaping="yes" select="model/instance/id"/>
        </h1>
        <table>
          <tbody>
            <tr>
              <td class="label">ID</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/id"/>
              </td>
              <td class="label">Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Available as action</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/isAction"/>
              </td>
              <td class="label">HP Proprietary</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysrestricted"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>Table Names</h3>
        <ul>
          <xsl:for-each select="model/instance/tablename/tablename">
            <li>
              <xsl:value-of  disable-output-escaping="yes" select="."/>
            </li>
          </xsl:for-each>
        </ul>
        <p/>
        <h3>Rules</h3>
        <xsl:for-each select="model/instance/rule/rule">
          <table>
            <tbody>
              <tr>
                <td class="label">Rule ID</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./ruleId"/>
                </td>
              </tr>
              <tr>
                <td class="label">Group?</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./isGroup"/>
                </td>
              </tr>
              <tr>
                <td class="label">Parent Group</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./parentGroup"/>
                </td>
              </tr>
              <tr>
                <td class="label">Rule XML</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./ruleXML"/>
                </td>
              </tr>
              <tr>
                <td class="label">Rule Description</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./ruleDesc"/>
                </td>
              </tr>
              <tr>
                <td class="label">Condition</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./condition"/>
                </td>
              </tr>
              <tr>
                <td class="label">Condition Description</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./conditionDesc"/>
                </td>
              </tr>
              <tr>
                <td class="label">Condition XML</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./conditionXML"/>
                </td>
              </tr>
              <tr>
                <td class="label">Full Description</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./fullDesc"/>
                </td>
              </tr>
              <tr>
                <td class="label">Level</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./level"/>
                </td>
              </tr>
            </tbody>
          </table>
          <p/>
        </xsl:for-each>
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
