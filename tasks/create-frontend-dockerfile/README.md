# create-frontend-dockerfile

Tekton task that uses the frontend builder container to create a Dockerfile to build a Consoledot Frontend application.

## Parameters

| Name               | Description                                                       | Optional | Default value |
|--------------------|-------------------------------------------------------------------|----------|---------------|
| subdirectory       | directory in the `output` Workspace to clone the repo into        | Yes      | source        |
| path-context       | path context directory inside the repo                            | No       | -             |
| component          | name of app-sre application folder this component lives in        | No       | -             |
| image              | image should match the quay repo set by app.yaml in app-interface | No       | -             |
| quay-expire-time   | time for the image to expire in Quay. Default is 3 days           | Yes      | 3d            |
| npm-build-script   | npm script to run at build time                                   | Yes      | build         |
| yarn-build-script  | yarn script to run at build time                                  | Yes      | build:prod    |
| route-path         | path for the app to be stored                                     | Yes      | ""            |
| beta-route-path    | path for the beta app to be stored                                | Yes      | ""            |
| preview-route-path | path for the preview app to be stored                             | Yes      | ""            |
| ci-root            | root of the ci.sh script                                          | Yes      | ""            |
| server-name        | name of the server. If empty, same as the app name                | Yes      | ""            |
| dist-folder        | directory where the app.info.json will be written                 | Yes      | ""            |
