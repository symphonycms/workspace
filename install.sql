
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') collate utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_author` ***

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') collate utf8_unicode_ci NOT NULL default 'on',
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (140, 30, 'off', 'Publish this article');

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `calendar` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_date` ***
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (96, 51, 'yes', 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (129, 29, 'yes', 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (130, 54, 'yes', 'no');

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=464 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (236, 47, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (237, 48, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (460, 26, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (356, 31, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (462, 37, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (461, 36, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (238, 49, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (463, 38, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `static_options` text collate utf8_unicode_ci,
  `dynamic_options` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_select` ***

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `related_field_id` varchar(255) collate utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL default '20',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`) VALUES (1, 56, 'no', 31, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`) VALUES (2, 39, 'no', 26, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`) VALUES (3, 45, 'no', 26, 20);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) collate utf8_unicode_ci default NULL,
  `pre_populate_source` varchar(15) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_taglist` ***

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) collate utf8_unicode_ci default NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (192, 50, NULL, 9);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (297, 27, 'pb_markdownextrasmartypants', 20);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (259, 34, 'pb_markdownextrasmartypants', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (239, 35, 'pb_markdownextrasmartypants', 5);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (298, 40, 'pb_markdownextrasmartypants', 8);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (299, 44, 'pb_markdownextrasmartypants', 9);

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) collate utf8_unicode_ci NOT NULL,
  `validator` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_upload` ***
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (140, 57, '/workspace/uploads', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- *** STRUCTURE: `tbl_entries_data_26` ***
DROP TABLE IF EXISTS `tbl_entries_data_26`;
CREATE TABLE `tbl_entries_data_26` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_26` ***
INSERT INTO `tbl_entries_data_26` (`id`, `entry_id`, `handle`, `value`) VALUES (146, 110, 'an-example-draft-article', 'An example draft article');
INSERT INTO `tbl_entries_data_26` (`id`, `entry_id`, `handle`, `value`) VALUES (143, 109, 'a-primer-to-symphony-2s-default-theme', 'A primer to Symphony 2\'s default theme');

