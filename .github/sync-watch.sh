#!/bin/bash
# ROSI Design Token Sync — monitors ResonantOS repos for CSS/design changes
# Run by Nami cron job

REPO="ResonantOS/resonantos-vnext"
LOCAL_DIR="/Users/labmacbook/Nstudio/public-community/projects/resonant-os/design-system"
STATE_FILE="$LOCAL_DIR/.sync-state.json"
BRANCH="main"

# Files to monitor (CSS + key UI files)
WATCH_PATHS=(
  "src/styles/base.css"
  "src/styles/shell.css"
  "src/modules/browser/browser.css"
  "src/modules/chat/chat-rail.css"
  "src/modules/chat/messages.css"
  "src/modules/delegation/delegation.css"
  "src/styles/workspace-cards.css"
  "src/styles/responsive.css"
  "docs/product/UX-001-resonantos-app-shell.md"
  "docs/architecture/ADR-017-resonant-browser-addon.md"
)

cd "$LOCAL_DIR" || exit 1

# Initialize state file if missing
if [ ! -f "$STATE_FILE" ]; then
  echo '{"last_check": "", "shas": {}}' > "$STATE_FILE"
fi

CHANGES=""
ANY_CHANGE=false

for path in "${WATCH_PATHS[@]}"; do
  # Get current SHA from GitHub
  sha=$(gh api "/repos/$REPO/contents/$path?ref=$BRANCH" --jq '.sha' 2>/dev/null)
  
  if [ -z "$sha" ]; then
    continue
  fi
  
  # Get stored SHA
  key=$(echo "$path" | tr '/' '_')
  stored_sha=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(d.get('shas',{}).get('$key',''))" 2>/dev/null)
  
  if [ "$stored_sha" != "$sha" ]; then
    stored_short=$(echo "$stored_sha" | cut -c1-7)
    sha_short=$(echo "$sha" | cut -c1-7)
    CHANGES="$CHANGES\n$path: ${stored_short} → ${sha_short}"
    ANY_CHANGE=true
    
    # Update state
    python3 -c "
import json
with open('$STATE_FILE','r') as f: d=json.load(f)
d.setdefault('shas',{})['$key']='$sha'
with open('$STATE_FILE','w') as f: json.dump(d,f,indent=2)
"
  fi
done

# Update last check timestamp
python3 -c "
import json
from datetime import datetime
with open('$STATE_FILE','r') as f: d=json.load(f)
d['last_check']=datetime.utcnow().isoformat()+'Z'
with open('$STATE_FILE','w') as f: json.dump(d,f,indent=2)
"

if [ "$ANY_CHANGE" = true ]; then
  echo "CHANGES_DETECTED"
  echo -e "$CHANGES"
else
  echo "NO_CHANGES"
fi
