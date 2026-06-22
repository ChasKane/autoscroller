#!/bin/bash

# Update version in manifest.json, versions.json, and package.json first.
# Then set TAG and NOTES below and run this script.

TAG="1.1.5"
FILES=("manifest.json" "main.js" "styles.css")
NOTES="Rename to Drift Scroll."

npm run build
npm run lint

git add -A && git commit -m "version bump: $TAG"
git tag "$TAG"
git push --follow-tags
gh release create "$TAG" "${FILES[@]}" --title "$TAG" --notes "$NOTES"
