==========
Gemavatar
==========

About
-----

``Gemavatar`` is a ``Redmine`` plugin for replacing the gravatars (they must 
be enabled) with the jpeg pictures stored in the ldap auth_source that 
``Redmine`` is configured to work with.

Installation
------------

hg clone this repository while being inside the redmine /vendor/plugins 
directory(It must be done with the user that runs the web server service, so 
it has the proper permissions):

    hg clone <address> gemavatar

Add the necessary stuff to the database.

    rake db:migrate_plugins

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
