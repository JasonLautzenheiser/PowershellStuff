# Intro
Contains scripts and configs to setup my powershell environment including the custom prompt.

## Powershell
For much of this work you'll need powershell 7.2+ (Also known as Powershell Core).  Releases and instructions to install can be found here:  [Powershell Core](https://github.com/PowerShell/PowerShell)

## Windows Terminal
Windows terminal is my preferred terminal program and can host different types of CLI out of the box (Poweshell, CMD, and others) in a tabbed interface.

Installation instructions and details can be found here: [Windows Terminal](https://github.com/microsoft/terminal)


## Prompt
I use [oh-my-posh](https://ohmyposh.dev) for my custom prompt.  Check out this great repository for a ton of different configurations and features.  You can find my current config in [oh-my-config.json](prompt/oh-my-config.json).

To make it look properly, you will need to download and install a Nerd Font that contains the icons used in oh-my-posh.  Follow the instructions here:  [oh-my-posh Nerd Fonts](https://ohmyposh.dev/docs/config-fonts)

oh-my-posh is updated very frequently with new features and bug fixes.  I recommend keeping it updated.   I recommend following the directions from the official repo for how to install and update.

> Note that if you installed oh-my-posh for powershell on windows prior to version 7.72, they have deprecated the powershell module and you should follow the instructions here:  [oh-my-posh migrating](https://ohmyposh.dev/docs/migrating)

If you using oh-my-posh with bash or some other shell your update procedure will be different.

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
## Vs Code Settings
If you use the integrated terminal in In Visual Studio Code you will have to update your font settings to get the glyphs to render
- File => Preferences => Settings => 
- search for font under text editor
In the Editor: Font Family setting, add your installed NF name to the front of the list if you want to use the font in your editor as well or at the end of the list if you want the font and glyphs applied just to the terminal

link to a zillion themes that you can simply copy and paste into your oh-my-config.json
https://ohmyposh.dev/docs/themes#default


## Included Scripts

### Remove-Old-Modules
When you update modules, like oh-my-posh, multiple versions can stick around.  If you want to clean them up, this script will help you out by removing old versions but leaving the most recent one installed.

```console
remove-old-modules <module-name>
```
pass in a module name to clean up old installs of the module passed in.

```console
remove-old-modules oh-my-posh
```
this will clean up older installed versions of oh-my-posh

```console
remove-old-modules -includeAll
```
This flag will remove all installed modules returned by a call to ```Get-InstalledModule ```
