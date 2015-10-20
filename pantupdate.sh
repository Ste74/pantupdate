 
#!/bin/bash

set e

# Check that the script is being run as root.
if [[ $(id -u) != 0 ]]; then
	echo "Please run this script with root privileges."
	exit 0
fi

echo "Download new packages"

pacman -Sw gala-bzr pantheon-session-bzr slingshot-launcher-bzr wingpanel-indicator-notifications-bzr wingpanel-indicator-datetime-bzr wingpanel-indicator-network-bzr wingpanel-indicator-power-bzr wingpanel-indicator-session-bzr wingpanel-indicator-sound-bzr wingpanel-indicator-launcher-bzr wingpanel-bzr

echo "Packages downloaded"

echo "Remove and install packges to rebase pantheon only on repo alucryd"

#Remove all .manjaro pantheon files
pacman -R -d --nodeps --noconfirm  mutter-pantheon-manjaro gala-bzr-manjaro pantheon-session-bzr-manjaro slingshot-launcher-bzr-manjaro wingpanel-indicator-notifications-bzr-manjaro wingpanel-indicator-datetime-bzr-manjaro wingpanel-indicator-network-bzr-manjaro wingpanel-indicator-power-bzr-manjaro wingpanel-indicator-session-bzr-manjaro wingpanel-indicator-sound-bzr-manjaro wingpanel-indicator-launcher-bzr-manjaro wingpanel-bzr-manjaro

echo "Install new packages"

#Install new packages
pacman -U gala-bzr pantheon-session-bzr slingshot-launcher-bzr wingpanel-indicator-notifications-bzr wingpanel-indicator-datetime-bzr wingpanel-indicator-network-bzr wingpanel-indicator-power-bzr wingpanel-indicator-session-bzr wingpanel-indicator-sound-bzr wingpanel-indicator-launcher-bzr wingpanel-bzr

#Copy xml schemas for workaround on wingpanel and activate it

echo "Workaround for wingpanel schemas"

cp org.pantheon.desktop.gala.gschema.xml /usr/share/glib-2.0/schemas/
glib-compile-schemas /usr/share/glib-2.0/schemas/


echo "Done now reboot the system"