<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>
        <title>
          Object: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>
      </head>
      <body class="{model/@name}">
        <h1 id="banner">Object Definition</h1>
        <h1>
          File Name:
          <xsl:value-of  disable-output-escaping="yes" select="model/instance/file.name"/>
        </h1>
        <h2>
          Common Name:
          <xsl:value-of  disable-output-escaping="yes" select="model/instance/common.name"/>
        </h2>
        <table>
          <tbody>
            <tr>
              <th>Unique Field(s)</th>
            </tr>
            <xsl:for-each select="model/instance/unique.field/unique.field">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
              </tr>
            </xsl:for-each>
            <xsl:if test="count(model/instance/unique.field/unique.field)=0">
              <tr>
                <td>
                  <br/>
                </td>
              </tr>
            </xsl:if>
          </tbody>
        </table>
        <h3>Object Info</h3>
        <p>
          Description:
          <xsl:value-of  disable-output-escaping="yes" select="model/instance/desc.field"/>
        </p>
        <p>&#160;</p>
        <table>
          <tbody>
            <tr>
              <td class="label">Profile Application:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/profile.appl"/>
              </td>
              <td char="label">Category File Name:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/category.file.name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Profile Variable:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/profile.variable"/>
              </td>
              <td class="label">Phase File Name:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/phase.file.name"/>
              </td>
            </tr>
            <tr>
              <td class="label">Number Record Name:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/number.record"/>
              </td>
              <td class="label">Master Format Control:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/master.fc"/>
              </td>
            </tr>
            <tr>
              <td class="label">Paging File:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/paging.file"/>
              </td>
              <td class="label">Joindef:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/joindef"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p>&#160;</p>
        <table>
          <tbody>
            <tr>
              <td class="label">Open State:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/open.state"/>
              </td>
            </tr>
            <tr>
              <td class="label">Close State:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/close.state"/>
              </td>
            </tr>
            <tr>
              <td class="label">List State:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/list.state"/>
              </td>
            </tr>
            <tr>
              <td class="label">Default State:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/default.state"/>
              </td>
            </tr>
            <tr>
              <td class="label">Search State:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/search.state"/>
              </td>
            </tr>
            <tr>
              <td class="label">Browse State:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/browse.state"/>
              </td>
            </tr>
          </tbody>
        </table>
        <table>
          <tbody>
            <tr>
              <th>Manual States</th>
            </tr>
            <xsl:for-each select="model/instance/manual.states/manual.states">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
              </tr>
            </xsl:for-each>
            <xsl:if test="count(model/instance/manual.states/manual.states)=0">
              <tr>
                <td>
                  <br/>
                </td>
              </tr>
            </xsl:if>
          </tbody>
        </table>
        <p>&#160;</p>
        <h3>Locking</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">Use Locking:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/use.locking"/>
              </td>
            </tr>
            <tr>
              <td class="label">Lock On Display:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/lock.on.display"/>
              </td>
            </tr>
            <tr>
              <td class="label">Lock Parent Record:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/lock.parent"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p>&#160;</p>
        <table>
          <tbody>
            <tr>
              <th>Parent ID Field</th>
              <th>Parent Filename/Object</th>
            </tr>
            <xsl:for-each select="model/instance/parent.id/parent.id">
              <xsl:variable name="rowNum" select="position()"/>
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="../../parent.object/parent.object[$rowNum]"/>
                </td>
              </tr>
            </xsl:for-each>
            <xsl:if test="count(model/instance/parent.id/parent.id)=0">
              <tr>
                <td>
                  <br/>
                </td>
                <td>
                  <br/>
                </td>
              </tr>
            </xsl:if>
          </tbody>
        </table>
        <p>&#160;</p>
        <table>
          <tbody>
            <tr>
              <th>Watch Variable Names</th>
            </tr>
            <xsl:for-each select="model/instance/watch.variables/watch.variables">
              <tr>
                <td>
                  <xsl:value-of  disable-output-escaping="yes" select="."/>
                </td>
              </tr>
            </xsl:for-each>
            <xsl:if test="count(model/instance/watch.variables/watch.variables)=0">
              <tr>
                <td>
                  <br/>
                </td>
              </tr>
            </xsl:if>
          </tbody>
        </table>
        <h3>Revisions</h3>
        <table>
          <tbody>
            <tr>
              <td class="label">Revision File Name:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/revision.file"/>
              </td>
            </tr>
            <tr>
              <td class="label">Max # of Revisions:</td>
              <td>
                <xsl:value-of  disable-output-escaping="yes" select="model/instance/max.revisions"/>
              </td>
            </tr>
          </tbody>
        </table>
        <p>&#160;</p>
        <table>
          <tbody>
            <tr>
              <td vAlign="top">
                <table>
                  <tbody>
                    <tr>
                      <th>Local Variables</th>
                    </tr>
                    <xsl:for-each select="model/instance/local.variables/local.variables">
                      <tr>
                        <td>
                          <xsl:value-of  disable-output-escaping="yes" select="."/>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <xsl:if test="count(model/instance/local.variables/local.variables)=0">
                      <tr>
                        <td>
                          <br/>
                        </td>
                      </tr>
                    </xsl:if>
                  </tbody>
                </table>
              </td>
              <td>
                <table>
                  <tbody>
                    <tr>
                      <th>Global Lists</th>
                    </tr>
                    <xsl:for-each select="model/instance/global.lists/global.lists">
                      <tr>
                        <td>
                          <xsl:value-of  disable-output-escaping="yes" select="."/>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <xsl:if test="count(model/instance/global.lists/global/lists)=0">
                      <tr>
                        <td>
                          <br/>
                        </td>
                      </tr>
                    </xsl:if>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
        <h3>Activities</h3>
        <table>
          <tr>
            <td class="label">Activity Log Table:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/activitylog.file.name"/>
            </td>
          </tr>
          <tr>
            <td class="label">Selection List Variable:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/activity.selection.var"/>
            </td>
          </tr>
          <tr>
            <td class="label">Posting Link:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/activity.post.link"/>
            </td>
          </tr>
          <tr>
            <td class="label">Require update if an activity record is NOT generated?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/activity.mandatory"/>
            </td>
          </tr>
          <tr>
            <td class="label">Update Field:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/update.field.var"/>
            </td>
          </tr>
          <tr>
            <td class="label">Display Message:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/activity.mandatory.msg"/>
            </td>
          </tr>
        </table>
        <h3>Alerts</h3>
        <table>
          <tr>
            <td class="label">Alert Location:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.location"/>
            </td>
          </tr>
          <tr>
            <td class="label">Alert Condition:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.condition"/>
            </td>
          </tr>
          <tr>
            <td class="label">Alert Field Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.field.name"/>
            </td>
          </tr>
          <tr>
            <td class="label">Alert Status Field:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.status.field"/>
            </td>
          </tr>
          <tr>
            <td class="label">Alert Update Process:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.update.process"/>
            </td>
          </tr>
          <tr>
            <td class="label">Log Alerts?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/log.alerts"/>
            </td>
          </tr>
          <tr>
            <td class="label">Process Alerts on Parent?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alerts.against.parent"/>
            </td>
          </tr>
          <tr>
            <td class="label">Recalculate Alerts If:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.recalc"/>
            </td>
          </tr>
          <tr>
            <td class="label">Reset Alerts If:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/alert.reset"/>
            </td>
          </tr>
        </table>
        <h3>Approvals</h3>
        <table>
          <tr>
            <td class="label">Approval Condition:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.condition"/>
            </td>
          </tr>
          <tr>
            <td class="label">Approval Location:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.location"/>
            </td>
          </tr>
          <tr>
            <td class="label">Approval Field Name:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.field.name"/>
            </td>
          </tr>
          <tr>
            <td class="label">Approval Status Field:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.status.field"/>
            </td>
          </tr>
          <tr>
            <td class="label">Approval Groups:</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.groups"/>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <td class="label">Approval Type</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/appr.cond.type"/>
            </td>
            <td class="label">Approval Notification</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/single.notify.approval"/>
            </td>
          </tr>
          <tr>
            <td class="label">Approval FC</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/appr.fc"/>
            </td>
            <td class="label">Denial Notification</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/single.notify.denial"/>
            </td>
          </tr>
          <tr>
            <td class="label">Approval Process</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.process"/>
            </td>
            <td class="label">Retraction Notification</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/single.notify.retraction"/>
            </td>
          </tr>
          <tr>
            <td class="label">Denial Process</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/denial.process"/>
            </td>
            <td class="label">Final Approval Notification</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/final.notify.approval"/>
            </td>
          </tr>
          <tr>
            <td class="label">Preapprove on Open</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/preapprove.cond"/>
            </td>
            <td class="label">Final Denial Notification</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/final.notify.denial"/>
            </td>
          </tr>
          <tr>
            <td class="label">Log Approvals</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/log.approvals"/>
            </td>
            <td class="label">Require Appr. Comments</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.comments"/>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <td class="label">Recalulate Approvals If</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.recalc"/>
            </td>
          </tr>
          <tr>
            <td class="label">Reset Approvals If</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/approval.reset"/>
            </td>
          </tr>
        </table>
        <h3>SC Manage</h3>
        <table>
          <tr>
            <td class="label">SC Manage Condition</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.condition"/>
            </td>
          </tr>
          <tr>
            <td class="label">SC Manage Display Format</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/sc.manage.screen"/>
            </td>
          </tr>
          <tr>
            <td class="label">SC Manage Default Inbox</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.inbox"/>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <td class="label">SC Manage Default Query</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.query"/>
            </td>
            <td class="label">Default Query Description</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.query.name"/>
            </td>
          </tr>
          <tr>
            <td class="label">Thread Inbox -&gt; Search?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.thread.inbox.search"/>
            </td>
            <td class="label">Search Format</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.search.format"/>
            </td>
          </tr>
          <tr>
            <td class="label">Thread Search -&gt; List?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.thread.search.list"/>
            </td>
            <td class="label">Thread List -&gt; Edit?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.thread.list.edit"/>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <td class="label">Thread Inbox -&gt; Edit?</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.thread.inbox.edit"/>
            </td>
          </tr>
          <tr>
            <td class="label">Allow Add Condition</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.add.condition"/>
            </td>
          </tr>
          <tr>
            <td class="label">Add/Open Application</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/scm.add.appl"/>
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
              <xsl:for-each select="model/instance/scm.add.names/scm.add.names">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
              <xsl:if test="count(model/instance/scm.add.names/scm.add.names)=0">
                <br/>
              </xsl:if>
            </td>
            <td>
              <xsl:for-each select="model/instance/scm.add.values/scm.add.values">
                <xsl:value-of  disable-output-escaping="yes" select="."/>
                <br/>
              </xsl:for-each>
              <xsl:if test="count(model/instance/scm.add.values/scm.add.values)=0">
                <br/>
              </xsl:if>
            </td>
          </tr>
        </table>
        <h3>Inboxes</h3>
        <table>
          <tr>
            <td class="label">Can Create Personal Inboxes</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/personal.inbox"/>
            </td>
          </tr>
          <tr>
            <td class="label">Can Create Global Inboxes</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/global.inbox"/>
            </td>
          </tr>
        </table>
        <h3>Notifications</h3>
        <table>
          <tr>
            <td class="label">Add</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/notification.add"/>
            </td>
          </tr>
          <tr>
            <td class="label">Update</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/notification.update"/>
            </td>
          </tr>
          <tr>
            <td class="label">Delete</td>
            <td>
              <xsl:value-of  disable-output-escaping="yes" select="model/instance/notification.delete"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\AMGEN\Test\MCV-9002-Object-cm3r.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->
