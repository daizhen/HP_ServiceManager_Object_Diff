<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Join Definition:: <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <link rel="stylesheet" type="text/css" href="./{model/@name}.css"/>
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
        <h1>joindefs</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Join Table Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/join.name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th class="w50">File Name</th>
              <th class="w50">Site</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/join.tables/join.tables">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="table.name"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="table.site"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <table class="draggable sortable resizable">
          <thead>
            <tr>
              <th>Table Name</th>
              <th>Field Names</th>
              <th>Field Captions</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/field.table.name/field.table.name">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../field.names/field.names[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../field.captions/field.captions[$rowNum]"/>
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
