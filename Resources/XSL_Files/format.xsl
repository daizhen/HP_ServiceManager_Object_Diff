﻿<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">  <xsl:output method="html" doctype-system="about:legacy" encoding="UTF-8" />  <xsl:template match="/" >    <html>      <head>        <meta name="description" content="{model/@name} {model/instance/@recordid}"/>        <title>          Format: <xsl:value-of  disable-output-escaping="yes" select="model/instance/@recordid"/>        </title>        <link rel="stylesheet" type="text/css" href="../XSL_Files/default.css"/>        <link rel="stylesheet" type="text/css" href="./{model/@name}.css"/>      </head>      <body class="{model/@name}">        <h1>          Format Detail - <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>        </h1>        <table>          <tr>            <td class="label">Format Name:</td>            <td>              <xsl:value-of  disable-output-escaping="yes" select="model/instance/name"/>            </td>            <td class="label">Last Update:</td>            <td>              <xsl:value-of  disable-output-escaping="yes" select="model/instance/last.update"/>            </td>          </tr>          <tr>            <td class="label">File Name:</td>            <td>              <xsl:value-of  disable-output-escaping="yes" select="model/instance/file.name"/>            </td>            <td class="label">Editor:</td>            <td>              <xsl:value-of  disable-output-escaping="yes" select="model/instance/editor"/>            </td>          </tr>          <tr>            <td class="label">Description:</td>            <td>              <xsl:value-of  disable-output-escaping="yes" select="model/instance/description"/>            </td>            <td></td>            <td></td>          </tr>        </table>        <p/>        <xsl:for-each select="model/instance/field/field">          <table>            <tr>              <th>                <xsl:value-of  disable-output-escaping="yes" select="property"/>              </th>            </tr>            <tr>              <td>                <xsl:call-template name="tokenize">                  <xsl:with-param name="junk" select="substring-after(property, ';')"/>                  <xsl:with-param name="delimiters" select="'	'"/>                </xsl:call-template>              </td>            </tr>          </table>          <p/>        </xsl:for-each>      </body>    </html>  </xsl:template>  <!-- These tokenize templates are copied from XSLT Cookbook, Second Edition by Sal Mangano. Copyright 2006 O'Reilly Media, Inc., 0-596-00974-7 -->  <xsl:template name="tokenize">    <xsl:param name="junk"/>    <xsl:param name="delimiters"/>    <xsl:choose>      <!-- Nothing to do if empty string -->      <xsl:when test="not($junk)" />      <!-- No delimiters signals character level tokenization. -->      <xsl:when test="not($delimiters)" >        <xsl:call-template name="_tokenize-characters">          <xsl:with-param name="junk" select="$junk" />        </xsl:call-template>      </xsl:when>      <xsl:otherwise>        <xsl:call-template name="_tokenize-delimiters">          <xsl:with-param name="junk" select="$junk" />          <xsl:with-param name="delimiters" select="$delimiters" />        </xsl:call-template>      </xsl:otherwise>    </xsl:choose>  </xsl:template>  <xsl:template name="_tokenize-characters">    <xsl:param name="junk" />    <xsl:if test="$junk">      <token>        <xsl:value-of  disable-output-escaping="yes" select="substring($junk, 1, 1)" />      </token>      <xsl:call-template name="_tokenize-characters">        <xsl:with-param name="junk" select="substring($junk, 2)" />      </xsl:call-template>    </xsl:if>  </xsl:template>  <xsl:template name="_tokenize-delimiters">    <xsl:param name="junk" />    <xsl:param name="delimiters" />    <!-- Extract a delimiter -->    <xsl:variable name="delimiter" select="substring($delimiters, 1, 1)" />    <xsl:choose>      <!-- if the delimiter is empty we have a token -->      <xsl:when test="not($delimiter)" >        <!--token><xsl:value-of  disable-output-escaping="yes" select="$junk"/></token-->        <xsl:value-of  disable-output-escaping="yes" select="$junk"/>        <br/>      </xsl:when>      <!-- If the string contains at least one delimiter we must split it -->      <xsl:when test="contains($junk, $delimiter)">        <!-- If it starts with the delimiter we don't need to handle the -->        <!-- before part -->        <xsl:if test="not(starts-with($junk, $delimiter))">          <!-- Handle the part that comes before the current delimiter -->          <!-- with the next delimiter.  If there is no next the first test -->          <!-- in this template will detect the token -->          <xsl:call-template name="_tokenize-delimiters">            <xsl:with-param name="junk" select="substring-before($junk, $delimiter)" />            <xsl:with-param name="delimiters" select="substring($delimiters, 2)" />          </xsl:call-template>        </xsl:if>        <!-- Handle the part that comes after the delimiter using the -->        <!-- current delimiter -->        <xsl:call-template name="_tokenize-delimiters" >          <xsl:with-param name="junk" select="substring-after($junk, $delimiter)" />          <xsl:with-param name="delimiters" select="$delimiters" />        </xsl:call-template>      </xsl:when>      <!--xsl:otherwise-->      <!-- No occurrences of current deliniter so move on to next -->      <!--xsl:call-template name="_tokenize-delimiters">    				<xsl:with-param name="junk" select="$junk" />    				<xsl:with-param name="delimiters" select="substring($delimiters, 2)" />    			</xsl:call-template>    		</xsl:otherwise-->    </xsl:choose>  </xsl:template></xsl:stylesheet>