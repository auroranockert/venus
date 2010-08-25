Venus
-----

A tool for quickly and efficiently changing your current input method/language/keyboard layout on OS X.

Since it doesn't actually have a GUI. You will need to modify it's Info.plist to get it to work with your configuration, look at NSUserData.


Building the service bundle
---------------------------

Compile the project, and make sure it looks something like this

~/Library/Services/Venus.service
	Contents/Info.plist
	Contents/MacOS/Venus

Or download a precompiled version from http://aventine.se/venus/Venus-0.1.tar.bz2


Installing
----------

Copy the bundle to ~/Library/Services, then go to the services preferences and enable the services and add hotkeys.


Debugging
---------

Does it seem like your plist isn't being reloaded? It probably isn't being reloaded in that case, run `/System/Library/CoreServices/pbs` to reload it, and maybe a `killall Venus` for good measure.


Want to help?
-------------

Please help make Venus helpful to others, for example by making a configuration system. Or providing more exotic switching setups.
