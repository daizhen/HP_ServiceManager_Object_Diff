<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>

      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Menu: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
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
        <h1>Menu</h1>
        <table id="top">
          <tr>
            <td class="label">Menu Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
            </td>
            <td class="label">Format:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/format.name"/>
            </td>
          </tr>
        </table>
        <p/>
        <p/>
        <table class="draggable sortable resizable">
          <tr>
            <th>Option #</th>
            <th>Group</th>
            <th>Description</th>
            <th>Command</th>
            <th>Application</th>
            <th>Parameter Name</th>
            <th>Parameter Value</th>
            <th>Thread</th>
            <th>Condition</th>
          </tr>
          <xsl:for-each select="model/instance/option/option">
            <xsl:variable name="rowNum" select="position()"/>
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../group/group[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../description/description[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../command/command[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../application/application[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../pname/pname[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../pvalue/pvalue[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../thread/thread[$rowNum]"/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../condition/condition[$rowNum]"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <p/>
        <table id="sysmod">
          <tr>
            <td>SysModUser</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/>
            </td>
          </tr>
          <tr>
            <td>SysModTime</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/>
            </td>
          </tr>
          <tr>
            <td>SysModCount</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodcount"/>
            </td>
          </tr>
        </table>
      </body>

    </html>
  </xsl:template>
</xsl:stylesheet>
