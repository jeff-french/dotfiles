#!/bin/bash
# clearaws.sh - Clear AWS credential environment variables.

# Ensure the script is sourced.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Error: This script must be sourced. Run 'source clearaws.sh'" >&2
  exit 1
fi

# Unset AWS-related environment variables.
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN
unset BUCKETEER_AWS_ACCESS_KEY_ID
unset AWS_DEFAULT_REGION
unset AWS_PROFILE

echo "AWS credentials cleared from the environment."

