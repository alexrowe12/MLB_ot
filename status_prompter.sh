#!/bin/bash
# Check status of the Claude Desktop auto-prompter

PLIST_NAME="com.user.claudeprompter"

echo "Claude Desktop Auto-Prompter Status"
echo "===================================="

# Check if the job is loaded
STATUS=$(launchctl list | grep "$PLIST_NAME")

if [ -n "$STATUS" ]; then
    echo "Status: RUNNING"
    echo ""
    echo "Details:"
    echo "$STATUS"
    echo ""
    echo "The prompter will run every 15 minutes."
    echo "To stop: ./stop_prompter.sh"
else
    echo "Status: STOPPED"
    echo ""
    echo "To start: ./start_prompter.sh"
fi

echo ""
echo "Recent log entries:"
echo "-------------------"
if [ -f "$HOME/Desktop/MLB_ot/prompter.log" ]; then
    tail -5 "$HOME/Desktop/MLB_ot/prompter.log" 2>/dev/null || echo "(no logs yet)"
else
    echo "(no logs yet)"
fi
