<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          External Access Definition: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <script src="js/dragtable.js"></script>
        <script src="js/sorttable.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/colResizable-1.3.min.js"></script>
        <script type="text/javascript">
          $(function(){
          $(".resizable").colResizable();
          });
        </script>
      </head>
      <body class="{model/@name}">
        <h1>External Access Definition</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Service Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/service.name"/>
              </td>
              <td class="label">Released?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/released"/>
              </td>
            </tr>
            <tr>
              <td class="label">Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
              <td class="label">Deprecated?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/deprecated"/>
              </td>
            </tr>
            <tr>
              <td class="label">Object Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/object.name"/>
              </td>
              <td> </td>
              <td> </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th>Allowed Actions</th>
              <th>Action Names</th>
              <th>Action Type</th>
              <th>Custom Action to Perform</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/allowed.actions/allowed.actions">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../action.names/action.names[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../action.type/action.type[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../execute.actions/execute.actions[$rowNum]"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th>Expressions</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/expressions/expressions">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <table class="draggable sortable resizable">
          <thead>
            <tr>
              <th>Field</th>
              <th>Caption</th>
              <th>Type</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/soafield/soafield">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../soacaption/soacaption[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../soatype/soatype[$rowNum]"/>
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
