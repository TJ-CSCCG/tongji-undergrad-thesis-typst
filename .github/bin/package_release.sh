#!/bin/bash

MAIN_BRANCH="main"
PACKAGE_RELEASE_BRANCH="package"
PACKAGE_RELEASE_DIFF=".github/patches/package_release.diff"

set -e

git branch -D $PACKAGE_RELEASE_BRANCH || true

git checkout -b $PACKAGE_RELEASE_BRANCH origin/$MAIN_BRANCH

git apply $PACKAGE_RELEASE_DIFF

git add .

git commit -m "Applied package releasing patch to \`main\` branch"

git push origin $PACKAGE_RELEASE_BRANCH --force

