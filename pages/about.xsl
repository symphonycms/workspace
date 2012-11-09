<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<h3>Biography</h3>
	<h2>
		<xsl:value-of select="website-owner/author/name"/>
		<xsl:text> is a professional space monkey extraordinaire</xsl:text>
	</h2>
	<p><em><xsl:value-of select="$website-name"/></em> is running off a freshly installed copy of <a href="http://getsymphony.com">Symphony CMS</a>.</p>
	<p>Be sure to check back regularly as the site transforms from <em>fresh prince</em> to <em>whizz-bang candy steak</em>.</p>
	<hr/>
	<h3>Contact Me</h3>
	<div id="guideline">
		<h4>Notes</h4>
		<ul>
			<li>It's preferred to use the contact form rather than email. There is always a chance for emails to be picked up as spam.</li>
			<li>I will generally reply to messages within 24 hours unless I am horribly swamped.</li>
		</ul>
	</div>
	<form action="" method="post">
		<xsl:for-each select="events/save-message">
			<p class="{@result}">
				<xsl:choose>
					<xsl:when test="@result = 'error'">The system encountered errors while sending your email. Please check if all the required fields have been filled.</xsl:when>
					<xsl:when test="filter/@status = 'failed'">
						<xsl:attribute name="class">error</xsl:attribute>
						<xsl:text>The system encountered technical problems while sending your email.</xsl:text>
					</xsl:when>
					<xsl:otherwise>Email sent.</xsl:otherwise>
				</xsl:choose>
			</p>
		</xsl:for-each>
		<fieldset>
			<label class="required">Name <input type="text" name="fields[name]" value="{events/save-message/post-values/name}" /></label>
			<label class="required">Email <input type="text" name="fields[email]" value="{events/save-message/post-values/email}" /></label>
			<label class="required">Subject
				<xsl:choose>
					<xsl:when test="events/save-message/post-values/subject">
						<input type="text" name="fields[subject]" value="{events/save-message/post-values/subject}" />
					</xsl:when>
					<xsl:otherwise>
						<input type="text" name="fields[subject]" value="General Enquiry" />
					</xsl:otherwise>
				</xsl:choose>
			</label>
			<label>Message <textarea name="fields[message]" rows="5" cols="21"><xsl:value-of select="events/save-message/post-values/message" /></textarea></label>
			<input name="send-email[recipient]" value="{website-owner/author/username}" type="hidden" />
			<input name="send-email[reply-to-email]" value="fields[email]" type="hidden" />
			<input name="send-email[reply-to-name]" value="fields[name]" type="hidden" />
			<input name="send-email[subject]" value="fields[subject]" type="hidden" />
			<input name="send-email[body]" value="fields[message],fields[subject],fields[email],fields[name]" type="hidden" />
			<input id="submit" type="submit" name="action[save-message]" value="Send" />
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>