-- *** STRUCTURE: `tbl_entries_data_27` ***
DROP TABLE IF EXISTS `tbl_entries_data_27`;
CREATE TABLE `tbl_entries_data_27` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci,
  `value_formatted` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_27` ***
INSERT INTO `tbl_entries_data_27` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (143, 109, 'Every theme in Symphony has an important mission: to introduce newcomers to Symphony by way of a working example. *Spectrum*, the name of this version\'s default theme, was designed and developed with such a mission in mind by following a set of constraints. A default theme is required to:\r\n\r\n1. be presented in a format that is universally identified and intuitive.\r\n2. have a clear and simple HTML structure.\r\n3. demonstrate the fundamental concepts in Symphony - `sections`, `fields`, `data sources` and `events` and their interactions together.\r\n4. avoid functionality that does not have any educational value.\r\n\r\n#### The design ####\r\n\r\nOur first rule states that a default theme needs to be in a format that is instantly recognisable to a user. As a result, all of the themes created in Symphony\'s history have emphasised a weblog structure. *Spectrum* continues this tradition.\r\n\r\n*Cubic*, the name of a previous default theme, followed the teaching mandate very closely. However, the theme took it one step further and removed complex structure and colour in favour of a simplified look and feel. The main design goal for *Spectrum* is to introduce more colours but still follow the philosophy of a simplistic layout.\r\n\r\n#### Features ####\r\n\r\n*Spectrum* has a handful of additional features that you won\'t find in previous default themes. These new features are not only meant to demonstrate the capabilities of the system but also explain some fundamental philosophies in Symphony 2. Below is a list of features:\r\n\r\n- Logged in users will see Links to Symphony\'s admin to edit articles, manage comments and add notes.\r\n- Logged in users will see 3 protected menu items, article drafts, the debug page and a link to the Symphony admin.\r\n- Website authors who have access to the admin can make their comments \"authorised\" which will colour their comment different to others.\r\n- Articles on the drafts page sports a button to publish the article.\r\n- Article images take advantage of Symphony\'s build-in image manipulation feature to crop and size the image automatically.\r\n- The contact form on the about page saves the content to the Messages section on the backend and emails the website\'s owner.\r\n\r\n#### Philosophy ####\r\n\r\nAll of the above takes advantage of new features found in version 2. An important concept that is being advocated in Symphony is the practise of creating a tighter connection between the front-end and the backend. Developers are encouraged to take advantage of the simplified URL structure of the admin to create a more convenient environment for their users.\r\n\r\nWith the introduction of the Event editor, developers now have even more control when developing a website. For example, the *Publish* button on the [article drafts page](drafts/) utilises the event editor to create an interaction between the frontend and the backend. This allows the *Publish* button to update the \"Publish this article\" checkbox field from the \"Articles\" section. This feature also compliments and encourages the philosophy of a more seamless environment between the website and the admin interface.', '<p>Every theme in Symphony has an important mission: to introduce newcomers to Symphony by way of a working example. <em>Spectrum</em>, the name of this version&#8217;s default theme, was designed and developed with such a mission in mind by following a set of constraints. A default theme is required to:</p>\n\n<ol>\n<li>be presented in a format that is universally identified and intuitive.</li>\n<li>have a clear and simple HTML structure.</li>\n<li>demonstrate the fundamental concepts in Symphony - <code>sections</code>, <code>fields</code>, <code>data sources</code> and <code>events</code> and their interactions together.</li>\n<li>avoid functionality that does not have any educational value.</li>\n</ol>\n\n<h4>The design</h4>\n\n<p>Our first rule states that a default theme needs to be in a format that is instantly recognisable to a user. As a result, all of the themes created in Symphony&#8217;s history have emphasised a weblog structure. <em>Spectrum</em> continues this tradition.</p>\n\n<p><em>Cubic</em>, the name of a previous default theme, followed the teaching mandate very closely. However, the theme took it one step further and removed complex structure and colour in favour of a simplified look and feel. The main design goal for <em>Spectrum</em> is to introduce more colours but still follow the philosophy of a simplistic layout.</p>\n\n<h4>Features</h4>\n\n<p><em>Spectrum</em> has a handful of additional features that you won&#8217;t find in previous default themes. These new features are not only meant to demonstrate the capabilities of the system but also explain some fundamental philosophies in Symphony 2. Below is a list of features:</p>\n\n<ul>\n<li>Logged in users will see Links to Symphony&#8217;s admin to edit articles, manage comments and add notes.</li>\n<li>Logged in users will see 3 protected menu items, article drafts, the debug page and a link to the Symphony admin.</li>\n<li>Website authors who have access to the admin can make their comments &#8220;authorised&#8221; which will colour their comment different to others.</li>\n<li>Articles on the drafts page sports a button to publish the article.</li>\n<li>Article images take advantage of Symphony&#8217;s build-in image manipulation feature to crop and size the image automatically.</li>\n<li>The contact form on the about page saves the content to the Messages section on the backend and emails the website&#8217;s owner.</li>\n</ul>\n\n<h4>Philosophy</h4>\n\n<p>All of the above takes advantage of new features found in version 2. An important concept that is being advocated in Symphony is the practise of creating a tighter connection between the front-end and the backend. Developers are encouraged to take advantage of the simplified URL structure of the admin to create a more convenient environment for their users.</p>\n\n<p>With the introduction of the Event editor, developers now have even more control when developing a website. For example, the <em>Publish</em> button on the <a href=\"drafts/\">article drafts page</a> utilises the event editor to create an interaction between the frontend and the backend. This allows the <em>Publish</em> button to update the &#8220;Publish this article&#8221; checkbox field from the &#8220;Articles&#8221; section. This feature also compliments and encourages the philosophy of a more seamless environment between the website and the admin interface.</p>\n');
INSERT INTO `tbl_entries_data_27` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (146, 110, 'This is an example draft article. Feel free to test the system by pressing the *publish* button.', '<p>This is an example draft article. Feel free to test the system by pressing the <em>publish</em> button.</p>\n');

-- *** STRUCTURE: `tbl_entries_data_29` ***
DROP TABLE IF EXISTS `tbl_entries_data_29`;
CREATE TABLE `tbl_entries_data_29` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) collate utf8_unicode_ci default NULL,
  `local` int(11) unsigned NOT NULL,
  `gmt` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_29` ***
INSERT INTO `tbl_entries_data_29` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (145, 110, '2009-06-24T11:28:00+10:00', 1245806880, 1245806880);
INSERT INTO `tbl_entries_data_29` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (142, 109, '2009-06-24T11:20:00+10:00', 1245806400, 1245806400);

