# vim:set ft=dockerfile:

FROM cimg/android:2025.03.1

LABEL maintainer="Community & Partner Engineering Team <community-partner@circleci.com>"

RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "cmake;3.31.4" && \
	echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "cmake;3.31.5"

# Use the last two versions of the NDK
# Setup LTS release
ENV NDK_LTS_VERSION "28.0.13004108"
ENV ANDROID_NDK_HOME "/home/circleci/android-sdk/ndk/${NDK_LTS_VERSION}"
RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "ndk;${NDK_LTS_VERSION}"

ENV ANDROID_NDK_ROOT "${ANDROID_NDK_HOME}"
ENV PATH "${ANDROID_NDK_HOME}:${PATH}"

# Setup Stable release
ENV NDK_STABLE_VERSION "27.2.12479018"
RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "ndk;${NDK_STABLE_VERSION}"
