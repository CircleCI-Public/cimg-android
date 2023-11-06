#!/usr/bin/env bash

echo "Initializing submodule..."
git submodule update --init --recursive
cd shared || exit && \
git checkout main
if [ -f automated-updates.sh ]; then
  source automated-updates.sh
else
  echo "Check if submodule was loaded; automated-updates.sh is missing"
  exit 1
fi
cd ..

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/circleci/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

GCLOUD_VERSION=$(gcloud version | head -1 | sed 's/[^0-9.]//g')
echo "Gcloud version: "$GCLOUD_VERSION

GRADLE_VERSION=$(brew info gradle | head -1 | sed 's/[^0-9.]//g')
echo "Gradle version: "$GRADLE_VERSION

MAVEN_VERSION=$(brew info maven | head -1 | sed 's/[^0-9.]//g')
echo "Maven version: "$MAVEN_VERSION

BUILD_TOOLS=$(sdkmanager --list | grep "build-tools" | tail -1 | sed 's/.*|\(.*\)|.*/\1/' | sed 's/^[[:space:]]*//' | sed 's/ *$//' | sed -e 's/\s\+/-/g' | sed 's/ /-/g')
echo "Build tools version: "$BUILD_TOOLS

# if [[ $CHANGES -ge 1 ]]; then
#     generateDatedTags
#     ./shared/gen-dockerfiles.sh $RELEASE
# fi

echo "DONE"