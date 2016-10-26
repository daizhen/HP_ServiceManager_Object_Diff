<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Data Policy: <xsl:value-of select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <script src="js/dragtable.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/colResizable-1.3.min.js"></script>
        <script type="text/javascript">
          $(function(){
          $(".resizable").colResizable();
          });
        </script>
      </head>
      <body class="{model/@name}">
        <h1>Data Policy</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Name</td>
              <td>
                <xsl:value-of select="model/instance/name"/>
              </td>
            </tr>
            <tr>
              <td class="label">SQL Base Name</td>
              <td>
                <xsl:value-of select="model/instance/sqlbasename"/>
              </td>
            </tr>
            <tr>
              <td class="label">Unique Key</td>
              <td>
                <xsl:for-each select="model/instance/unique.key">
                  <p>
                    <xsl:value-of select="."/>
                  </p>
                </xsl:for-each>
              </td>
            </tr>
            <tr>
              <td class="label">Default Format</td>
              <td>
                <xsl:value-of select="model/instance/display.format"/>
              </td>
            </tr>
            <tr>
              <td class="label">Prohibit Defalut Access</td>
              <td>
                <xsl:value-of select="model/instance/block.default.access"/>
              </td>
            </tr>
            <tr>
              <td class="label">System Table?</td>
              <td>
                <xsl:value-of select="model/instance/system.table"/>
              </td>
            </tr>
            <tr>
              <td class="label">Description</td>
              <td>
                <xsl:for-each select="model/instance/description">
                  <p>
                    <xsl:value-of select="."/>
                  </p>
                </xsl:for-each>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table class="draggable resizable">
          <thead>
            <tr>
              <th>Field Name</th>
              <th>Caption</th>
              <th>Field Type</th>
              <th>Usage Type</th>
              <th>Available</th>
              <th>Invisible</th>
              <th>Read Only</th>
              <th>Encrypted</th>
              <th>System</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/fields/fields">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of select="."/>
                </td>
                <td>
                  <xsl:value-of select="../../captions/captions[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../fieldUsage/fieldUsage[$rowNum]"/>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="../../sysFieldType/sysFieldType[$rowNum]='1'">System</xsl:when>
                    <xsl:when test="../../sysFieldType/sysFieldType[$rowNum]='2'">Application</xsl:when>
                    <xsl:when test="../../sysFieldType/sysFieldType[$rowNum]='3'">Data</xsl:when>
                    <xsl:when test="../../sysFieldType/sysFieldType[$rowNum]='4'">Deprecated</xsl:when>
                  </xsl:choose>
                </td>
                <td>
                  <xsl:value-of select="../../avail/avail[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../invisible/invisible[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../readonly/readonly[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../encrypt/encrypt[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../system.fields/system.fields[$rowNum]"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <table class="draggable resizable">
          <thead>
            <tr>
              <th>Field Name</th>
              <th>Mandatory</th>
              <th>Default Value</th>
              <th>Global List</th>
              <th>Match Field</th>
              <th>Match File</th>
              <th>Validation</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/fields/fields">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of select="."/>
                </td>
                <td>
                  <xsl:value-of select="../../mandatory/mandatory[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../defaults/defaults[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../globallist/globallist[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../matchfields/matchfields[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../matchfiles/matchfiles[$rowNum]"/>
                </td>
                <td>
                  <xsl:value-of select="../../validations/validations[$rowNum]"/>
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
                <xsl:value-of select="model/instance/sysmoduser"/>
              </td>
            </tr>
            <tr>
              <th>SysModTime</th>
              <td>
                <xsl:value-of select="model/instance/sysmodtime"/>
              </td>
            </tr>
            <tr>
              <th>SysModCount</th>
              <td>
                <xsl:value-of select="model/instance/sysmodcount"/>
              </td>
            </tr>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
