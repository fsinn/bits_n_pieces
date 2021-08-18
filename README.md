# CLI

This repository installs my development environment that I use at work and in private.
The installation is orchestrated using ansible.
Homebrew is used to install all neccessary tools.

**WARNING**: This installer is experimental and only targets MacOS for now.
Use at your own risk.

# How to install

# iTerm2

The iTerm2 dynamic profiles feature is used to automatically load profiles to iTerm2.
After installing _cli_, please make sure to select the iterm profile and make it default.

To do that, open `iTerm2 -> Preferences -> Profiles` (or, `command(⌘) + ;`), select the _iterm_ profile, click `Other Actions...`, and finally _Set as Default_.

To show or hide all windows, thus quickly switching between iTerm2 and other applications, go to `iTerm2 -> Preferences -> Keys -> Hotkeys` and select the checkbox _Show/hide all windows with a system-wide hotkey_.
Afterwards, set the hotkey: I personally prefer `control(^) + ^`, but use whatever works for you.

# Resources

- [Toptal](https://www.toptal.com/developers/gitignore/api/linux,macos,windows,intellij+all,visualstudiocode,vim,git) for generating my .gitignore
- [mbadolato](https://github.com/mbadolato/iTerm2-Color-Schemes#solarized-dark---patched) for providing a patches Solarized Dark color scheme for iterm2
