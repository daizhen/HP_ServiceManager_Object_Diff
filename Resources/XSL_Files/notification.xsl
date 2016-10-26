<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Notification: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
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
        <h1>Notification Definition</h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
              </td>
            </tr>
            <tr>
              <td class="label">ID</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/id"/>
              </td>
            </tr>
            <tr>
              <td class="label">Condition</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/condition"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h4>Message</h4>
        <table class="draggable sortable resizable">
          <tbody>
            <tr>
              <th>Msg Class</th>
              <th>Msg No.</th>
              <th>Arguments</th>
              <th>Condition</th>
              <th>Format</th>
              <th>Notify Method</th>
              <th>Recipient(s)</th>
              <th>Group File</th>
              <th>Group Area</th>
              <th>Subgroup</th>
            </tr>
            <xsl:for-each select="model/instance/message/message">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="scmessage.class"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="scmessage.no"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="arguments"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="msg.condition"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="format"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="msgclass"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="recipient"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="group.file"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="group.area"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="/subgroup"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <h4>Email/Mail Subject Line</h4>
        <table class="draggable sortable resizable">
          <thead>
            <tr>
              <th>Msg Class</th>
              <th>Msg No.</th>
              <th>Arguments</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/message/message">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="subject.class"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="subject.no"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="subject.args/subject.args"/>
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
