#!/bin/bash
# Disk and Permission Auditor
# Omkar | 24bce10843 | OSS Project | Software: Git

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================================"
echo "   Disk and Permission Auditor"
echo "========================================================"
echo ""
printf "  %-20s %-28s %-8s\n" "Directory" "Permissions / Owner / Group" "Size"
echo "  ----------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # pull permissions, owner, group from ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-20s %-28s %-8s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        printf "  %-20s %s\n" "$DIR" "does not exist"
    fi
done

echo ""
echo "========================================================"
echo "  Git config check"
echo "========================================================"
echo ""

GIT_GLOBAL_CONFIG="$HOME/.gitconfig"

if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$GIT_GLOBAL_CONFIG" 2>/dev/null | cut -f1)
    echo "  found: $GIT_GLOBAL_CONFIG"
    echo "  permissions: $PERMS"
    echo "  size: $SIZE"
    echo ""
    echo "  this file stores your name, email, sometimes credentials."
    echo "  should be 644 at most. never 777."
else
    echo "  no global git config at $GIT_GLOBAL_CONFIG"
    echo "  set it up with:"
    echo "    git config --global user.name 'Your Name'"
    echo "    git config --global user.email 'you@example.com'"
fi

echo ""

# system-wide git config, usually not present and that's fine
if [ -f "/etc/gitconfig" ]; then
    PERMS=$(ls -l "/etc/gitconfig" | awk '{print $1, $3, $4}')
    echo "  system git config: /etc/gitconfig | $PERMS"
else
    echo "  no /etc/gitconfig present (normal)"
fi

echo ""
echo "========================================================"
