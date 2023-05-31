# vim:set ft=dockerfile:

FROM cimg/android:2023.06.1-node

LABEL maintainer="CircleCI Community & Partner Engineering Team <community-partner@circleci.com>"

# Install Selenium
ENV SELENIUM_VER=3.141.59
RUN curl -sSL -o selenium-server-standalone-${SELENIUM_VER}.jar "https://selenium-release.storage.googleapis.com/${SELENIUM_VER%.*}/selenium-server-standalone-${SELENIUM_VER}.jar" && \
    sudo cp selenium-server-standalone-${SELENIUM_VER}.jar /usr/local/bin/selenium.jar && \
    rm selenium-server-standalone-${SELENIUM_VER}.jar

RUN sudo apt-get update && \
	sudo apt-get install --yes --no-install-recommends \
		xvfb \
	&& \

    # Install Java only if it's not already available
    # Java is installed for Selenium
    if ! command -v java > /dev/null; then \
        echo "Java not found in parent image, installing..." && \
        sudo apt-get install -y --no-install-recommends --no-upgrade openjdk-11-jre; \
    fi && \
	sudo rm -rf /var/lib/apt/lists/*

# Below is setup to allow xvfb to start when the container starts up.
# The label in particular allows this image to override what CircleCI does
# when booting the image.
LABEL com.circleci.preserve-entrypoint=true
ENV DISPLAY=":99"
#RUN	printf '#!/bin/sh\nXvfb :99 -screen 0 1280x1024x24 &\nexec "$@"\n' > /tmp/entrypoint && \
#	chmod +x /tmp/entrypoint && \
#	sudo mv /tmp/entrypoint /docker-entrypoint.sh
RUN	printf '#!/bin/sh\nXvfb :99 -screen 0 1280x1024x24 &\nexec "$@"\n' | sudo tee /docker-entrypoint.sh && \
	sudo chmod +x /docker-entrypoint.sh

# Install a single version of Firefox. This isn't intended to be a regularly
# updated thing. Instead, if this version of Firefox isn't what the end user
# wants they should install a different version via the Browser Tools Orb.
#
# Canonical made a major technology change in how Firefox is installed from
# Ubuntu 21.10 and up. The general CI space doesn't seem to be ready for a snap
# based Firefox right now so we are installing it from the Mozilla PPA.
RUN echo 'Package: *' | sudo tee -a /etc/apt/preferences.d/firefox.pref && \
	echo 'Pin: release o=LP-PPA-mozillateam' | sudo tee -a /etc/apt/preferences.d/firefox.pref && \
	echo 'Pin-Priority: 1001' | sudo tee -a /etc/apt/preferences.d/firefox.pref && \
	sudo add-apt-repository --yes ppa:mozillateam/ppa && \
	sudo apt-get install --no-install-recommends --yes firefox && \
	sudo rm -rf /var/lib/apt/lists/* && \
	firefox --version

# Install a single version of Google Chrome Stable. This isn't intended to be a
# regularly updated thing. Instead, if this version of Chrome isn't what the
# end user wants they should install a different version via the Browser Tools
# Orb.
RUN wget -q -O - "https://dl.google.com/linux/linux_signing_key.pub" | sudo apt-key add - && \
	echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list && \
	sudo apt-get update && \
	sudo apt-get install google-chrome-stable && \
	sudo rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/sh"]
