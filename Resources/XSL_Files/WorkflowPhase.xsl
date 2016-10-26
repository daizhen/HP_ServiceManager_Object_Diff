<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />
  <xsl:template match="/" >
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Workflow Phase: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1>
          Workflow Phase - <xsl:value-of  disable-output-escaping="yes" select="model/instance/phaseName"/>
        </h1>
        <table>
          <tbody>
            <tr>
              <td class="label">Phase Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/phaseName"/>
              </td>
            </tr>
            <tr>
              <td class="label">Table Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/tableName"/>
              </td>
            </tr>
            <tr>
              <td class="label">Workflow Name</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/workflowName"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>General</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">Display Form</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/displayForm"/>
              </td>
              <td class="label">Active?</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/active"/>
              </td>
            </tr>
            <tr>
              <td class="label">Description</td>
              <td colspan="3">
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/description"/>
              </td>
            </tr>
            <tr>
              <td class="label">Details</td>
              <td colspan="3">
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/detailedDescription"/>
              </td>
            </tr>
            <tr>
              <td class="label">Update Condition</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/updateCond"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>Rules</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">On Create</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/onCreateRules/onCreateRules">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
            <tr>
              <td class="label">On Exit</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/onDeleteRules/onDeleteRules">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
            <tr>
              <td class="label">Initialization</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/initRules/initRules">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
            <tr>
              <td class="label">On Display</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/onDisplayRules/onDisplayRules">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
            <tr>
              <td class="label">On Update</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/onUpdateRules/onUpdateRules">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
            <tr>
              <td class="label">After Update</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/afterUpdateRules/afterUpdateRules">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>Transitions</h3>
        <p/>
        <table>
          <tbody>
            <tr>
              <td class="label">Default Transition</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/defaultTransition"/>
              </td>
              <td class="label">Default Rules</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/defaultTransitionRule"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>To Phase</th>
              <th>Option Name</th>
              <th>Option Location</th>
              <th>Option #</th>
              <th>Condition</th>
              <th>Rules</th>
              <th>X</th>
              <th>Y</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/manualTransition/manualTransition">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtId"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtToPhase"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtOptionName"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtOptionLoc"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtOption"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtCondition"/>
                </td>
                <td>
                  <ul>
                    <xsl:for-each select="./mtRules/mtRules">
                      <li>
                        <xsl:value-of  disable-output-escaping="yes" select="."/>
                        <br/>
                      </li>
                    </xsl:for-each>
                  </ul>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtxCoordinate"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./mtyCoordinate"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <table>
          <thead>
            <tr>
              <th>To Phase</th>
              <th>Condition</th>
              <th>Rules</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/autoTransition/autoTransition">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./atToPhase"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./atCondition"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./atRules"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <h3>Actions</h3>
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Location</th>
              <th>Option</th>
              <th>Lock</th>
              <th>Msg Id</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="model/instance/action/action">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./actionId"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./actionName"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./actionLoc"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./actionOption"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./actionLock"/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="./actionMsgId"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <p/>
        <h3>Approvals</h3>
        <p/>
        <table class="appvlset">
          <tbody>
            <tr>
              <th>Reset Condition</th>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/approvalsReset"/>
              </td>
            </tr>
            <tr>
              <th>Recalculate Condition</th>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/approvalsRecalc"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <td class="label">Approval Definitions</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/approvals/approvals">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <h3>Alerts</h3>
        <p/>
        <table class="alertset">
          <tbody>
            <tr>
              <th>Reset Condition</th>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/alertsReset"/>
              </td>
            </tr>
            <tr>
              <th>Recalculate Condition</th>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/alertsRecalc"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p/>
        <table>
          <tbody>
            <tr>
              <td class="label">Alert Definitions</td>
              <td>
                <ul>
                  <xsl:for-each select="model/instance/alerts/alerts">
                    <li>
                      <xsl:value-of  disable-output-escaping="yes" select="."/>
                      <br/>
                    </li>
                  </xsl:for-each>
                </ul>
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
