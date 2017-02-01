Firectl
=======

[![License](https://img.shields.io/badge/License-GPLv2+-blue.svg)](https://github.com/rahiel/firectl/blob/master/LICENSE.txt)

Firectl is a tool to integrate [firejail](https://firejail.wordpress.com/)
sandboxing in the Linux desktop. Enable firejail for an application and enjoy a
more secure desktop.

# Usage

To see which applications you can enable:
``` bash
firectl status
```

To enable firejail for a program:
``` bash
sudo firectl enable firefox
```

To disable firejail for a program:
``` bash
sudo firectl disable firefox
```

After enabling a program, it will start within a firejail when launched via the
menu or the file manager. To test if it's working: open a terminal and execute
`watch firejail --list`. This lists all active firejail sandboxes. Then start an
enabled application and look for it in that terminal. Note that applications
launched from the terminal or from scripts will not be in a firejail, unless
explicitly done so.

# Alternative

Firectl was made before Firejail had its own tool for desktop integration. Now
firejail ships with a tool called `firecfg`. Look at its manual: `man firecfg`
and decide if you still need firectl or if firecfg is enough.

# Debian/Ubuntu

For Debian and Ubuntu systems install the deb at
<https://github.com/rahiel/firectl/releases>.

# Other distro's

## Restoring

Firectl works by modifying the system's desktop files, the files that tell the
system which user applications are installed and how to run them. When these
applications are updated, the desktop files are also updated, disabling
firejail. The firectl settings need to be restored. (Note that for Debian/Ubuntu
systems, installing the deb file takes care of this and no manual restoring is
necessary.)

For now you have to manually restore firejail settings after upgrades:
``` bash
sudo firectl restore
```

## Install

Install firectl with pip:
``` bash
sudo pip3 install firectl
```

## Uninstall

To uninstall firectl:
``` bash
sudo firectl disable all
sudo pip3 uninstall firectl
sudo rm /etc/firejail/firectl.conf
```

# More security

If you require even more security, the next sensible step is to use an operating
system that is built from the ground-up with security in mind. Notable examples
are [Subgraph OS][] and [Qubes OS][].

[Subgraph OS]: https://subgraph.com/sgos/index.en.html
[Qubes OS]: https://www.qubes-os.org/
