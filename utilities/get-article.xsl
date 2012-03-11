<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="typography.xsl"/>
<xsl:import href="get-images.xsl"/>

<xsl:template match="homepage-articles/entry">
	<div class="article">
		<h3>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'D m Y'"/>
			</xsl:call-template>
			<xsl:if test="$is-logged-in">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{../section/@handle}/edit/{@id}/">Edit</a>
			</xsl:if>
		</h3>
		<h2>
			<a href="{$root}/articles/{title/@handle}/"><xsl:value-of select="title"/></a>
		</h2>
		<ul class="meta">
			<li class="icon-filed-under">
				<xsl:apply-templates select="categories/item"/>
			</li>
			<li class="icon-comments">
				<a href="{$root}/articles/{title/@handle}/#comments">
					<xsl:text>Comments (</xsl:text>
					<xsl:value-of select="@comments"/>
					<xsl:text>)</xsl:text>
				</a>
			</li>
		</ul>
		<xsl:apply-templates select="body/*[position() &lt;= 2]" mode="html"/>
		<xsl:call-template name="get-images">
			<xsl:with-param name="entry-id" select="@id"/>
		</xsl:call-template>
		<xsl:apply-templates select="body/*[position() &gt; 2 and position() &lt;= 4]" mode="html"/>
	</div>
	<hr/>
</xsl:template>

<xsl:template match="article/entry">
	<div class="article">
		<h3>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'D m Y'"/>
			</xsl:call-template>
			<xsl:if test="$is-logged-in">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{../section/@handle}/edit/{@id}/">Edit</a>
			</xsl:if>
		</h3>
		<h2>
			<a href="{$root}/articles/{title/@handle}/"><xsl:value-of select="title"/></a>
		</h2>
		<ul class="meta">
			<li class="icon-filed-under">
				<xsl:apply-templates select="categories/item"/>
			</li>
			<li class="icon-comments">
				<a href="{$root}/articles/{title/@handle}/#comments">
					<xsl:text>Comments (</xsl:text>
					<xsl:value-of select="@comments"/>
					<xsl:text>)</xsl:text>
				</a>
			</li>
		</ul>
		<xsl:apply-templates select="body/*[position() &lt;= 2]" mode="html"/>
		<xsl:call-template name="get-images">
			<xsl:with-param name="entry-id" select="@id"/>
		</xsl:call-template>
		<xsl:apply-templates select="body/*[position() &gt; 2]" mode="html"/>
	</div>
	<hr/>
</xsl:template>

<xsl:template match="categories/item">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>