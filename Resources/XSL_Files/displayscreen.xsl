<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <xsl:variable name="eol" select=" '
' " />
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Display Application Screen Definition: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
        <script language="javascript" type="text/javascript">
          function dolist()
          {
          document.getElementById("do-details").style.display = "none";
          document.getElementById("do-list").style.display = "block";
          document.getElementById("listbutton").style.display = "none";
          document.getElementById("hidebutton").style.display = "inline";
          document.getElementById("detailbutton").style.display = "inline";
          }
          function showdetails()
          {
          document.getElementById("do-details").style.display = "block";
          document.getElementById("do-list").style.display = "none";
          document.getElementById("hidebutton").style.display = "inline";
          document.getElementById("listbutton").style.display = "inline";
          document.getElementById("detailbutton").style.display = "none";
          }
          function hidedo()
          {
          document.getElementById("do-details").style.display = "none";
          document.getElementById("do-list").style.display = "none";
          document.getElementById("hidebutton").style.display = "none";
          document.getElementById("listbutton").style.display = "inline";
          document.getElementById("detailbutton").style.display = "inline";
          }
        </script>
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
      <body class="{model/@name}" onload="hidedo()">
        <h1>Display Application Screen Definition</h1>
        <h2>
          Screen ID: <xsl:value-of  disable-output-escaping="yes" select="model/instance/screen.id"/>
        </h2>
        <table>
          <tr>
            <td class="label">Title:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/title"/>
            </td>
            <td class="label">On option 0:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/on.enter.key"/>
            </td>
          </tr>
          <tr>
            <td class="label">Format:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/form"/>
            </td>
            <td class="label">Time (if FDISP):</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/time"/>
            </td>
          </tr>
          <tr>
            <td class="label">I/O (if RIO):</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/io"/>
            </td>
            <td class="label">User Options:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/user.options"/>
            </td>
          </tr>
          <tr>
            <td class="label">Used only for Search?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/search.only"/>
            </td>
            <td class="label">Language:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/language"/>
            </td>
          </tr>
        </table>
        <h3>Main</h3>
        <h4>Initializations</h4>
        <table>
          <tr>
            <th>Initialization Expressions (Once per call to display)</th>
          </tr>
          <xsl:for-each select="model/instance/initialization/expressions/expressions">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">Initial Message?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/initialization/message"/>
            </td>
          </tr>
          <tr>
            <td class="label">Text of msg:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/initialization/msg.condition"/>
            </td>
          </tr>
        </table>
        <h4>Window Options</h4>
        <table>
          <tr>
            <td class="label">Open Window?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/window.structure/open.window"/>
            </td>
          </tr>
          <tr>
            <td class="label">Parent Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/window.structure/parent.name"/>
            </td>
          </tr>
          <tr>
            <td class="label">Window Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/window.structure/window.name"/>
            </td>
          </tr>
          <tr>
            <td class="label">Position:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/window.structure/window.position"/>
            </td>
          </tr>
          <tr>
            <td class="label">Percentage:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/window.structure/window.percent"/>
            </td>
          </tr>
          <tr>
            <td class="label">OR # of Lines:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/window.structure/window.lines"/>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <th>JavaScript</th>
          </tr>
          <tr>
            <td>
              <xsl:call-template name="search-and-replace">
                <xsl:with-param name="input" select="model/instance/javascript"/>
                <xsl:with-param name="search-string" select="$eol"/>
                <xsl:with-param name="replace-string" select=" x "/>
              </xsl:call-template>
            </td>
          </tr>
          <xsl:if test="string-length(model/instance/javascript)=0">
            <tr>
              <td>
                <br/>
              </td>
            </tr>
          </xsl:if>
        </table>
        <p/>
        <input id="listbutton" type="button" value="Display Option List" onclick="dolist()"/>
        <input id="detailbutton" type="button" value="Display Option Details" onclick="showdetails()"/>
        <input id="hidebutton" type="button" value="Hide Display Options" onclick="hidedo()"/>
        <p/>
        <div id="do-list">
          <h3>Display Options</h3>
          <table class="draggable sortable resizable">
            <tr>
              <th>ID</th>
              <th>Option #</th>
              <th>Label</th>
              <th>Action</th>
              <th>Condition</th>
            </tr>
            <xsl:for-each select="model/instance/displayoption/instance">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="id"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="gui.option"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="labels/default"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="action"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="condition"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
        <div id="do-details">
          <xsl:for-each select="model/instance/displayoption/instance">
            <h3>Display Application Option Definition</h3>
            <table>
              <tr>
                <td class="label">Screen ID:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="screen.id"/>
                </td>
                <td class="label">Action:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="action"/>
                </td>
              </tr>
              <tr>
                <td class="label">Unique ID:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="id"/>
                </td>
                <td class="label">Modifies Record:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="modify.record"/>
                </td>
              </tr>
              <tr>
                <td class="label">GUI Option:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="gui.option"/>
                </td>
                <td class="label">Balloon Help (If Option&lt;200):</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="labels/balloon"/>
                </td>
              </tr>
              <tr>
                <td class="label">Text Option:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="txt.option"/>
                </td>
                <td class="label">Default Label:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="labels/default"/>
                </td>
              </tr>
              <tr>
                <td class="label">Bank:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="txt.bank"/>
                </td>
                <td class="label">Text Alternative:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="labels/txt.alternative"/>
                </td>
              </tr>
            </table>
            <p/>
            <table>
              <tr>
                <td class="label">Condition:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="condition"/>
                </td>
              </tr>
              <tr>
                <td class="label">User Condition:</td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="user.condition"/>
                </td>
              </tr>
            </table>
            <p/>
            <table>
              <tr>
                <th>Pre RAD Expressions</th>
              </tr>
              <xsl:for-each select="post.expressions/post.expressions">
                <tr>
                  <td>
                    <xsl:value-of  disable-output-escaping="yes" select="."/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:if test="count(post.expressions/post.expressions)=0">
                <tr>
                  <td>
                    <br/>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <p/>
            <table>
              <tr>
                <th>Pre JavaScript</th>
              </tr>
              <tr>
                <td>
                  <xsl:call-template name="search-and-replace">
                    <xsl:with-param name="input" select="javascript.pre"/>
                    <xsl:with-param name="search-string" select="$eol"/>
                    <xsl:with-param name="replace-string" select=" x "/>
                  </xsl:call-template>
                </td>
              </tr>
            </table>
            <p/>
            <table>
              <tr>
                <th>RAD Application:</th>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="rad/application"/>
                </td>
              </tr>
              <tr>
                <th>Separate Thread?</th>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="rad/new.thread"/>
                </td>
              </tr>
            </table>
            <table>
              <tr>
                <th>Names</th>
                <th>Values</th>
              </tr>
              <tr>
                <td>
                  <xsl:for-each select="rad/names/names">
                    <xsl:value-of  disable-output-escaping="yes" select="."/>
                    <br/>
                  </xsl:for-each>
                </td>
                <td>
                  <xsl:for-each select="rad/values/values">
                    <xsl:value-of  disable-output-escaping="yes" select="."/>
                    <br/>
                  </xsl:for-each>
                </td>
              </tr>
            </table>
            <p/>
            <table>
              <tr>
                <th>Post RAD Expressions</th>
              </tr>
              <xsl:for-each select="post.rad.expressions/post.rad.expressions">
                <tr>
                  <td>
                    <xsl:value-of  disable-output-escaping="yes" select="."/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:if test="count(post.rad.expressions/post.rad.expressions)=0">
                <tr>
                  <td>
                    <br/>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <p/>
            <table>
              <tr>
                <th>Post JavaScript</th>
              </tr>
              <tr>
                <td>
                  <xsl:call-template name="search-and-replace">
                    <xsl:with-param name="input" select="javascript.post"/>
                    <xsl:with-param name="search-string" select="$eol"/>
                    <xsl:with-param name="replace-string" select=" x "/>
                  </xsl:call-template>
                </td>
              </tr>
            </table>
            <p/>
            <hr/>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- The following template is from
    	XSLT Cookbok, Second Edition by Sal Mangano. Copyright 2006 O'Reilly Media, Inc.
    	-->
  <xsl:template name="search-and-replace">
    <xsl:param name="input"/>
    <xsl:param name="search-string"/>
    <xsl:param name="replace-string"/>
    <xsl:choose>
      <!-- See if the input contains the search string -->
      <xsl:when test="$search-string and contains($input,$search-string)">
        <!-- If so, then concatenate the substring before the search string 
    			to the replacement string and to the result of recursively applying 
    			this template to the remaining substring. -->
        <xsl:value-of  disable-output-escaping="yes" select="substring-before($input,$search-string)"/>
        <xsl:value-of  disable-output-escaping="yes" select="$replace-string"/>
        <br/>
        <xsl:call-template name="search-and-replace">
          <xsl:with-param name="input" select="substring-after($input,$search-string)"/>
          <xsl:with-param name="search-string" select="$search-string"/>
          <xsl:with-param name="replace-string" select="$replace-string"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <!-- There are no more occurrences of the search string so just return the current input string -->
        <xsl:value-of  disable-output-escaping="yes" select="$input"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
