<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="get-images">
	<xsl:param name="entry-id"/>
	<xsl:if test="/data/article-images/entry[article/item/@id = $entry-id]">
		<div class="article-images">
			<xsl:apply-templates select="/data/article-images/entry[article/item/@id = $entry-id]"/>
		</div>
	</xsl:if>
</xsl:template>

<xsl:template match="article-images/entry">
	<a href="{$workspace}/uploads/{image/filename}">
		<xsl:if test="position() mod 4 = 0">
			<xsl:attribute name="class">last-column</xsl:attribute>
		</xsl:if>
		<img title="{description}">
			<xsl:attribute name="src">
				<xsl:value-of select="$root"/>
				<xsl:text>/image/2/133/88/2/uploads/</xsl:text>
				<xsl:value-of select="image/filename"/>
			</xsl:attribute>
		</img>
	</a>
</xsl:template>

</xsl:stylesheet>