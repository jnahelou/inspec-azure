#!/bin/bash

set -exou pipefail

PRODUCT=inspec-azure
CURRENTDATE=$(date +"%Y-%m-%d")


# Download the release-notes for our specific build
curl -o release-notes.md "https://packages.chef.io/release-notes/${PRODUCT}/${CURRENTDATE}.md"

topic_title="Chef InSpec Azure Cloud Resources $CURRENTDATE Released!"
topic_body=$(cat <<EOH
We are delighted to announce the availability of Chef InSpec Azure Cloud Resources.
$(cat release-notes.md)

---
## Get the Resources

You can access InSpec Cloud Resources directly from ...
EOH
)

# Use Expeditor's built in Bash helper to post our message: https://git.io/JvxPm
post_discourse_release_announcement "$topic_title" "$topic_body"

# Cleanup
rm release-notes.md
