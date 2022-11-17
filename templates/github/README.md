# GitHub Actions for Mender
Mender team provides `mendersoftware/mender-ci-tools` docker image with pre-installed `mender-cli` and `mender-artifact` tools and GitHub Actions for uploading artifacts and creating deployments.

The image can be used for creating Mender artifact building job, which, with upload artifact and create deployment actions, allows to create CI/CD pipelines ([examples](../../examples/github/)).

## Setup
The actions requires the following Secret is set in a repository Settings:
- `MENDER_SERVER_ACCESS_TOKEN`: Mender Personal Access Token (read the [documentation](https://docs.mender.io/server-integration/using-the-apis#personal-access-tokens) for more information)

## GitHub Actions

### Upload Artifact
[mendersoftware/mender-gh-action-upload-artifact@main](https://github.com/mendersoftware/mender-gh-action-upload-artifact) action to upload an artifact to a Mender server.

### Create Deployment
[mendersoftware/mender-gh-action-create-deployment@main](https://github.com/mendersoftware/mender-gh-action-create-deployment) action to create a deployment on a Mender server.
