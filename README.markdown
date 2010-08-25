Venus
===============================================================================

A tool for quickly and efficiently changing your current input method/language
or keyboard layout on OS X.

Since it doesn't actually have a GUI. You will need to modify it's Info.plist
to get it to work with your configuration, look at NSUserData, it's a string of
two names, separated by a '|' (pipe).


Building the service bundle
-------------------------------------------------------------------------------

Compile the project, and place the result so it looks something like this

~/Library/Services/Venus.service
	Contents/Info.plist
	Contents/MacOS/Venus

Or download a precompiled version [here](http://aventine.se/venus/Venus-0.1.tar.bz2).


Installing
----------

Copy the bundle to ~/Library/Services, then go to the services preferences and
enable the services and add some hotkeys.


Debugging
---------

Does it seem like your plist isn't being reloaded? It probably isn't being
reloaded in that case, run `/System/Library/CoreServices/pbs` to reload it, and
maybe a `killall Venus` for good measure.


Want to help?
-------------

Please help make Venus helpful to others, for example by making a configuration
system. Or providing more exotic switching setups.


License
-------

Do whatever you want with it, it's nothing special, it's yours.

But I would appreciate if you sent me an e-mail (jens at nockert.se) and tell
me if you (dis)like it.
