# vim:set ft=dockerfile:

FROM cimg/android:2024.04.1

LABEL maintainer="Community & Partner Engineering Team <community-partner@circleci.com>"

RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "cmake;3.18.1" && \
	echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "cmake;3.22.1"

# Use the last two versions of the NDK
# Setup LTS release
ENV NDK_LTS_VERSION "26.3.11579264"
ENV ANDROID_NDK_HOME "/home/circleci/android-sdk/ndk/${NDK_LTS_VERSION}"
RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "ndk;${NDK_LTS_VERSION}"

ENV ANDROID_NDK_ROOT "${ANDROID_NDK_HOME}"
ENV PATH "${ANDROID_NDK_HOME}:${PATH}"

# Setup Stable release
ENV NDK_STABLE_VERSION "25.2.9519653"
RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "ndk;${NDK_STABLE_VERSION}"
