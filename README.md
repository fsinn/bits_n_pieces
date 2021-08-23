# CLI

This repository installs my development environment that I use at work and in private.
The installation is orchestrated using ansible.
Homebrew is used to install all neccessary tools.

**WARNING**: This installer is experimental and only targets MacOS for now.
Use at your own risk.

# How to install

Simply execute `./install.sh` from the repository root.
It will install brew and ansible, the two prerequisites, and then start the ansible playbook.

**NOTE** You will be prompted to install Apple's Command Line Tools if not already installed.
This will open a popup and you will have to agree to License Agreements.
While this is not required for the installation to succeed, I would still recommend doing so in order to be able to use git.

# iTerm2

The iTerm2 dynamic profiles feature is used to automatically load profiles to iTerm2.
After installing _cli_, please make sure to select the iterm profile and make it default.

To do that, open `iTerm2 -> Preferences -> Profiles` (or, `command(⌘) + ;`), select the _iterm_ profile, click `Other Actions...`, and finally _Set as Default_.

To show or hide all iTerm2 windows, thus quickly switching between iTerm2 and other applications, go to `iTerm2 -> Preferences -> Keys -> Hotkeys` and select the checkbox _Show/hide all windows with a system-wide hotkey_.
Afterwards, set the hotkey: I personally prefer `control(^) + ^`, but use whatever works for you.

# Virtual Box

VirtualBox needs a Kernel Extension to be enabled in order to run correctly.
To do so, you have to go to MacOS `System Preferences -> Security & Privacy` and unlock settings by clicking on the lock.
Then, press the `Allow` next to a message similar to "System software from developer “Oracle America, Inc.” was blocked from loading.".

# Testing

Simply call `vagrant up` which will provision and start a MacOS Big Sur vagrant box.
**Note**: The first time you do this will take quite long as the vagrant box is rather large and Homebrew needs to update

Then run the playbook on your local machine: `ansible-playbook -v -K -i hosts_vagrant.yml cli-playbook.yml`.
The BECOME password is simply `vagrant`.
Keep in mind that you need to confirm a UI dialog should you need to enable git.

**Warning**: The box needs the Virtual Box Extension Pack.
It is installed and you automatically agree to [its license](https://www.virtualbox.org/wiki/VirtualBox_PUEL)!

# Ansible specifics

Ansible's [command module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/command_module.html#synopsis) does not run through a shell.
This may cause the commands to misbehave on remote targets.
Thus, I specified fully-qualified paths to commands that are installed by brew, even though this might make the script "less portable".
As I target MacOS, exclusively, this should not pose problems.
The interesting thing is calling `fish` to install omf: I use the `-l` flag to run the command through a login shell to make it work.

# Troubleshooting

## Installation won't work or Vagrant won't start VirtualBox

Make sure that you "Allow apps downloaded from" the "App Store and identifier developers" under MacOS `System Preferences -> Security & Privacy.
I will not temporarily disable Gatekeeper during the installation.

# Resources

- [Toptal](https://www.toptal.com/developers/gitignore/api/linux,macos,windows,intellij+all,visualstudiocode,vim,git) for generating my .gitignore
- [mbadolato](https://github.com/mbadolato/iTerm2-Color-Schemes#solarized-dark---patched) for providing a patches Solarized Dark color scheme for iterm2
