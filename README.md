<div align="center">
	<p>
		<img alt="CircleCI Logo" src="https://raw.github.com/CircleCI-Public/cimg-go/master/img/circle-circleci.svg?sanitize=true" width="75" />
		<img alt="Docker Logo" src="https://raw.github.com/CircleCI-Public/cimg-go/master/img/circle-docker.svg?sanitize=true" width="75" />
		<img alt="Android Logo" src="https://raw.github.com/CircleCI-Public/cimg-go/master/img/circle-android.svg?sanitize=true" width="75" />
	</p>
	<h1>CircleCI Convenience Images => Android</h1>
	<h3>A Continuous Integration focused Android Docker image built to run on CircleCI</h3>
</div>

[![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/cimg-android.svg?style=shield)](https://circleci.com/gh/CircleCI-Public/cimg-android) [![Software License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/CircleCI-Public/cimg-android/main/LICENSE) [![Docker Pulls](https://img.shields.io/docker/pulls/cimg/android)](https://hub.docker.com/r/cimg/android) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/circleci-images)

***This image is in beta. What's included and how it works can change before reaching General Availability.***

***This image is designed to supercede the legacy CircleCI Android image, `circleci/android`.***

`cimg/Android` is a Docker image created by CircleCI with continuous integration builds in mind.
Each tag contains a complete Go version and toolchain, the testing wrapper `gotestsum`, and any binaries and tools that are required for builds to complete successfully in a CircleCI environment.


## Table of Contents

- [Getting Started](#getting-started)
- [How This Image Works](#how-this-image-works)
- [Development](#development)
- [Contributing](#contributing)
- [Additional Resources](#additional-resources)
- [License](#license)


## Getting Started

This image can be used with the CircleCI `docker` executor.
For example:

```yaml
jobs:
  build:
    docker:
      - image: cimg/go:1.16
    steps:
      - checkout
      - run: go version
```

In the above example, the CircleCI Go Docker image is used for the primary container.
More specifically, the tag `1.13` is used meaning the version of Go will be Go v1.13.
You can now use Go within the steps for this job.


## How This Image Works

This image contains the Go programming language and its complete toolchain.
This includes support for Go modules, the official Go Proxy Server, etc.

### Variants

Variant images typically contain the same base software, but with a few additional modifications.

#### Node.js

The Node.js variant is the same Go image but with Node.js also installed.
The Node.js variant will be used by appending `-node` to the end of an existing `cimg/go` tag.

```yaml
jobs:
  build:
    docker:
      - image: cimg/go:1.13-node
    steps:
      - checkout
      - run: go version
      - run: node --version
```

#### Browsers

The browsers variant is the same Go image but with Node.js, Java, Selenium, and browser dependencies pre-installed via apt.
The browsers variant can be used by appending `-browser` to the end of an existing `cimg/go` tag.
The browsers variant is designed to work in conjunction with the [CircleCI Browser Tools orb](https://circleci.com/developer/orbs/orb/circleci/browser-tools).
You can use the orb to install a version of Google Chrome and/or Firefox into your build. The image contains all of the supporting tools needed to use both the browser and its driver.

```yaml
orbs:
  browser-tools: circleci/browser-tools@1.1
jobs:
  build:
    docker:
      - image: cimg/go:1.13-browsers
    steps:
      - browser-tools/install-browser-tools
      - checkout
      - run: |
          go version
          node --version
          java --version
          google-chrome --version
```

### Tagging Scheme

This image has the following tagging scheme:

```
cimg/go:<go-version>[-variant]
```

`<go-version>` - The version of Go to use.
This can be a full SemVer point release (such as `1.12.7`) or just the minor release (such as `1.12`).
If you use the minor release tag, it will automatically point to future patch updates as they are released by the Go Team.
For example, the tag `1.13` points to Go v1.13 now, but when the next release comes out, it will point to Go v1.13.1.

`[-variant]` - Variant tags, if available, can optionally be used.
Once the Node.js variant is available, it could be used like this: `cimg/go:1.13-node`.


## Development

Images can be built and run locally with this repository.
This has the following requirements:

- local machine of Linux (Ubuntu tested) or macOS
- modern version of Bash (v4+)
- modern version of Docker Engine (v19.03+)

### Cloning For Community Users (no write access to this repository)

Fork this repository on GitHub.
When you get your clone URL, you'll want to add `--recurse-submodules` to the clone command in order to populate the Git submodule contained in this repo.
It would look something like this:

```bash
git clone --recurse-submodules <my-clone-url>
```

If you missed this step and already cloned, you can just run `git submodule update --recursive` to populate the submodule.
Then you can optionally add this repo as an upstream to your own:

```bash
git remote add upstream https://github.com/CircleCI-Public/cimg-go.git
```

### Cloning For Maintainers ( you have write access to this repository)

Clone the project with the following command so that you populate the submodule:

```bash
git clone --recurse-submodules git@github.com:CircleCI-Public/cimg-go.git
```

### Generating Dockerfiles

Dockerfiles can be generated for a specific Go version using the `gen-dockerfiles.sh` script.
For example, to generate the Dockerfile for Go v1.13, you would run the following from the root of the repo:

```bash
./shared/gen-dockerfiles.sh 1.13
```

The generated Dockerfile will be located at `./1.13/Dockefile`.
To build this image locally and try it out, you can run the following:

```bash
cd 1.13
docker build -t test/go:1.13 .
docker run -it test/go:1.13 bash
```

### Building the Dockerfiles

To build the Docker images locally as this repository does, you'll want to run the `build-images.sh` script:

```bash
./build-images.sh
```

This would need to be run after generating the Dockerfiles first.
When releasing proper images for CircleCI, this script is run from a CircleCI pipeline and not locally.

### Publishing Official Images (for Maintainers only)

The individual scripts (above) can be used to create the correct files for an image, and then added to a new git branch, committed, etc.
A release script is included to make this process easier.
To make a proper release for this image, let's use the fake Go version of Go v9.99, you would run the following from the repo root:

```bash
./shared/release.sh 9.99
```

This will automatically create a new Git branch, generate the Dockerfile(s), stage the changes, commit them, and push them to GitHub.
The commit message will end with the string `[release]`.
This string is used by CircleCI to know when to push images to Docker Hub.
All that would need to be done after that is:

- wait for build to pass on CircleCI
- review the PR
- merge the PR

The master branch build will then publish a release.

### Incorporating Changes

How changes are incorporated into this image depends on where they come from.

**build scripts** - Changes within the `./shared` submodule happen in its [own repository](https://github.com/CircleCI-Public/cimg-shared).
For those changes to affect this image, the submodule needs to be updated.
Typically like this:

```bash
cd shared
git pull
cd ..
git add shared
git commit -m "Updating submodule for foo."
```

**parent image** - By design, when changes happen to a parent image, they don't appear in existing Go images.
This is to aid in "determinism" and prevent breaking customer builds.
New Go images will automatically pick up the changes.

If you *really* want to publish changes from a parent image into the Go image, you have to build a specific image version as if it was a new image.
This will create a new Dockerfile and once published, a new image.

**Go specific changes** - Editing the `Dockerfile.template` file in this repo will modify the Go image specifically.
Don't forget that to see any of these changes locally, the `gen-dockerfiles.sh` script will need to be run again (see above).


## Contributing

We encourage [issues](https://github.com/CircleCI-Public/cimg-go/issues) and [pull requests](https://github.com/CircleCI-Public/cimg-go/pulls) against this repository. In order to value your time, here are some things to consider:

1. We won't include just anything in this image. In order for us to add a tool within the Go image, it has to be something that is maintained and useful to a large number of Gophers (Go developers). Every tool added makes the image larger and slower for all users so being thorough on what goes in the image will benefit everyone.
1. PRs are welcome. If you have a PR that will potentially take a large amount of time to make, it will be better to open an issue to discuss it first to make sure it's something worth investing the time in.
1. Issues should be used to report bugs or request additional/removal of tools in this image. For help with images, please visit [CircleCI Discuss](https://discuss.circleci.com/c/ecosystem/circleci-images).


## Additional Resources

[CircleCI Docs](https://circleci.com/docs/) - The official CircleCI Documentation website.
[CircleCI Configuration Reference](https://circleci.com/docs/2.0/configuration-reference/#section=configuration) - From CircleCI Docs, the configuration reference page is one of the most useful pages we have.
It will list all of the keys and values supported in `.circleci/config.yml`.
[Docker Docs](https://docs.docker.com/) - For simple projects this won't be needed but if you want to dive deeper into learning Docker, this is a great resource.


## License

This repository is licensed under the MIT license.
The license can be found [here](./LICENSE).
