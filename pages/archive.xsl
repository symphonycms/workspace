<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>

<xsl:template match="data">
	<h3>Archive</h3>
	<h2>History in the making</h2>
	<xsl:apply-templates select="archive"/>
</xsl:template>

</xsl:stylesheet>