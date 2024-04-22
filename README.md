# konflux-consoledot-frontend-build
Repository to store Tekton pipelines and tasks to build containerized frontends from consoledot

## How to use the tasks in this repository

To be able to build a frontend in Konflux, you will need to use the following two Tekton tasks:

- [parse-build-deploy-script](./tasks/parse-build-deploy-script/parse-build-deploy-script.yaml)
- [create-frontend-dockerfile](./tasks/create-frontend-dockerfile/create-frontend-dockerfile.yaml)

You will need to add these two tasks in your two Tekton pipelines inside your `.tekton` directory. You can find an example on how to do this in this same repo in the `.tekton` directory.

### parse-build-deploy-script task

You can find the example on how we are using it for the tests in this repository in the [PR pipeline](.tekton/consoledot-frontend-build-tests-pull-request.yaml#L211), and in the [on push pipeline](.tekton/consoledot-frontend-build-tests-push.yaml#L207). 

Important points to consider:

- Don't forget to check how to use the parameters in this [file](./tasks/parse-build-deploy-script/README.md)
- The `taskRef` in your pipeline should be like this:
```yaml
      taskRef:
        resolver: git
        params:
          - name: url
            value: https://github.com/RedHatInsights/konflux-consoledot-frontend-build
          - name: revision
            value: main
          - name: pathInRepo
            value: tasks/parse-build-deploy-script/parse-build-deploy-script.yaml
```
- Make sure to create the `runAfter` attribute and set it up to run after the `clone-repository`.

### create-frontend-dockerfile task

You can find the example on how we are using it for the tests in this repository in the [PR pipeline](.tekton/consoledot-frontend-build-tests-pull-request.yaml#L229), and in the [on push pipeline](.tekton/consoledot-frontend-build-tests-push.yaml#L225). 

Important points to consider:

- Don't forget to check how to use the parameters in this [file](./tasks/create-frontend-dockerfile/README.md)
- The `taskRef` in your pipeline should be like this:
```yaml
      taskRef:
        resolver: git
        params:
          - name: url
            value: https://github.com/RedHatInsights/konflux-consoledot-frontend-build
          - name: revision
            value: main
          - name: pathInRepo
            value: tasks/create-frontend-dockerfile/create-frontend-dockerfile.yaml
```
- Make sure to update the `runAfter` attribute of the `build-container` task to run after this task and `prefetch-dependencies`, and not after `clone-repository` as it was set up.

## How to use the tests

All the tasks need to be tested in the pipelines in the `.tekton` directory. Make sure the name of your task is the same name
of the subdirectory where it is stored inside the `tasks` directory. 

After creating the task, you should add your task to the [`./tests/scripts/.tasks`](./tests/scripts/.tasks) file in the corresponding
list or lists. If it is a task that has to run with PRs, add it to the `pr_tasks` list, if it needs to run with pushes to main, add it
to the `push_tasks` list, and if it is a demo/draft task that doesn't need to be tested, add it to the `no_test_tasks` list.

Make sure that you are actually testing your task in the corresponding pipeline(s) or the test will fail.