-- *** STRUCTURE: `tbl_entries_data_30` ***
DROP TABLE IF EXISTS `tbl_entries_data_30`;
CREATE TABLE `tbl_entries_data_30` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_30` ***
INSERT INTO `tbl_entries_data_30` (`id`, `entry_id`, `value`) VALUES (146, 110, 'no');
INSERT INTO `tbl_entries_data_30` (`id`, `entry_id`, `value`) VALUES (143, 109, 'yes');

-- *** STRUCTURE: `tbl_entries_data_31` ***
DROP TABLE IF EXISTS `tbl_entries_data_31`;
CREATE TABLE `tbl_entries_data_31` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_31` ***
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 15, 'symphony', 'Symphony');
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 16, 'entertainment', 'Entertainment');
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 17, 'firefly', 'Firefly');
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `handle`, `value`) VALUES (18, 20, 'health', 'Health');

-- *** STRUCTURE: `tbl_entries_data_34` ***
DROP TABLE IF EXISTS `tbl_entries_data_34`;
CREATE TABLE `tbl_entries_data_34` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci,
  `value_formatted` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_34` ***
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (25, 114, 'Drop in and have a chat with the Symphony developers over at irc.freenode.net on #symphony. You\'ll need an [IRC Client](http://www.google.com/search?q=IRC+Client)', '<p>Drop in and have a chat with the Symphony developers over at irc.freenode.net on #symphony. You&#8217;ll need an <a href=\"http://www.google.com/search?q=IRC+Client\">IRC Client</a></p>\n');
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (24, 111, 'Symphony took over 18 months to develop.', '<p>Symphony took over 18 months to develop.</p>\n');
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (26, 115, 'Check the official [Symphony downloads page](http://symphony-cms.com/downloads/) for a full list of extensions, ensembles and XSLT utilities.', '<p>Check the official <a href=\"http://symphony-cms.com/downloads/\">Symphony downloads page</a> for a full list of extensions, ensembles and XSLT utilities.</p>\n');

-- *** STRUCTURE: `tbl_entries_data_35` ***
DROP TABLE IF EXISTS `tbl_entries_data_35`;
CREATE TABLE `tbl_entries_data_35` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci,
  `value_formatted` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_35` ***
INSERT INTO `tbl_entries_data_35` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (1, 15, 'A wise woman said to me once, \"If you\'re not using Symphony to publish your content on the web, then you\'re just a wild chipmunk. Get with the times and help me milk this cow.\"', '<p>A wise woman said to me once, &#8220;If you&#8217;re not using Symphony to publish your content on the web, then you&#8217;re just a wild chipmunk. Get with the times and help me milk this cow.&#8221;</p>\n');
INSERT INTO `tbl_entries_data_35` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (2, 16, 'Everyday, 8 hours of one\'s life is taken up by sleep, 8 with work and another 4 to procrastination. The remaining 4 hours is a precious one. Use it for entertainment.', '<p>Everyday, 8 hours of one&#8217;s life is taken up by sleep, 8 with work and another 4 to procrastination. The remaining 4 hours is a precious one. Use it for entertainment.</p>\n');
INSERT INTO `tbl_entries_data_35` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (3, 17, 'This is my sneaky way of advertising the best television show ever. Watch it for the funny.', '<p>This is my sneaky way of advertising the best television show ever. Watch it for the funny.</p>\n');
INSERT INTO `tbl_entries_data_35` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (18, 20, 'Two things that are in fashion today: health and climate issues. The kids are raving about good health these days. Apparently it\'s a positive thing.', '<p>Two things that are in fashion today: health and climate issues. The kids are raving about good health these days. Apparently it&#8217;s a positive thing.</p>\n');

-- *** STRUCTURE: `tbl_entries_data_36` ***
DROP TABLE IF EXISTS `tbl_entries_data_36`;
CREATE TABLE `tbl_entries_data_36` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_36` ***

-- *** STRUCTURE: `tbl_entries_data_37` ***
DROP TABLE IF EXISTS `tbl_entries_data_37`;
CREATE TABLE `tbl_entries_data_37` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_37` ***

-- *** STRUCTURE: `tbl_entries_data_38` ***
DROP TABLE IF EXISTS `tbl_entries_data_38`;
CREATE TABLE `tbl_entries_data_38` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_38` ***

-- *** STRUCTURE: `tbl_entries_data_39` ***
DROP TABLE IF EXISTS `tbl_entries_data_39`;
CREATE TABLE `tbl_entries_data_39` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_39` ***

