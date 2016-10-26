<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/">
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Wizard: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h3>Wizard Information</h3>
        <p/>
        <table>
          <tr>
            <td class="label">Wizard Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>
            </td>
          </tr>
          <tr>
            <td class="label">Start Node?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/start"/>
            </td>
          </tr>
          <tr>
            <td class="label">Brief Description:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/brief.description"/>
            </td>
          </tr>
          <tr>
            <td class="label">Window Title:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/window.title"/>
            </td>
          </tr>
          <tr>
            <td class="label">Title:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/title"/>
            </td>
          </tr>
          <tr>
            <td class="label">Prompt:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/prompt"/>
            </td>
          </tr>
          <tr>
            <td class="label">Bitmap:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/bitmap"/>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <th>Global Lists</th>
          </tr>
          <xsl:for-each select="model/instance/global.lists/global.lists" >
            <xsl:variable name="rowNum" select="position()" />
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <p>File Selection:</p>
        <table>
          <tr>
            <th>Initial Expressions</th>
          </tr>
          <xsl:for-each select="model/instance/init.expressions/init.expressions" >
            <xsl:variable name="rowNum" select="position()" />
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
            <th>Javascript</th>
          </tr>
          <xsl:for-each select="model/instance/javascript.init/javascript.init" >
            <xsl:variable name="rowNum" select="position()" />
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <p>Select $L.file by </p>
        <xsl:variable name="filetype" select="model/instance/file.selection" />
        <xsl:if test="contains($filetype,'none')">
          <p>No $L.file (use typecheck)</p>
        </xsl:if>
        <xsl:if test="contains($filetype,'passed')">
          <p>$L.file passed in</p>
        </xsl:if>
        <xsl:if test="contains($filetype,'create')">
          <p>
            Create a record of type <xsl:value-of  disable-output-escaping="yes" select="model/instance/create.record.filename"/>
          </p>
        </xsl:if>
        <xsl:if test="contains($filetype,'select')">
          <p>
            Select records of type <xsl:value-of  disable-output-escaping="yes" select="model/instance/select.record.filename"/>
          </p>
          <p>
            using query <xsl:value-of  disable-output-escaping="yes" select="model/instance/select.query"/>
          </p>
          <p>
            No Records Message: <xsl:value-of  disable-output-escaping="yes" select="model/instance/select.no.records"/>
          </p>
        </xsl:if>
        <p/>
        <p>Usage</p>
        <p>Wizard Usage</p>
        <xsl:variable name="wizardtype" select="model/instance/wizard.type" />
        <xsl:if test="$wizardtype = 'select.one'">
          <p>Select one record from list</p>
        </xsl:if>
        <xsl:if test="$wizardtype = 'input'">
          <p>Request user input</p>
        </xsl:if>
        <xsl:if test="$wizardtype = 'skip'">
          <p>Skip display</p>
        </xsl:if>
        <xsl:if test="$wizardtype = 'select.many'">
          <p>Select multiple records from list</p>
        </xsl:if>
        <xsl:if test="$wizardtype = 'select.one' or $wizardtype = 'select.many'">
          <table>
            <tr>
              <td>Selection Criteria</td>
            </tr>
            <tr>
              <td class="label">Use $L.file as $L.selection?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/use.file.as.selection"/>
              </td>
            </tr>
            <tr>
              <td class="label">Query for records?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/query.for.records"/>
              </td>
            </tr>
            <tr>
              <td class="label">of type</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/query.for.records.filename"/>
              </td>
            </tr>
            <tr>
              <td class="label">using query</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/query.for.records.query"/>
              </td>
            </tr>
            <tr>
              <td class="label">sort by</td>
              <td>
                <xsl:for-each select="model/instance/query.for.records.sort/query.for.records.sort">
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
            <tr>
              <td class="label">If no records</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/query.select.no.records"/>
              </td>
            </tr>
            <tr>
              <td class="label">No records message</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/query.no.records.msg"/>
              </td>
            </tr>
            <tr>
              <td class="label">If one record</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/query.select.one.record"/>
              </td>
            </tr>
            <tr>
              <td class="label">Allow "Skip" option?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/allow.skip"/>
              </td>
            </tr>
            <tr>
              <td>Multiple selection field</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/mult.field.name"/>
              </td>
            </tr>
          </table>
        </xsl:if>
        <p/>
        <table>
          <tr>
            <td class="label">Subformat to display</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sub.format"/>
            </td>
          </tr>
          <tr>
            <td class="label">Main Format</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/formName"/>
            </td>
          </tr>
          <tr>
            <td class="label">Display screen</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/display.screen"/>
            </td>
          </tr>
          <tr>
            <td class="label">Activate "Finish" option?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/allow.finish"/>
            </td>
          </tr>
          <tr>
            <td class="label">Turn off Next and Previous buttons?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/disable.next.previous"/>
            </td>
          </tr>
          <tr>
            <td class="label">Turn off Next button only?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/disable.next"/>
            </td>
          </tr>
          <tr>
            <td class="label">Turn off Previous button only?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/disable.previous"/>
            </td>
          </tr>
          <tr>
            <td class="label">Use Conditional Previous Exits?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/previous.cond"/>
            </td>
          </tr>
          <tr>
            <td class="label">Never prompt on cancel?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/noPromptOnCancel"/>
            </td>
          </tr>
        </table>
        <p/>
        <p>Actions</p>
        <table>
          <tr>
            <td class="label">Initial Process</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/initial.process"/>
            </td>
          </tr>
          <tr>
            <td class="label">Perform Actions On</td>
            <xsl:variable name="performon" select="model/instance/perform.action.on"/>
            <xsl:if test="$performon = 'file'">
              <td>Current file ($L.file)</td>
            </xsl:if>
            <xsl:if test="$performon = 'selection'">
              <td>Selections ($L.selection)</td>
            </xsl:if>
          </tr>
        </table>
        <p/>
        <p>Actions to Perform</p>
        <table>
          <tr>
            <td class="label">Expressions</td>
          </tr>
          <xsl:for-each select="model/instance/expressions/expressions">
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
            <th>Javascript</th>
          </tr>
          <tr>
            <xsl:variable name="eol" select=" '
