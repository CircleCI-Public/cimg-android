# vim:set ft=dockerfile:

FROM cimg/android:2021.10.1

LABEL maintainer="Community & Partner Engineering Team <community-partner@circleci.com>"

RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "cmake;3.6.4111459" && \
	echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "cmake;3.10.2.4988404"

# Setup LTS release
ENV NDK_LTS_VERSION "23.0.7599858"
ENV ANDROID_NDK_HOME "/home/circleci/android-sdk/ndk/${NDK_LTS_VERSION}"
RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "ndk;${NDK_LTS_VERSION}"

ENV ANDROID_NDK_ROOT "${ANDROID_NDK_HOME}"
ENV PATH "${ANDROID_NDK_HOME}:${PATH}"

# Setup Stable release
ENV NDK_STABLE_VERSION "22.1.7171670"
RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "ndk;${NDK_STABLE_VERSION}"
