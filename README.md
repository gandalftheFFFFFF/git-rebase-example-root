# git rebase example

This is a project for showcasing a few scenarios where git rebase can be used
for a cleaner history.

There are three examples, and each example consists of 1 github.com repo, and 2
local dirs; one that is a standard local git repo, and another that simulates
commits from other developers who commit to remote.

# How to set up

- Create three repositories on github named: `git-rebase-example-1`,
  `git-rebase-example-2` and `git-rebase-example-3`
- Run each build script to create a situation which can be solved using a
  normal merge and a rebase

```
chmod +x build-example-1.sh
./build-example-1.sh
```

Wait for the script to finish, and then verify that two dirs have been created
for each script run:

```
ls -l
drwxr-xr-x  5 niels  staff   160 May 13 22:32 example-1
drwxr-xr-x  5 niels  staff   160 May 13 22:31 example-1-remote
```

Enter the `example-1` dir and check out the build script for insctructions (at
the bottom of the file) on how to:

1. Follow the default workflow and creating a merge commit
2. Following the rebase example and rebasing the local commits on the
   origin/master branch and then pushing


