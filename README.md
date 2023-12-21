# rhtap-consoledot-frontend-build
Repository to store Tekton pipelines and tasks to build containerized frontends from consoledot

## How to use the tests

All the tasks need to be tested in the pipelines in the `.tekton` directory. Make sure the name of your task is the same name
of the subdirectory where it is stored inside the `tasks` directory. 

After creating the task, you should add your task to the [`./tests/scripts/.tasks`](./tests/scripts/.tasks) file in the corresponding
list or lists. If it is a task that has to run with PRs, add it to the `pr_tasks` list, if it needs to run with pushes to main, add it
to the `push_tasks` list, and if it is a demo/draft task that doesn't need to be tested, add it to the `no_test_tasks` list.

Make sure that you are actually testing your task in the corresponding pipeline(s) or the test will fail.
