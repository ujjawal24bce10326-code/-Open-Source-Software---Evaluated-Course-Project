#!/bin/bash
# System Identity Report
# Omkar | 24bce10843 | OSS Project | Software: Git

STUDENT_NAME="Omkar"
REG_NO="24bce10843"
SOFTWARE_CHOICE="Git"

# grab system info
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S')

# /etc/os-release has the distro name on most modern systems
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown"
fi

echo "========================================================"
echo "   OPEN SOURCE AUDIT -- System Identity Report"
echo "========================================================"
echo "  Student : $STUDENT_NAME ($REG_NO)"
echo "  Software: $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Distribution  : $DISTRO"
echo "  Kernel        : $KERNEL"
echo "  User          : $USER_NAME"
echo "  Home          : $HOME_DIR"
echo "  Uptime        : $UPTIME"
echo "  Date/Time     : $CURRENT_DATE"
echo ""
echo "  This OS runs under the GNU GPL v2."
echo "  Git also uses GPL v2 -- you can read it, fork it,"
echo "  change it, but you cannot lock it down."
echo ""
echo "  'Free as in freedom, not free as in free beer.' -- RMS"
echo "========================================================"
