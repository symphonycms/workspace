<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="page-title.xsl"/>
<xsl:import href="navigation.xsl"/>
<xsl:import href="date-time.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="is-logged-in" select="/data/logged-in-author/author"/>

<xsl:template match="/">

<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>
			<xsl:call-template name="page-title"/>
		</title>
		<link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/styles.css" />
		<link rel="alternate" type="application/rss+xml" href="{$root}/rss/" />
	</head>
	<body>
		<div id="masthead">
			<h1>
				<a href="{$root}"><xsl:value-of select="$website-name"/></a>
			</h1>
			<xsl:apply-templates select="data/navigation"/>
		</div>
		<div id="package">
			<p class="date">
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="$today"/>
					<xsl:with-param name="format" select="'d'"/>
				</xsl:call-template>
				<span>
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="$today"/>
						<xsl:with-param name="format" select="'m'"/>
					</xsl:call-template>
				</span>
			</p>
			<div id="content">
				<xsl:apply-templates/>
			</div>
		</div>
		<ul id="footer">
			<li>Orchestrated by <a class="symphony" href="http://getsymphony.com/">Symphony</a></li>
			<li>Broadcasted via <a class="rss" href="{$root}/rss/">XML Feed</a></li>
		</ul>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>