-- *** STRUCTURE: `tbl_entries_data_40` ***
DROP TABLE IF EXISTS `tbl_entries_data_40`;
CREATE TABLE `tbl_entries_data_40` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci,
  `value_formatted` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_40` ***

-- *** STRUCTURE: `tbl_entries_data_44` ***
DROP TABLE IF EXISTS `tbl_entries_data_44`;
CREATE TABLE `tbl_entries_data_44` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci,
  `value_formatted` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_44` ***

-- *** STRUCTURE: `tbl_entries_data_45` ***
DROP TABLE IF EXISTS `tbl_entries_data_45`;
CREATE TABLE `tbl_entries_data_45` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_45` ***

-- *** STRUCTURE: `tbl_entries_data_47` ***
DROP TABLE IF EXISTS `tbl_entries_data_47`;
CREATE TABLE `tbl_entries_data_47` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_47` ***
INSERT INTO `tbl_entries_data_47` (`id`, `entry_id`, `handle`, `value`) VALUES (42, 105, 'allen-chang', 'Allen Chang');

-- *** STRUCTURE: `tbl_entries_data_48` ***
DROP TABLE IF EXISTS `tbl_entries_data_48`;
CREATE TABLE `tbl_entries_data_48` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_48` ***
INSERT INTO `tbl_entries_data_48` (`id`, `entry_id`, `handle`, `value`) VALUES (42, 105, 'allen-chaoticpatterncom', 'allen@chaoticpattern.com');

-- *** STRUCTURE: `tbl_entries_data_49` ***
DROP TABLE IF EXISTS `tbl_entries_data_49`;
CREATE TABLE `tbl_entries_data_49` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_49` ***
INSERT INTO `tbl_entries_data_49` (`id`, `entry_id`, `handle`, `value`) VALUES (41, 105, 'general-enquiry', 'General Enquiry');

-- *** STRUCTURE: `tbl_entries_data_50` ***
DROP TABLE IF EXISTS `tbl_entries_data_50`;
CREATE TABLE `tbl_entries_data_50` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci,
  `value_formatted` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_50` ***
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (42, 105, 'This is a test message to the guys in Azeroth.', 'This is a test message to the guys in Azeroth.');

-- *** STRUCTURE: `tbl_entries_data_51` ***
DROP TABLE IF EXISTS `tbl_entries_data_51`;
CREATE TABLE `tbl_entries_data_51` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) collate utf8_unicode_ci default NULL,
  `local` int(11) unsigned NOT NULL,
  `gmt` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_51` ***
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (16, 115, '2009-06-24T11:28:00+10:00', 1245806880, 1245806880);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (14, 111, '2009-06-24T11:28:00+10:00', 1245806880, 1245806880);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (15, 114, '2009-06-24T11:28:00+10:00', 1245806880, 1245806880);

-- *** STRUCTURE: `tbl_entries_data_54` ***
DROP TABLE IF EXISTS `tbl_entries_data_54`;
CREATE TABLE `tbl_entries_data_54` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) collate utf8_unicode_ci default NULL,
  `local` int(11) unsigned NOT NULL,
  `gmt` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_54` ***

-- *** STRUCTURE: `tbl_entries_data_56` ***
DROP TABLE IF EXISTS `tbl_entries_data_56`;
CREATE TABLE `tbl_entries_data_56` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_56` ***
INSERT INTO `tbl_entries_data_56` (`id`, `entry_id`, `relation_id`) VALUES (42, 109, 15);
INSERT INTO `tbl_entries_data_56` (`id`, `entry_id`, `relation_id`) VALUES (45, 110, 16);

