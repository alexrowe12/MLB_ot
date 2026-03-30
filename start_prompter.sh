#!/bin/bash
# Start the Claude Desktop auto-prompter

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLIST_NAME="com.user.claudeprompter.plist"
PLIST_SOURCE="$SCRIPT_DIR/$PLIST_NAME"
PLIST_DEST="$HOME/Library/LaunchAgents/$PLIST_NAME"

echo "Starting Claude Desktop Auto-Prompter..."

# Copy plist to LaunchAgents if not already there
if [ ! -f "$PLIST_DEST" ]; then
    echo "Installing launch agent..."
    cp "$PLIST_SOURCE" "$PLIST_DEST"
fi

# Unload first if already loaded (to refresh)
launchctl unload "$PLIST_DEST" 2>/dev/null

# Load the launch agent
launchctl load "$PLIST_DEST"

if [ $? -eq 0 ]; then
    echo "Auto-prompter started successfully!"
    echo "Claude will be prompted every 15 minutes."
    echo ""
    echo "Running first prompt now..."
    osascript "$SCRIPT_DIR/prompt_claude.scpt"
    echo ""
    echo "To stop: ./stop_prompter.sh"
    echo "To check status: ./status_prompter.sh"
else
    echo "Failed to start auto-prompter."
    exit 1
fi
