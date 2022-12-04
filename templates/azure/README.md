# Azure DevOps Templates for Mender

We use the `mendersoftware/mender-ci-tools` container image with pre-installed `mender-cli` and `mender-artifact` tools to build the Mender Artifacts.

You can find the pipeline examples in the related [folder](../../examples/azure/).

## Templates
The templates are [Azure DevOps step templates with parameters](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/templates?view=azure-devops). The step templates give the flexibility to use them in custom stages and jobs, and allow to build pipelines to work across different environments.

### Upload Artifact
The [Upload Mender Artifact](./mender-artifact-upload.yml) template uploads a Mender Artifact to a Mender server.

The template accepts the following parameters
- `mender_uri`: Mender server's URL (default: https://hosted.mender.io).
- `mender_pat`: Mender Personal Access Token (read the [documentation](https://docs.mender.io/server-integration/using-the-apis#personal-access-tokens) for more information)
- `mender_artifact`: Path of Mender Artifact file, relative to `$(System.DefaultWorkingDirectory)`.

### Create Deployment
The [Create deployment on Mender server](./mender-deployment-create.yml) template creates a deployment on a Mender server.

The template accepts the following parameters
- `mender_uri`: Mender server's URL (default: https://hosted.mender.io).
- `mender_pat`: Mender Personal Access Token (read the [documentation](https://docs.mender.io/server-integration/using-the-apis#personal-access-tokens) for more information)
- `mender_deployment_name`: Mender deployment's name.
- `mender_release_name`: Mender release's name.
- `mender_devices_list`: The list of Mender devices a deployment will be triggered to.
- `mender_deployment_group`: The name of the Mender devices group your deployment will target. One of `mender_deployment_group` or `mender_devices_list` is required. `mender_devices_list` takes the priority if both are set.
