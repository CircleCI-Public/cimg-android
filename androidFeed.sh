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

sdkmanager --update

GCLOUD_VERSION=$(gcloud version | head -1 | sed 's/[^0-9.]//g')
echo "Gcloud version: "$GCLOUD_VERSION

GRADLE_VERSION=$(curl --silent "https://api.github.com/repos/gradle/gradle/releases/latest" | jq -r .tag_name | sed 's/^[^0-9]*//')
echo "Gradle version: "$GRADLE_VERSION

MAVEN_VERSION=$(curl --silent "https://api.github.com/repos/apache/maven/releases/latest" | jq -r .tag_name | sed 's/^[^0-9]*//')
echo "Maven version: "$MAVEN_VERSION

FASTLANE_VERSION=$(curl --silent "https://api.github.com/repos/fastlane/fastlane/releases/latest" | jq -r .tag_name)
echo "Fastlane version: "$FASTLANE_VERSION

BUILD_TOOLS_VERSIONS=$(sdkmanager --list | grep "build-tools" | awk -F';' '{print $2}' | awk -F'|' '{print $1}' | sort -t. -k1,1n -k2,2n -k3,3 -k4 -s | awk -F. '!seen[$1"."$2"-"$3]++' | sort -t. -Vr | awk -F. '!seen[$1]++' | tr -d '[:blank:]' | head -n 3)

readarray -t BUILD_TOOLS_ARRAY <<< "$BUILD_TOOLS_VERSIONS"

PLATFORMS=$(sdkmanager --list | grep "platforms;android" | cut -d'|' -f1 | grep -v 'Sandbox' | grep -v 'ext' | sort -t- -nk2 | tr -d '[:blank:]' | awk -F- '!seen[$NF]++' | tail -7)

readarray -t $PLATFORMS_ARRAY <<< "$PLATFORMS"

sed -i '37c\ENV MAVEN_VERSION='"$MAVEN_VERSION"'' Dockerfile.template
sed -i '44c\ENV GRADLE_VERSION='"$GRADLE_VERSION"'' Dockerfile.template
sed -i '62c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${BUILD_TOOLS_ARRAY[0]}"' && \\' Dockerfile.template
sed -i '63c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${BUILD_TOOLS_ARRAY[1]}"' && \\' Dockerfile.template 
sed -i '64c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${BUILD_TOOLS_ARRAY[2]}"' && \\' Dockerfile.template
sed -i '66c\RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[0]}"' && \\' Dockerfile.template
sed -i '67c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[1]}"' && \\' Dockerfile.template
sed -i '68c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[2]}"' && \\' Dockerfile.template
sed -i '69c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[3]}"' && \\' Dockerfile.template
sed -i '70c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[4]}"' && \\' Dockerfile.template
sed -i '71c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[5]}"' && \\' Dockerfile.template
sed -i '72c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[6]}"' && \\' Dockerfile.template
sed -i '73c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager '"${PLATFORMS_ARRAY[7]}"'' Dockerfile.template
sed -i '78c\    sudo gem install fastlane --version '"$FASTLANE_VERSION"' --no-document && \\' Dockerfile.template
sed -i '83c\ENV GCLOUD_VERSION='"$GCLOUD_VERSION"'' Dockerfile.template > newDockerfile.template && mv newDockerfile.template Dockerfile.template

generateDatedTags
./shared/release.sh $RELEASE

echo "yay it finished"