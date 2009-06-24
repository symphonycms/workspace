<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>

<xsl:template match="data">
	<xsl:apply-templates select="article/entry"/>
	<xsl:apply-templates select="comments"/>
	<hr />
	<h3>Make a comment</h3>
	<div id="guideline">
		<h4>Rules</h4>
		<ul>
			<li>Please keep the language PG-13, my mum reads this blog. Hi mum!</li>
			<li>Text is formatted with <a href="http://daringfireball.net/projects/markdown/syntax">Markdown</a>.</li>
		</ul>
	</div>
	<form action="" method="post">
		<xsl:for-each select="events/save-comment">
			<p class="{@result}">
				<xsl:choose>
					<xsl:when test="@result = 'success'">Your comment has been saved successfully.</xsl:when>
					<xsl:otherwise>The system encountered errors when saving your comment. Please check if all the required fields have been filled.</xsl:otherwise>
				</xsl:choose>
			</p>
		</xsl:for-each>
		<fieldset>
			<label>Name <input type="text" name="fields[author]" value="{events/save-comment/post-values/author}" /></label>
			<label>Email <input type="text" name="fields[email]" value="{events/save-comment/post-values/email}" /></label>
			<label>Website <input type="text" name="fields[website]" value="{events/save-comment/post-values/website}" /></label>
			<label>Comment <textarea name="fields[comment]" rows="5" cols="21"><xsl:value-of select="events/save-comment/post-values/comment" /></textarea></label>
			<input name="fields[article]" value="{article/entry/@id}" type="hidden" />
			<input id="submit" type="submit" name="action[save-comment]" value="Post Comment" />
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>