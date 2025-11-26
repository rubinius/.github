#!/usr/bin/env bash
set -euo pipefail

function project_labels_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} repo-name labels

  Creates issue labels from 'labels' in 'repo-name'.

    where repo-name is a GitHub "owner/repo" string
          labels is a JSON file
EOM
  exit 1
}

if [[ $# -lt 2 ]]; then
  project_labels_usage
fi

repo="$1"
json="$2"

jq -c '.[]' "$json" | while read -r item; do
  label=$(echo "$item" | jq -r '.label')
  color=$(echo "$item" | jq -r '.color')
  description=$(echo "$item" | jq -r '.description')

  echo "→ Checking label: $label"

  if gh label list --repo "$repo" --search "$label" --json name \
       | jq -e --arg lbl "$label" 'map(select(.name == $lbl)) | length > 0' \
       >/dev/null
  then
      echo "   ✓ Exists — skipping"
  else
      echo "   ✚ Creating"
      gh label create "$label" \
          --color "$color" \
          --description "$description" \
          --repo "$repo"
  fi
done
