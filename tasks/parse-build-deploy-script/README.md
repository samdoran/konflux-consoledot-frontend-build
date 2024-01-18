# parse-build-deploy-script

Tekton task that collects env variables to pass to other tasks in the pipeline.

## Parameters

| Name | Description | Optional | default |
|------|-------------|----------|---------|
| subdirectory | directory in the `output` workspace to clone the repo into. | Yes | source |
| path-context | path context directory inside the repo | Yes | "" |
