#!/usr/bin/nu

echo 'Making sure git repos are cloned and setup...'

let-env GIT_SSH_COMMAND = 'ssh -o StrictHostKeyChecking=accept-new'

let repos = [
    git@github.com:remlse/aoc
    git@github.com:remlse/exercism
    git@github.com:remlse/buenzlimarks
    git@github.com:remlse/cargo-templates
    git@github.zhaw.ch:senekrem/zhaw
    ssh://git@git.jetbrains.space/paton/paton/ec-bell
]

mkdir $'($env.HOME)/repos'

for repo in $repos {
    let repo_name = ($repo | path basename)

    if not ($'($env.HOME)/repos/($repo_name)' | path exists) {
        echo $'Cloning ($repo_name)...'
        do -i {
            git clone $repo $'($env.HOME)/repos/($repo_name)' | null
        } | null
    }
}

# zhaw
git config -f $'($env.HOME)/repos/zhaw/.git/config' user.email senekrem@students.zhaw.ch

# ec-bell
git config -f $'($env.HOME)/repos/ec-bell/.git/config' user.email senekrem@students.zhaw.ch
git config -f $'($env.HOME)/repos/ec-bell/.git/config' commit.template dev/commit_msg_tmpl.txt
