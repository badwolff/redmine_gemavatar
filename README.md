==========
Gemavatar
==========

About
-----

``Gemavatar`` is a ``Redmine`` plugin for replacing the gravatars (they must 
be enabled) with the jpeg pictures stored in the ldap auth_source that 
``Redmine`` is configured to work with.

This is a fork of the https://bitbucket.org/celebdor/gemavatar to make it Rails3 compatible
** the AD property was changed to `thumbnailphoto` **

Installation
------------

git clone the repo

Do the migration on the database

`ruby bin/rake redmine:plugins RAILS_ENV="production"`

Restart the web server service.

Configuration
-------------

Go to Administration -> Plugins and click ``Configure`` on the Gemavatar
plugin.

There you must set:

- The maximum time the avatars are cached on disk.
- Whether to allow users to refetch their own avatar from AD.


Checking that it works
----------------------

Just go to your user page, and your avatar should be visible there.
