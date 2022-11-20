#!/bin/bash

echo "Making sure git repos are cloned and setup..."

export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=accept-new"

repos=(
    git@github.com:remlse/aoc
    git@github.com:remlse/buenzlimarks
    ssh://git@git.jetbrains.space/paton/paton/ec-bell
)

[ -d $HOME/repos ] || mkdir $HOME/repos

for repo in "${repos[@]}"; do
    repo_name="$(basename $repo)"
    echo "$repo_name..."
    if [ ! -d $HOME/repos/$repo_name ]; then
        git clone $repo $HOME/repos/$repo_name > /dev/null
    fi
done

# ec-bell
git config -f $HOME/repos/ec-bell/.git/config user.email senekrem@students.zhaw.ch
git config -f $HOME/repos/ec-bell/.git/config commit.template dev/commit_msg_tmpl.txt
