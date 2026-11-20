#!/bin/bash
#set -x
session="$1"         # e.g., moonswitch / otto
chrome_profile="$2"  # e.g., "Profile 1" / "Profile 2" or "Moonswitch" / "Otto"
chrome_bin="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

if [[ ! -x "$chrome_bin" ]]; then
echo "Chrome binary not found: $chrome_bin" >&2
exit 1
fi

out="$(mktemp -t aws-sso-login)"
aws sso login --sso-session "$session" --no-browser --use-device-code >"$out" 2>&1 &
pid=$!

url_with_code="" fallback_url="" opened=0
while kill -0 $pid 2>/dev/null; do
url_with_code="$(
  { grep -A1 -i 'autofill' "$out" | grep -Eo 'https?://[^ ]+'
    grep -Eo 'https?://[^ ]+user_code=[A-Za-z0-9-]+' "$out"
  } | tail -n1
)"
fallback_url="$(grep -Eo 'https?://[^ ]+' "$out" | tail -n1)"
if [[ -n "$url_with_code" ]]; then
    "$chrome_bin" --profile-directory="$chrome_profile" --new-tab "$url_with_code" >/dev/null 2>&1 &
    opened=1
    break
fi
sleep 0.2
done

if [[ $opened -eq 0 && -n "$fallback_url" ]]; then
"$chrome_bin" --profile-directory="$chrome_profile" --new-tab "$fallback_url" >/dev/null 2>&1 &
opened=1
fi

if [[ $opened -eq 0 ]]; then
echo "Failed to capture device URL. aws output follows:" >&2
cat "$out" >&2
fi

wait $pid
exit_code=$?
rm -f "$out"
exit $exit_code
