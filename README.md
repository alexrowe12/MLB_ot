# Sports Auto-Prompter

Automatically prompts Claude Desktop every 15 minutes to find and play the best live sports game on The TV App.

**Priority:** Boston teams (Red Sox > Celtics > Bruins > Patriots) → Close MLB games → Any MLB → NBA → NHL → NFL

## Setup

1. Install [Claude Desktop](https://claude.ai/download) with Pro/Max subscription
2. Enable Computer Use in Claude settings
3. Grant macOS permissions: System Settings → Privacy & Security → Accessibility (add Terminal)

## Usage

```bash
./start_prompter.sh   # Start (runs immediately + every 15 min)
./stop_prompter.sh    # Stop
./status_prompter.sh  # Check status
```

## Customize

Edit `sports_prompt.txt` to change teams, priorities, or behavior.
