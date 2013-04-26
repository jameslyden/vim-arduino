vim-arduino
======================

Vim configuration with support for editing and building Arduino projects. It hasn't been tested under a lot of configurations, so it may or may not be terribly portable.

It makes the following assumptions:
* Arduino IDE is installed, with support files in /usr/share/arduino
* User-installed libraries are in ~/src/arduino/libraries
* The Arduino IDE is set up for the currently connected board

It provides the following commands/hotkeys/mappings:
* :Ardeploy -- Make the project, then upload to the currently connected board
* :Arcompile -- Make the project, but don't deploy
* :Arserial -- Open a serial monitor for the currently connected board
* :make is aliased to :Ardeploy when editing an Arduino sketch
* [F6] is mapped to :Arcompile (I map :make to [F5] globally, so they are adjacent)
* [F9] is mapped to :Arserial
* [F3] looks up the word under the cursor in the Arduino reference (it tries to locate it locally first, and falls back to the online reference)

As a bonus, there is also an xdg-open (".desktop") file that can be copied to /usr/share/applications to provide right-click deployment and serial monitoring of .ino files within Nautilus.
