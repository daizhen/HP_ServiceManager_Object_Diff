<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
        <title>
          State: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
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
        <h1>
          State: <xsl:value-of  disable-output-escaping="yes" select="model/instance/state" />
        </h1>
        <table class="statetop">
          <tr>
            <td class="label">State</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/state" />
            </td>
          </tr>
          <tr>
            <td class="label">Display Screen:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/display.screen" />
            </td>
          </tr>
          <tr>
            <td class="label">Initialization Process:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/init.process" />
            </td>
          </tr>
          <tr>
            <td class="label">Format:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/format.name" />
            </td>
          </tr>
          <tr>
            <td class="label">Input Condition:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/input.condition" />
            </td>
          </tr>
        </table>
        <p/>
        <h3>Non-base Methods</h3>
        <table class="draggable sortable resizable">
          <tr>
            <th class="c1">Display Action</th>
            <th class="c2">Process Name</th>
            <th class="c3">Condition</th>
            <th class="c4">Save First</th>
          </tr>
          <xsl:for-each select="model/instance/process.label/process.label" >
            <xsl:variable name="rowNum" select="position()" />
            <tr>
              <td class="c1">
                <xsl:value-of  disable-output-escaping="yes" select="." />
              </td>
              <td class="c2">
                <xsl:value-of  disable-output-escaping="yes" select="../../valid.process/valid.process[$rowNum]" />
              </td>
              <td class="c3">
                <xsl:value-of  disable-output-escaping="yes" select="../../process.condition/process.condition[$rowNum]" />
              </td>
              <td class="c4">
                <xsl:value-of  disable-output-escaping="yes" select="../../run.save.before/run.save.before[$rowNum]" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">SysModUser</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/>
            </td>
          </tr>
          <tr>
            <td class="label">SysModTime</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/>
            </td>
          </tr>
          <tr>
            <td class="label">SysModCount</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodcount"/>
            </td>
          </tr>
        </table>
      </body>

    </html>
  </xsl:template>
</xsl:stylesheet>
