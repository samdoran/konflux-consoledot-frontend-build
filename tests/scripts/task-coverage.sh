#!/bin/bash

set -ex

# Get lists of tasks to check
tasks_lists_file_path=tests/scripts/.tasks
source "$tasks_lists_file_path"

# Get the name of the tasks from the directories.
# It is important that all tasks are called exactly as their directory.
tasks=$(ls tasks)

# Check that there is at least one match for each task in the .tasks file
for task in $tasks
do
    grep "$task" "$tasks_lists_file_path" > /dev/null || { echo "$task not found in .tasks file. Please add it to the corresponding list(s)" >&2; exit 1; }
done

pr_file_path=.tekton/konflux-consoledot-frontend-build-pull-request.yaml
push_file_path=.tekton/konflux-consoledot-frontend-build-push.yaml

# Check that PR tasks are being tested in the PR pipeline
for task in $pr_tasks
do
    grep "$task" "$pr_file_path" > /dev/null || { echo "$task is not being tested in the PR pipeline. Please do" >&2; exit 1; }
done

# Check that push tasks are being tested in the push pipeline
for task in $push_tasks
do
    grep "$task" "$push_file_path" > /dev/null || { echo "$task is not being tested in the push pipeline. Please do" >&2; exit 1; }
done
