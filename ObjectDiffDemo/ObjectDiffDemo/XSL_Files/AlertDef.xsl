<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8"/>
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@uniquequery}"/>
        <title>
          Alert Definition: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>
          Alert Definition - <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
        </h1>
        <h2>
          Alert Name: <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
        </h2>
        <table>
          <tbody>
            <tr>
              <th>Description</th>
            </tr>
            <tr>
              <td>
                <xsl:for-each select="model/instance/description/description">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </xsl:for-each>
              </td>
            </tr>
          </tbody>
        </table>
        <h3>Scheduling</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">Special Alert Type:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.type"/>
              </td>
            </tr>
            <tr>
              <td class="label">Alert Status:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.status"/>
              </td>
            </tr>
            <tr>
              <td class="label">Schedule Condition:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sched.condition"/>
              </td>
            </tr>
            <tr>
              <td class="label">Schedule Class:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/sched.class"/>
              </td>
            </tr>
            <tr>
              <td class="label">Alert Condition:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.condition"/>
              </td>
            </tr>
            <tr>
              <td class="label">Calculation Type:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/calc.type"/>
              </td>
            </tr>
            <tr>
              <td class="label">Calc Field:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/calc.time.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Calc Interval:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/calc.interval"/>
              </td>
            </tr>
            <tr>
              <td class="label">Calc Expression:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/calc.expression"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>Update Info</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">Notification Only (no update)</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/skip.update"/>
              </td>
            </tr>
            <tr>
              <td class="label">Turn Off Triggers</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/triggers.off"/>
              </td>
            </tr>
            <tr>
              <td class="label">Format Control:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/format.control"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <th>Statements</th>
            </tr>
            <xsl:for-each select="model/instance/statements/statements">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
              </tr>
            </xsl:for-each>
            <tr>
              <td/>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <td class="label">Update Process:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/update.process"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <th>Notifications</th>
            </tr>
            <xsl:for-each select="model/instance/notifications/notifications">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
              </tr>
            </xsl:for-each>
            <tr>
              <td/>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>Work Schedule</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">Work Schedule Type</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/duty.table.type"/>
              </td>
            </tr>
            <tr>
              <td class="label">Table Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/duty.table"/>
              </td>
            </tr>
            <tr>
              <td class="label">Unique field name in table</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/duty.table.group.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Field name in record to query with</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/duty.table.match.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Field name containing work schedule value</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/duty.table.field"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>Time Zone</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">Time Zone Type</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/time.zone.type"/>
              </td>
            </tr>
            <tr>
              <td class="label">Time Zone</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/time.zone"/>
              </td>
            </tr>
            <tr>
              <td class="label">Unique field name in table</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/tz.table.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Field name in record to query with</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/tz.table.match.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Field name containing time zone value</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/tz.table.tzfield"/>
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