-- *** STRUCTURE: `tbl_entries_data_57` ***
DROP TABLE IF EXISTS `tbl_entries_data_57`;
CREATE TABLE `tbl_entries_data_57` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) collate utf8_unicode_ci default NULL,
  `size` int(11) unsigned NOT NULL,
  `mimetype` varchar(50) collate utf8_unicode_ci default NULL,
  `meta` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_57` ***

-- *** DATA: `tbl_entries` ***
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (20, 7, 3, '2008-01-16 11:26:35', '2008-01-16 01:26:35');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (17, 7, 3, '2008-01-16 11:05:15', '2008-01-16 01:05:15');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (16, 7, 3, '2008-01-16 10:55:55', '2008-01-16 00:55:55');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (115, 8, 1, '2009-06-23 17:58:42', '2009-06-23 07:58:42');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (15, 7, 3, '2008-01-16 10:52:55', '2008-01-16 00:52:55');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (111, 8, 3, '2008-01-22 15:47:35', '2008-01-22 05:47:35');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (110, 6, 3, '2008-01-22 15:24:52', '2008-01-22 05:24:52');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (114, 8, 3, '2008-01-22 17:00:29', '2008-01-22 07:00:29');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (109, 6, 3, '2008-01-22 15:05:03', '2008-01-22 05:05:03');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (105, 11, 0, '2008-02-01 11:05:41', '2008-02-01 01:05:41');

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (71, 'export_ensemble', 'enabled', 1.6);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (65, 'debugdevkit', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (66, 'selectbox_link_field', 'enabled', 1.9);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (67, 'jit_image_manipulation', 'enabled', 1.02);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (68, 'maintenance_mode', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (69, 'markdown', 'enabled', 1.8);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (70, 'profiledevkit', 'enabled', 1);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (59, 71, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (47, 65, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (48, 65, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (49, 67, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (50, 67, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (51, 68, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (52, 68, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (53, 68, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (54, 68, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (55, 68, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (56, 68, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (57, 70, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (58, 70, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (39, 'Article', 'article', 'selectbox_link', 9, 'yes', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (38, 'Website', 'website', 'input', 9, 'yes', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (37, 'Email', 'email', 'input', 9, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (34, 'Note', 'note', 'textarea', 8, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (36, 'Author', 'author', 'input', 9, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (56, 'Categories', 'categories', 'selectbox_link', 6, 'yes', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (35, 'Description', 'description', 'textarea', 7, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (31, 'Title', 'title', 'input', 7, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (30, 'Publish', 'publish', 'checkbox', 6, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (26, 'Title', 'title', 'input', 6, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (27, 'Body', 'body', 'textarea', 6, 'yes', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (29, 'Date', 'date', 'date', 6, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (47, 'Name', 'name', 'input', 11, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (40, 'Comment', 'comment', 'textarea', 9, 'yes', 5, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (57, 'Image', 'image', 'upload', 10, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (45, 'Article', 'article', 'selectbox_link', 10, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (44, 'Description', 'description', 'textarea', 10, 'yes', 2, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (51, 'Date', 'date', 'date', 8, 'no', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (48, 'Email', 'email', 'input', 11, 'yes', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (49, 'Subject', 'subject', 'input', 11, 'no', 8, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (50, 'Message', 'message', 'textarea', 11, 'no', 12, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (54, 'Date', 'date', 'date', 9, 'no', 3, 'main', 'yes');

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (64, NULL, 'Home', 'home', NULL, 'category', 'article_images,homepage_articles,navigation,notes', 'login', 0);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (66, NULL, 'About', 'about', NULL, NULL, 'navigation,website_owner', 'login,save_message', 4);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (67, NULL, 'RSS', 'rss', NULL, NULL, 'rss_articles', NULL, 5);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (68, NULL, 'Archive', 'archive', NULL, 'year', 'archive,navigation', 'login', 3);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (69, NULL, 'Articles', 'articles', NULL, 'entry/cat', 'article,article_images,comments,navigation', 'login,save_comment', 1);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (70, NULL, 'Drafts', 'drafts', NULL, 'entry', 'article_images,drafts,navigation', 'login,publish_article', 2);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (75, NULL, 'Maintenance', 'maintenance', NULL, NULL, NULL, NULL, 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (76, NULL, 'Page Not Found', 'page-not-found', NULL, NULL, NULL, NULL, 7);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (609, 76, 404);
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (542, 70, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (611, 75, 'maintenance');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (615, 64, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (617, 69, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (463, 67, 'XML');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (462, 67, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (614, 64, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (610, 75, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (608, 76, 'hidden');

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (10, 'Images', 'images', 5, NULL, 'asc', 'yes', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (9, 'Comments', 'comments', 1, NULL, NULL, 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (8, 'Notes', 'notes', 2, 51, 'desc', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (6, 'Articles', 'articles', 0, 29, 'desc', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (7, 'Categories', 'categories', 3, 31, 'asc', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (11, 'Messages', 'messages', 4, NULL, 'asc', 'no', 'Content');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (87, 6, 26, 9, 39, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (88, 6, 26, 10, 45, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (86, 7, 31, 6, 56, 'no');