' " />
            <td>
              <!--
								<xsl:call-template name="search-and-replace">
									<xsl:with-param name="input" select="model/instance/javascript.actions" />
									<xsl:with-param name="search-string" select="$eol"/>
									<xsl:with-param name="replace-string" select=" x "/>
								</xsl:call-template>
-->
              <pre>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript.actions"/>
              </pre>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">Format Control</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/format.control"/>
            </td>
          </tr>
          <tr>
            <td class="label">of type</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/format.control.type"/>
            </td>
          </tr>
          <tr>
            <td class="label">on bad validation</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/bad.validation.action"/>
            </td>
          </tr>
          <tr>
            <td class="label">Process Name</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/process.name"/>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">Reset Current File to Selections?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/reset.to.selections"/>
            </td>
          </tr>
          <tr>
            <td class="label">Restart panel if</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/restart.condition"/>
            </td>
          </tr>
          <tr>
            <td class="label">Display Record(s) when complete?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/display.when.complete"/>
            </td>
          </tr>
          <tr>
            <td class="label">Display Mode</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/display.mode"/>
            </td>
          </tr>
          <tr>
            <td class="label">Return current file to calling application?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/reset.current.file"/>
            </td>
          </tr>
        </table>
        <p/>
        <p>Messages When Complete</p>
        <table>
          <tr>
            <th>Message</th>
            <th>Condition</th>
            <th>Type</th>
            <th>Level</th>
          </tr>
          <xsl:for-each select="model/instance/message/message">
            <xsl:variable name="rowNum" select="position()" />
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="."/>
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../message.cond/message.cond[$rowNum]" />
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../message.type/message.type[$rowNum]" />
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../message.level/message.level[$rowNum]" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <table>
          <tr>
            <th>Wizard Variables</th>
          </tr>
          <xsl:for-each select="model/instance/wizard.variables/wizard.variables">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="." />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <p>Next Wizard</p>
        <table>
          <tr>
            <th>Wizard Name</th>
            <th>Condition</th>
          </tr>
          <xsl:for-each select="model/instance/next.wizard/next.wizard">
            <xsl:variable name="rowNum" select="position()" />
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="." />
              </td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="../../next.wizard.cond/next.wizard.cond[$rowNum]" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <table>
          <tr>
            <th>Comments</th>
          </tr>
          <xsl:for-each select="model/instance/comments/comments">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="." />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <p>Cancel Expressions</p>
        <table>
          <tr>
            <th>Expressions Executed on Cancel</th>
          </tr>
          <xsl:for-each select="model/instance/cancel.expressions/cancel.expressions">
            <tr>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="." />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p/>
        <table>
          <tr>
            <th>Javascript Executed on Cancel</th>
          </tr>
          <tr>
            <xsl:variable name="eol" select=" '
' " />
            <td>
              <!--
								<xsl:call-template name="search-and-replace">
									<xsl:with-param name="input" select="model/instance/javascript.cancel" />
									<xsl:with-param name="search-string" select="$eol"/>
									<xsl:with-param name="replace-string" select=" x "/>
								</xsl:call-template>
-->
              <pre>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/javascript.cancel"/>
              </pre>
            </td>
          </tr>
        </table>
        <p/>
        <table>
          <tr>
            <td class="label">SysModTime</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmodtime"/>
            </td>
          </tr>
          <tr>
            <td class="label">SysModUser</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sysmoduser"/>
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
        <pre>
          <xsl:value-of  disable-output-escaping="yes" select="substring-before($input,$search-string)"/>
          <xsl:value-of  disable-output-escaping="yes" select="$replace-string"/>
        </pre>
        <xsl:call-template name="search-and-replace">
          <xsl:with-param name="input" select="substring-after($input,$search-string)"/>
          <xsl:with-param name="search-string" select="$search-string"/>
          <xsl:with-param name="replace-string" select="$replace-string"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <!-- There are no more occurrences of the search string so just return the current input string -->
        <p>
          <xsl:value-of  disable-output-escaping="yes" select="$input"/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>
