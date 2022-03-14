# Intro
Contains scripts and configs to setup my powershell environment including the custom prompt.

## Prompt
I use [oh-my-posh](https://ohmyposh.dev) for my custom prompt.  Check out this great repository for a ton of different configurations and features.  You can find my current config in [oh-my-config.json](prompt/oh-my-config.json).

## Setup
Edit your profile script, which by using the following in your powershell terminal:

First you'll need to install a few powershell modules:

```console
install-module -Name PSReadLine 
install-module -Name oh-my-posh
install-module -Name terminal-icons
install-module -Name z
```
these 4 installs should give you everything needed

```console
$profile
```
This will provide the file/path to your profile.  

Add the following line in your startup profile (changing the appropriate paths of course)

```console
. C:\apps\powershell\ps-profile.ps1
```

