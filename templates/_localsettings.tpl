{{- define "astral.mediawiki.localsettings" }}
<?php
# Mediawiki settings
# https://www.mediawiki.org/wiki/Manual:Configuration_settings

# Protect against web entry
if ( !defined( 'MEDIAWIKI' ) ) {
    exit;
}

## Debug options
# $wgShowExceptionDetails = true;
# $wgShowDBErrorBacktrace = true;
# $wgShowSQLErrors = true;

## Uncomment this to disable output compression
# $wgDisableOutputCompression = true;

$wgSitename = "{{ .Values.mediawiki.mediawikiName }}";
$wgMetaNamespace = false;

## The URL base path to the directory containing the wiki;
## defaults for all runtime URL paths are based off of this.
## For more information on customizing the URLs
## (like /w/index.php/Page_title to /wiki/Page_title) please see:
## https://www.mediawiki.org/wiki/Manual:Short_URL
$wgScriptPath = '';

## The protocol and server name to use in fully-qualified URLs
$wgServer = 'https://{{ .Values.mediawiki.mediawikiHost }}';

## The URL path to static resources (images, scripts, etc.)
$wgResourceBasePath = $wgScriptPath;

## The URL paths to the logo.  Make sure you change this from the default,
## or else you'll overwrite your logo when you upgrade!
$wgLogos = [
    '1x' => "$wgResourceBasePath/skins/local/images/logo.svg",
    'icon' => "$wgResourceBasePath/skins/local/images/logo-icon.svg",
];

## UPO means: this is also a user preference option

$wgEnableEmail = true;
$wgEnableUserEmail = true; # UPO

$wgEmergencyContact = '{{ .Values.mediawiki.mediawikiEmail }}';
$wgPasswordSender = '{{ .Values.mediawiki.mediawikiEmail }}';
$wgSMTP = [
    'host' => '{{ .Values.mediawiki.smtpHost }}',
    'IDHost' => '{{ .Values.mediawiki.mediawikiHost }}',
    'localhost' => '{{ .Values.mediawiki.mediawikiHost }}',
    'port' => '{{ .Values.mediawiki.smtpPort }}',
    'auth' => true,
    'username' => '{{ .Values.mediawiki.smtpUser }}',
    'password' => '{{ .Values.mediawiki.smtpPassword }}',
];

$wgEnotifUserTalk = false; # UPO
$wgEnotifWatchlist = false; # UPO
$wgEmailAuthentication = true;

## Database settings
$wgDBtype = "mysql";
$wgDBserver = "{{ .Values.mediawiki.externalDatabase.host }}";
$wgDBname = "{{ .Values.mediawiki.externalDatabase.database }}";
$wgDBuser = "{{ .Values.mediawiki.externalDatabase.user }}";
$wgDBpassword = "{{ .Values.mediawiki.externalDatabase.password }}";
$wgDBssl = true;

# MySQL specific settings
$wgDBprefix = "";

# MySQL table options to use during installation or update
$wgDBTableOptions = "ENGINE=InnoDB, DEFAULT CHARSET=binary";

# Shared database table
# This has no effect unless $wgSharedDB is also set.
$wgSharedTables[] = "actor";

## Shared memory settings
$wgMainCacheType = CACHE_ACCEL;
$wgMemCachedServers = [];

## To enable image uploads, make sure the 'images' directory
## is writable, then set this to true:
$wgEnableUploads = true;
#$wgUseImageMagick = true;
#$wgImageMagickConvertCommand = "/usr/bin/convert";

# InstantCommons allows wiki to use images from https://commons.wikimedia.org
$wgUseInstantCommons = true;

# Periodically send a pingback to https://www.mediawiki.org/ with basic data
# about this MediaWiki instance. The Wikimedia Foundation shares this data
# with MediaWiki developers to help guide future development efforts.
$wgPingback = false;

# Site language code, should be one of the list in ./languages/data/Names.php
$wgLanguageCode = "en";

# Time zone
$wgLocaltimezone = "UTC";

# Secret string for generating user_tokens for the user table
$wgSecretKey = "{{ randAlphaNum 64 }}";

# Changing this will log out all existing sessions.
$wgAuthenticationTokenVersion = "1";

# Site upgrade key. Must be set to a string (default provided) to turn on the
# web installer while LocalSettings.php is in place
$wgUpgradeKey = "{{ randAlphaNum 16 }}";

## For attaching licensing metadata to pages, and displaying an
## appropriate copyright notice / icon. GNU Free Documentation
## License and Creative Commons licenses are supported so far.
$wgRightsPage = ""; # Set to the title of a wiki page that describes your license/copyright
$wgRightsUrl = "";
$wgRightsText = "";
$wgRightsIcon = "";

# Path to the GNU diff3 utility. Used for conflict resolution.
$wgDiff3 = "/usr/bin/diff3";

## Default skin: you can change the default skin. Use the internal symbolic
## names, e.g. 'vector' or 'monobook':
$wgDefaultSkin = "citizen";
$wgDefaultMobileSkin = "citizen";

# Enabled skins.
# The following skins were automatically enabled:
wfLoadSkin( 'MinervaNeue' );
wfLoadSkin( 'MonoBook' );
wfLoadSkin( 'Timeless' );
wfLoadSkin( 'Vector' );
wfLoadSkin( 'Citizen' );


# End of automatically generated settings.
# Add more configuration options below.
$wgArticlePath = "/wiki/$1";
$wgUsePathInfo = true;

$wgFavicon = "$wgResourceBasePath/skins/local/images/favicon.ico";

# Disable reading by anonymous users
$wgGroupPermissions['*']['read'] = false;

# Disable anonymous editing
$wgGroupPermissions['*']['edit'] = false;

# Prevent new user registrations except by sysops
$wgGroupPermissions['*']['createaccount'] = false;


# Leninent file uploads
$wgStrictFileExtensions = false;

# Activate cache
$wgCacheDirectory = "$IP/cache";

# Load extensions
wfLoadExtension('AbuseFilter');
wfLoadExtension('CategoryTree');
wfLoadExtension('Cite');
wfLoadExtension('CodeEditor');
wfLoadExtension('Gadgets');
wfLoadExtension('Graph');
wfLoadExtension('ImageMap');
wfLoadExtension('InputBox');
wfLoadExtension('Interwiki');
wfLoadExtension('JsonConfig');
wfLoadExtension('Math');
wfLoadExtension('MultimediaViewer');
wfLoadExtension('Nuke');
wfLoadExtension('OATHAuth');
wfLoadExtension('PageImages');
wfLoadExtension('ParserFunctions');
wfLoadExtension('PdfHandler');
wfLoadExtension('Poem');
wfLoadExtension('Popups');
wfLoadExtension('Renameuser');
wfLoadExtension('ReplaceText');
wfLoadExtension('Scribunto');
wfLoadExtension('SecureLinkFixer');
wfLoadExtension('SyntaxHighlight_GeSHi');
wfLoadExtension('TemplateData');
wfLoadExtension('TemplateStyles');
wfLoadExtension('TextExtracts');
wfLoadExtension('TitleBlacklist');
wfLoadExtension('TwoColConflict');
wfLoadExtension('VisualEditor');
wfLoadExtension('WikiEditor');

# Extension settings
$wgDefaultUserOptions['usebetatoolbar'] = 1; // user option provided by WikiEditor extension
$wgWikiEditorRealtimePreview = true;
{{- end -}}