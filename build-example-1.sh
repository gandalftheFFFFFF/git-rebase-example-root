#!/bin/bash

# Clean up

rm -rf example-1
rm -rf example-1-remote

# Create new repo and make 2 local commits

mkdir example-1
cd example-1

git init
echo "print('something')" > main.py

git add main.py
git commit -m "Initial commit"

echo "print('something else')" >> main.py

git add main.py
git commit -m "Second local commit"

# Push to remote

git remote add origin git@github.com:nielspedersen/git-rebase-example-1.git
git push --force origin master  # Overwrite remote for sake of example

# Clone dir in other folder

cd ..
mkdir example-1-remote
git clone git@github.com:nielspedersen/git-rebase-example-1.git example-1-remote
cd example-1-remote

echo "print('foo')" > other.py

git add other.py
git commit -m "Commit from remote"
git push origin master

# Now back to "local" and commit sommething to main.py

cd ../example-1
echo "print('local')" >> main.py
git add main.py
git commit -m "Commit to local while remote is ahead"

# Example ready - should result in no conflict on rebase

# Next steps

# git push origin master
# git pull origin master

# Results in ugly merge commit /barf

# Revert back to before git pull
# git reset --hard HEAD~1

# Now do a git rebase origin/master

