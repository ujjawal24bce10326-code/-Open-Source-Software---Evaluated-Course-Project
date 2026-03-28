#!/bin/bash
# FOSS Package Inspector
# Omkar | 24bce10843 | OSS Project | Software: Git

PACKAGE="git"

echo "========================================================"
echo "   FOSS Package Inspector"
echo "========================================================"
echo ""

# try dpkg first (ubuntu/debian), fall back to rpm
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "[OK] $PACKAGE is installed"
    echo ""
    dpkg -s "$PACKAGE" | grep -E 'Version|Maintainer|Homepage' | sed 's/^/  /'
    echo ""
    echo "  $(git --version)"

elif rpm -q "$PACKAGE" &>/dev/null; then
    echo "[OK] $PACKAGE is installed (rpm system)"
    echo ""
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary' | sed 's/^/  /'

else
    echo "[NOT FOUND] $PACKAGE is not installed"
    echo ""
    echo "  ubuntu/debian : sudo apt install git"
    echo "  fedora/rhel   : sudo dnf install git"
fi

echo ""
echo "========================================================"
echo "  Philosophy by package"
echo "========================================================"
echo ""

# one note per package about why it matters
case $PACKAGE in
    git)
        echo "  Git: built in 2 weeks because a proprietary tool"
        echo "  cut off the Linux kernel team's access. Linus was"
        echo "  frustrated, so he built something better. GPL v2."
        ;;
    httpd|apache2)
        echo "  Apache: before this, web servers cost money."
        ;;
    mysql)
        echo "  MySQL: dual-licensed, GPL for open source, paid for proprietary."
        ;;
    firefox)
        echo "  Firefox: a nonprofit browser. exists because IE once had 96% share."
        ;;
    vlc)
        echo "  VLC: started by students who just wanted to stream video on campus."
        ;;
    python3|python)
        echo "  Python: shaped entirely by community proposals, the PSF keeps it free."
        ;;
    *)
        echo "  $PACKAGE: open source. someone built it and chose to share it."
        ;;
esac

echo ""
echo "========================================================"
