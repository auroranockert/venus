Venus
===============================================================================

A tool for quickly and efficiently changing your current input method/language
or keyboard layout on OS X.

Since it doesn't actually have a GUI. You will need to modify it's Info.plist
to get it to work with your configuration, look at NSUserData, it's a string of
names, separated by '|' (pipe).

I have it configured so I can switch between Swedish and US keyboard layouts on
Caps Lock + A, and Japanese and US on Caps Lock + S. Works pretty sweet.


Building the service bundle
-------------------------------------------------------------------------------

First, build InputManager.framework, it's available [here](http://github.com/JensNockert/input-manager)

Compile the project, you might need to modify the project so it can find the
framework and place the result so it looks something like this

~/Library/Services/Venus.service
	Contents/Info.plist
	Contents/MacOS/Venus
	Contents/Frameworks/InputManager.framework

Or download a precompiled version [here](http://aventine.se/venus/Venus-0.2.tar.bz2).


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
system. Or providing more exotic switching setups or features.


License
-------

Do whatever you want with it, it's nothing special, it's yours.

But I would appreciate if you sent me an e-mail (jens at nockert.se) and tell
me if you (dis)like it.
