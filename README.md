# Machine

A simple script to setup a new macbook alongside a lightweight disposable development environment for hacking, experiments, and playing around with new tools. Inspired by [Mitchell Hashimoto](https://github.com/mitchellh/nixos-config) and [Ivan Velichko](https://iximiuz.com/en/posts/how-to-setup-development-environment/) and born out of a need to jump from laptop to laptop.

## Table of Contents <!-- omit in toc -->

- [Installation](#installation)
- [Devbox usage](#devbox-usage)
- [Connecting vscode to devbox](#connecting-vscode-to-devbox)
- [License](#license)

## Installation

Step 1. If setting up new macbook from scratch, download the project as ZIP and move to the home dir

```bash
mv ~/Downloads/machine-main ~/machine
```

if gh or git is already present, then clone from github

```bash
gh repo clone emmanueletti/machine
```

Step 2. Make the install script executable

```bash
cd ~/machine
chmod +x ./setup.sh
```

Step 3. Run the script to configure your host machine

```bash
./setup.sh --include-mac-settings
```

Remove the `--include-mac-settings` flag if you do not want to change your mac settings.

Restart laptop for changes to mac settings to take effect.

## Devbox usage

All devbox commands can be run from any terminal location. They are all aliases
around vagrant commands.

```bash
# initialize the vagrant VM dev environment
devup

# ssh into a running environment
dev

# shutdown a running environment
halt

# destroy an environment
boom

# re-provision the vagrant VM environment. 
provide
# Useful when you only want to update the VM based on provision changes.
# As opposed to a full destroy and `devup` which would nuke the VM and scrap all
# the ssh configs, package / gem installations, and such.
```

## Connecting vscode to devbox

[Guide](https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e)

## License

Feel free to copy and use this as you wish.
