#!/bin/bash
# Log File Analyzer
# Omkar | 24bce10843 | OSS Project | Software: Git
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error

LOGFILE=$1
KEYWORD=${2:-"error"}  # default to "error" if nothing is passed
COUNT=0
ATTEMPT=0
MAX_RETRIES=3

echo "========================================================"
echo "   Log File Analyzer"
echo "========================================================"
echo ""

if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# retry loop if file not found -- ask user to try a different path
while true; do
    ATTEMPT=$((ATTEMPT + 1))

    if [ -f "$LOGFILE" ]; then
        break
    else
        echo "  attempt $ATTEMPT/$MAX_RETRIES: $LOGFILE not found"

        if [ $ATTEMPT -ge $MAX_RETRIES ]; then
            echo "  giving up. common log locations:"
            echo "    /var/log/syslog      (ubuntu/debian)"
            echo "    /var/log/messages    (fedora/rhel)"
            echo "    /var/log/auth.log    (auth events)"
            echo "    /var/log/dpkg.log    (package history)"
            exit 1
        fi

        read -p "  enter a valid path: " LOGFILE
    fi
done

echo "  file: $LOGFILE"

if [ ! -s "$LOGFILE" ]; then
    echo "  file is empty, nothing to read"
    exit 0
fi

echo "  keyword: $KEYWORD"
echo ""

# read through the file line by line and count matches
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "========================================================"
echo "  Results"
echo "========================================================"
echo ""
echo "  file    : $LOGFILE"
echo "  keyword : $KEYWORD"
echo "  matches : $COUNT"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "  last 5 matching lines:"
    echo "  ----------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r LINE; do
        echo "  > $LINE"
    done
else
    echo "  no matches found for '$KEYWORD'"
fi

echo ""
echo "========================================================"
