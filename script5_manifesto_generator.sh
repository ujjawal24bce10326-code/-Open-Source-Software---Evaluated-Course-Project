#!/bin/bash
# Open Source Manifesto Generator
# Omkar | 24bce10843 | OSS Project | Software: Git

# note: aliases are shell shortcuts defined like this:
# alias gs='git status'
# they don't persist across sessions unless you add them to ~/.bashrc

echo "========================================================"
echo "   Open Source Manifesto Generator"
echo "   Omkar | 24bce10843"
echo "========================================================"
echo ""
echo "  three questions. your manifesto gets generated from your answers."
echo ""

read -p "  1. one open-source tool you use every day: " TOOL
echo ""
read -p "  2. in one word, what does freedom mean to you: " FREEDOM
echo ""
read -p "  3. one thing you would build and share freely: " BUILD
echo ""

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# write header to file (> overwrites, >> appends)
echo "========================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  $(whoami) | $DATE" >> "$OUTPUT"
echo "========================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# build the paragraph using the three inputs
echo "  Every day I open $TOOL, which someone built and gave away" >> "$OUTPUT"
echo "  without asking for anything back except collaboration." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  To me freedom means $FREEDOM. Open source is one of the" >> "$OUTPUT"
echo "  few places where that actually exists in practice." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I want to build $BUILD someday and share it the same way." >> "$OUTPUT"
echo "  Not because I have to. Because that's how the best things" >> "$OUTPUT"
echo "  in software get made -- in the open, by people who care" >> "$OUTPUT"
echo "  more about the problem than the credit." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Git taught me that. One frustrated person wrote a tool" >> "$OUTPUT"
echo "  over a weekend and now the entire world's code runs on it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "========================================================" >> "$OUTPUT"
echo "  'Given enough eyeballs, all bugs are shallow.' Linus's Law" >> "$OUTPUT"
echo "========================================================" >> "$OUTPUT"

echo "  writing manifesto..."
echo ""
cat "$OUTPUT"
echo ""
echo "  saved to: $OUTPUT"
echo "========================================================"
