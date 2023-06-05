# CircleCI Docker Convenience Image Contributions

We welcome all contributions to our CircleCI Docker Convenience Image repositories from the community!

This file outlines best practices for contributions and what you can expect from the images team at CircleCI.

## Image Support Policy

For our official CircleCI Docker Convenience Image support policy, please see [CircleCI docs](https://circleci.com/docs/convenience-images-support-policy).

This policy outlines the release, update, and deprecation policy for CircleCI Docker Convenience Images.

## Issues

Please open issues for feature requests and bug reports. Depending on the type of issue, please fill out the issue template with as much information as possible.

The more information you can provide about your issue, the better we can help address the issue promptly!

For feature requests, in order for us to add a tool within the image, it has to be something that is maintained and useful to a majority of CircleCI users. Every tool added makes the image larger and slower for all users, so any new additions need to be carefully thought out.

While we make every effort to respond to issues quickly, however please note that we do not provide an official SLA for this.

## Contributions and Pull Requests

When making changes to CircleCI Docker Convenience Images, please only make these changes in the `Dockerfile.template` file in the root of the repository.

Our build and releases scripts generate new Dockerfiles based on the `Dockerfile.template` file and overwrite the Dockerfiles in the version directories. Therefore, only changes made to the `Dockerfile.template` file will be valid for a pull request as changes to other files will be lost.

Additionally, please do not make changes to any of the build or push bash script files as these are also automatically generated.

Ensure extra layers are not added to the Dockerfile where it is not necessary. We aim to keep layer count low to ensure good caching in the CircleCI execution environment.

Please fill out the pull request template when opening a new pull request. This helps us to look into new pull requests in a timely manner.

While we make every effort to respond to pull requests quickly, however please note that we do not provide an official SLA for this.
