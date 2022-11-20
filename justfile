_default:
    @just --list

# copies repo files to system
sync:
    #!/usr/bin/env nu
    cd ./dotfiles
    git aa
    git commit --allow-empty -m temp-sync
    git df rsh 
    git rslc

# copies system files to repo
sync-rev:
    #!/usr/bin/env nu
    cd ./dotfiles
    git df au
    git df commit --allow-empty -m temp-sync
    git rsh
    git df rslc
