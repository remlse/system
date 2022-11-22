# Dotfiles

## Basic usage

Setup everything by running:

```sh
source <(curl https://setup.remlse.dev)
```

Use these environment variables to modify some aspect of the setup scripts:

| Name        | Effect if set                                               |
| ----------- | ----------------------------------------------------------- |
| `INIT_ONLY` | Only get ssh key and clone the system repo.                 |
| `HEADLESS`  | Skip GUI stuff, e.g. installation of VS Code.               |
| `BW_EMAIL`  | Use to target fork, set to bitwarden account email address. |
| `GIT_HOST`  | Use to target fork, set to host domain of the fork.         |

(Nonsensical) example:

```sh
export INIT_ONLY=true
export HEADLESS=true
export BW_EMAIL=user@domain
export GIT_HOST=github.com
source <(curl https://setup.remlse.dev)
```

## Manual post-setup

- Firefox:
  - Enable Bitwarden extension auto fill
  - Login to sync
  - Toolbar:
    - Bitwarden
    - Checker Plus for Gmail
    - Undo Close Tab
    - Downloads
- MEGA sync

# TODO: this is out of date.

## How to create a fork

- Make sure the name of the branch of the fork is something other than main, to avoid ambiguity. `fork` might be a suitable name.
- You probably want to change `user.email` in `.config/git/config`.
- Check if the username is still `remlse`. Because it is hardcoded, the setup script would have to be modified to support different user names. Probably with another optional environment variable.
- Create another setup script which connects the fork to the original repo as a second remote. Access to the regular GitHub account is necessary. Here's how that might look:

Add `source $setup/fork.sh` to `main.sh`.

`fork.sh`:

```sh
#!/bin/bash

echo "Configuring the dotfiles fork..."

git df config user.email contact@remlse.dev

if ! git df remote | grep $FORK_NAME &> /dev/null ; then
    git df remote rename origin $FORK_NAME > /dev/null
fi
if ! git df remote | grep origin &> /dev/null ; then
    git df remote add -f origin git@github.com:remlse/dotfiles > /dev/null
fi
```
