# Setup for new machines

## Pre-Script

[Setup SSH keys ](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) so config can be downloaded

Paste in terminal:

```bash
# For newer systems:
ssh-keygen -t ed25519 -C "d.shields112358@gmail.com";eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_ed25519;cat ~/.ssh/id_ed25519.pub;

# For older systems:
ssh-keygen -t rsa -b 4096 -C "d.shields112358@gmail.com";eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_rsa;cat ~/.ssh/id_rsa.pub;

# Clone config repo:
cd ~;mkdir -p personal
which git 1> /dev/null || sudo apt install git -y; git clone git@github.com:ShieldsDaniel/config.git ~/personal/config
```

## General setup plan

* Do manual pre-script stuff
* Run setup script:
  * Maybe check that prerequisites are installed (git, curl, wget and the like)
  * If mac, install homebrew / if windows install chocolatey
  * Setup shell (fish/zsh, starship, any plugins)
  * Install some cool terminal stuff (tmux, fzf, etc...)
  * Install programming languages (node, rust, etc...)
  * Build neovim
  * optional where applicable: install some desktop apps (ghostty, insomnia, etc...)
  * Setup dotfiles (neovim config, tmux config, shell config, gitconfig, etc...)
* Add uninstall/reinstall options

## General plan for configs and dotfiles

* Script to copy over config and dotfiles to their correct locations
* Create backup of any existing configs/dotfiles that will be replaced
* Allow for rolling back

#### TODO:

https://github.com/brigand/fast-nvm-fish

-------------------------------------------------------------------------------------























































## Old

* Using `bash` scripts:
  * Create SSH key for github account [generate SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  * Ensure `git` is installed [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  * Install `homebrew` if on mac [homebrew](https://brew.sh/)
  * Update/Upgrade system `sudo apt update && sudo apt upgrade`/'brew update && brew upgrade'
  * update `git` if old version (might overlap last step)
  *

## Stuff

### system

* Ghostty
* insomnia (look into terminal version)
* i3 / aerospace

### languages

* node
* rust
* lua

### terminal

* tmux
* fzf
* rg
* delta (we need a way to alter .gitconfig to allow this to work)
* exa
* bat
* fd
* zoxide
* fd
* procs
* sd
* yazi: https://www.youtube.com/watch?v=iKb3cHDD9hw
* htop
* neofetch
* entr
* neovim
* starship
* tldr => brew install tlrc (for rust version)
* 
