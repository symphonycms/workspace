# Symphony Default Workspace

This is the default workspace for Symphony CMS. This workspace aims to teach newcomers to Symphony by showcasing the basic features and functionalities using a familiar environment of a typical blog set-up.

This workspace is compatible with Symphony 2.6.2+.

## Installing this workspace
	
1. Clone workspace before installing Symphony: `git clone git://github.com/symphonycms/workspace.git your-website/workspace`
2. Install Symphony

## Updating (2.2 -> 2.3)

If you are updating your default workspace to 2.3, please note that you will need to remove the `Login` event from your pages and instead attach the the Logged In Author datasource.