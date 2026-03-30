#!/bin/bash
# Stop the Claude Desktop auto-prompter

PLIST_NAME="com.user.claudeprompter.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/$PLIST_NAME"

echo "Stopping Claude Desktop Auto-Prompter..."

if [ -f "$PLIST_DEST" ]; then
    launchctl unload "$PLIST_DEST" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "Auto-prompter stopped successfully!"
    else
        echo "Auto-prompter was not running."
    fi
else
    echo "Auto-prompter is not installed."
fi
