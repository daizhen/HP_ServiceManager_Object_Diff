<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Global List: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>Global List</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">List Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
              <td class="label">Times Updated</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/times.updated"/>
              </td>
            </tr>
            <tr>
              <td class="label">Regen Every</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/regen.time"/>
              </td>
              <td class="label">Expiration</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/expiration"/>
              </td>
            </tr>
            <tr>
              <td class="label">Build List on Startup?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/build.startup"/>
              </td>
              <td class="label">Guard Against Duplicates?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/guard.dups"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <td class="label">List Variable</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/list.variable"/>
              </td>
            </tr>
            <tr>
              <td class="label">Display Variable</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/display.variable"/>
              </td>
            </tr>
            <tr>
              <td class="label">List Field</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/list.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Display Field</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/display.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Filename</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/filename"/>
              </td>
            </tr>
            <tr>
              <td class="label">Limiting SQL</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/sql"/>
              </td>
            </tr>
            <tr>
              <td class="label">Sort By</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/sort.field"/>
              </td>
            </tr>
            <tr>
              <td class="label">Application</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/application"/>
              </td>
            </tr>
            <tr>
              <td class="label">Server App</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/server.application"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <td class="label">Use Localized Values?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/localize.values"/>
              </td>
            </tr>
            <tr>
              <td class="label">User Defined List?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/user.defined"/>
              </td>
            </tr>
            <tr>
              <td class="label">Use Localized List?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/use.scmessage"/>
              </td>
            </tr>
            <tr>
              <td class="label">Value List</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/value.list"/>
              </td>
            </tr>
            <tr>
              <td class="label">Display List</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/display.list"/>
              </td>
            </tr>
            <tr>
              <td class="label">SM message list</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="/model/instance/message.list"/>
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
