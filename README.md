# Gemavatar (Redmine 3+)

## Disclaimer
This project is a fork of the excellent https://bitbucket.org/celebdor/gemavatar
Since there have been no updates since a while, I decided to update it to make it Redmine 3+ compatible.

## About
``Gemavatar`` is a ``Redmine`` plugin for replacing the gravatars (they must 
be enabled) with the jpeg pictures stored in the ldap auth_source that 
``Redmine`` is configured to work with.

Installation
------------

Git clone the repo in the plugins folder
`git clone git@gitlab.com:aguarino/gemavatar.git`

Please be sure that the folder is named `redmine_gemavatar`

Do the migration on the database (will create the table with the pictures):

`ruby bin/rake redmine:plugins RAILS_ENV="production"`

Restart the web server service.

Configuration
-------------

Go to Administration -> Plugins and click ``Configure`` on the Gemavatar
plugin.

There you must set:

- The maximum time the avatars are cached on disk.
- Whether to allow users to refetch their own avatar from AD.
- The string that defines the property in your LDAP server where the photo is stored (`thumbnailphoto` works for me, but `jpegphoto` was the original plugin value)

Checking that it works
----------------------

* Just go to your user page, and your avatar should be visible there.
* Note that the jpeg pictures are **automatically cropped to be squared**
