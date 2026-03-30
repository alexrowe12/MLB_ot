-- Claude Desktop Auto-Prompter for Live Sports
-- This script activates Claude Desktop and sends a detailed prompt from an external file
-- Using clipboard paste for reliability with long prompts

-- Path to the prompt file
set promptFile to (POSIX path of (path to me as text)) & "/../sports_prompt.txt"

-- Read the prompt from file
try
	set sportsPrompt to do shell script "cat " & quoted form of promptFile
on error
	-- Fallback to script directory if path resolution fails
	set sportsPrompt to do shell script "cat /Users/alexrowe/Desktop/MLB_ot/sports_prompt.txt"
end try

-- Save current clipboard contents
set oldClipboard to the clipboard

-- Copy prompt to clipboard
set the clipboard to sportsPrompt

-- Activate Claude Desktop
tell application "Claude" to activate

-- Wait for app to come to foreground
delay 2

-- Send the prompt via paste (much faster and more reliable for long text)
tell application "System Events"
	tell process "Claude"
		-- Create a new conversation to avoid context buildup
		keystroke "n" using command down
		delay 1.5

		-- Paste the prompt from clipboard
		keystroke "v" using command down
		delay 1

		-- Press Enter to send
		keystroke return
	end tell
end tell

-- Restore original clipboard contents (after a delay to ensure paste completed)
delay 2
set the clipboard to oldClipboard
