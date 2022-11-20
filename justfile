_default:
    @just --list

sync:
    #!/usr/bin/env nu
    cd ../dotfiles
    git aa
    git commit --allow-empty
    temp-sync
    git df rsh 
    git rslc

sync-rev:
    #!/usr/bin/env nu
    cd ../dotfiles
    git df au
    git df commit --allow-empty
    temp-sync
    git rsh
    git df rslc
