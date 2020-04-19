# Lohit Fonts Project

##### Prerequisite to building Lohit fonts
1.
    a. Open font in Fontforge, import .fea file and generate fonts
    b. Using Makefile
	- python and fontforge
	- make ttf
2. sfntly for building web fonts.
	- Download "sfntly-read-only.zip" from http://code.google.com/p/sfntly/downloads/list 
	- Go to java folder and run $ant
	- Copy sfnttool.jar to /usr/share/java/

##### Scripts Usage:-
Run this command from parent directory, it will generate all source, binary and web tarball.
```
make all
```
NOTE:- This script can be used only from 2.1.1 and above version of this package.

##### Installing font (.ttf) file:
You can install .ttf font files by copying them to ~/.fonts directory. Then execute fc-cache command and then relogin to use that font.

##### [Lohit Project Information](https://fedorahosted.org/lohit)

##### [Mailing list](http://www.redhat.com/mailman/listinfo/lohit-devel-list)

