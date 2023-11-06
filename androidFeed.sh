#!/bin/bash

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

FASTLANE_VERSION=$(brew info gradle | head -1 | sed 's/[^0-9.]//g')
echo "Fastlane version: "$FASTLANE_VERSION

BUILD_TOOLS_VERSIONS=$(sdkmanager --list | grep "build-tools" | awk -F';' '{print $2}' | awk -F'|' '{print $1}' | sort -t. -k1,1n -k2,2n -k3,3 -k4 -s | awk -F. '!seen[$1"."$2"-"$3]++' | sort -t. -Vr | awk -F. '!seen[$1]++' | head -n 3)

readarray -t BUILD_TOOLS_ARRAY <<< "$BUILD_TOOLS_VERSIONS"

echo ${BUILD_TOOLS_ARRAY[@]}

PLATFORMS=$(sdkmanager --list | grep "platforms;android" | cut -d'|' -f1 | grep -v 'Sandbox' | grep -v 'ext' | sort -t- -nk2 | tr -d '[:blank:]' | awk -F- '!seen[$NF]++' | tail -7)

readarray -t $PLATFORMS_ARRAY <<< "$PLATFORMS"

echo ${PLATFORMS_ARRAY[@]}

sed -i '37c\ENV MAVEN_VERSION=3.9.6' Dockerfile.template

cat Dockerfile.template

# if [[ $CHANGES -ge 1 ]]; then
#     generateDatedTags
#     ./shared/gen-dockerfiles.sh $RELEASE
# fi

echo "DONE"