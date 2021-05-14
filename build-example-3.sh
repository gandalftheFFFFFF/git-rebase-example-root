#!/bin/bash


#
# Example 3: Rebasing a feature branch on master with conflicts
# merge
#

# Clean up

export example_name=example-3

rm -rf $example_name
rm -rf $example_name-remote

# Create new repo and make 2 local commits

mkdir $example_name
cd $example_name

git init
echo "print('something')" > main.py

git add main.py
git commit -m "Initial commit"

echo "print('something else')" >> main.py

git add main.py
git commit -m "Second local commit"

# Push to remote

git remote add origin git@github.com:nielspedersen/git-rebase-$example_name.git
git push --force origin master  # Overwrite remote for sake of example

# Clone dir in other folder / feature branch

cd ..
mkdir $example_name-remote
git clone git@github.com:nielspedersen/git-rebase-$example_name.git $example_name-remote
cd $example_name-remote

# Create feature branch
git checkout -b feature1

echo "print('foo')" > main.py

git add main.py
git commit -m "Commit from remote"

# Now back to "master" and commit sommething to main.py

cd ../$example_name
echo "print('local')" >> main.py
git add main.py
git commit -m "Commit to master while working on feature branch"

echo "print('more master')" >> main.py
git add main.py
git commit -m "Another commit to master while still working on feature"

git push origin master

# Back to feature branch and commit again after master has been updated

cd ../$example_name-remote
echo "bar" >> main.py
git add main.py
git commit -m "Feature finished, ready to merge"



# ----------------
# Example ready - should result in no conflict on rebase

# Next steps

# cd example-2-remote
# git fetch (to see remote changes - update origin/master)
# git rebase origin/master

# Conflicts, yay!


