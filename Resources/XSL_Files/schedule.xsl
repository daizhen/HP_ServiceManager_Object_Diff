<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Schedule Record: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <link rel="stylesheet" type="text/css" href="./{model/@name}.css"/>
      </head>
      <body class="{model/@name}">
        <h1>Schedule Record</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
              <td class="label">Class</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/class"/>
              </td>
            </tr>
            <tr>
              <td class="label">Number</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/number"/>
              </td>
              <td class="label">Expiration</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/expiration"/>
              </td>
            </tr>
            <tr>
              <td class="label">ID</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/schedule.id"/>
              </td>
              <td class="label">Scheduled Class</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sched.class"/>
              </td>
            </tr>
            <tr>
              <td class="label">Status</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/status"/>
              </td>
              <td class="label">Action Time</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/action.time"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th class="w50">Description</th>
              <th class="w50">Repeat Interval</th>
            </tr>
          </thead>
          <tbody>

            <tr>
              <td>
                <xsl:for-each select="model/instance/description/description">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/repeat"/><br/>
                Monthly: <xsl:value-of  disable-output-escaping="yes" select="model/instance/repeatm"/><br/>
                Quarterly: <xsl:value-of  disable-output-escaping="yes" select="model/instance/repeatq"/><br/>
                Semi-Annually: <xsl:value-of  disable-output-escaping="yes" select="model/instance/repeatb"/><br/>
                Annually: <xsl:value-of  disable-output-escaping="yes" select="model/instance/repeata"/><br/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <td class="label">Problem Status</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/pm.status"/>
              </td>
            </tr>
            <tr>
              <td class="label">Application</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/application"/>
              </td>
            </tr>
            <tr>
              <td class="label">Query</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/query"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th>Javascript</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <pre>
                  <xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript"/>
                </pre>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th class="w50">Strings</th>
              <th class="w50">Strings 1</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <xsl:for-each select="model/instance/strings/strings">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="model/instance/strings1/strings1">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th class="w50">Numbers 1</th>
              <th class="w50">Numbers 2</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <xsl:for-each select="model/instance/numbers1/numbers1">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="model/instance/numbers2/numbers2">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th class="w50">Booleans</th>
              <th class="w50">Times</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <xsl:for-each select="model/instance/booleans/booleans">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="model/instance/times/times">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th>Stacked Queries</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <xsl:for-each select="model/instance/stacked.queries/stacked.queries">
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
