if status is-interactive
    # Commands to run in interactive sessions can go here

    # Ensure we pull in functions
    set -U fish_user_paths

    # Path stuff
    fish_add_path \
        "$HOME/bin" \
        "/usr/local/bin" \
        "/usr/local/sbin" \
        "$HOME/.yarn/bin" \
        "$HOME/.config/yarn/global/node_modules/.bin" \
        "$HOME/personal/private-scripts/bash" \
        "$HOME/Library/Python/3.9/bin" \
        "$HOME/.local/bin" \
        "/opt/homebrew/bin" \
        "/opt/homebrew/bin/bash"

    # Vim aliases and global variables to change everything to use neovim
    if which nvim >/dev/null
        set -U VISUAL nvim
        set -U VIMCONFIG ~/.config/nvim
        set -U VIMDATA ~/.local/share/nvim

        # vim aliases
        alias vimlog="rm -rf ~/.local/state/nvim/log && rm -rf ~/.local/state/nvim/lsp.log && rm -rf ~/.local/state/nvim/mason.log"
        alias vim=nvim
        # backup in case of broken neovim config
        alias vi=vim
    end

    # Save your bacon rm alias
    alias rm="rm -rfi"

    # Change default ls command to use exa
    if which exa >/dev/null
        # ls aliases
        alias ls="exa"
        alias la="exa -lah"
        alias l="exa -lah"
        alias tree="exa --tree"
    end

    # Change default cat command to use bat
    if which bat >/dev/null
        # cat alias
        alias cat="bat"
    end

    # Setup Mac brew update alias
    if which brew >/dev/null
        alias bud="brew update && brew upgrade && brew doctor && brew cleanup"
    end

    # Git aliases
    alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    alias gbranches="git branch -a | cat"

    # Change default cd command to use zoxide
    if which zoxide >/dev/null
        # cd aliases
        alias cd="z"
        alias zz="z -"
        # add zoxide to shell
        eval "$(zoxide init fish)"
    end

    if which python3 >/dev/null
        alias python="python3"
    end

    # Ensure NVM is using default node 
    nvm use node
    
    # Enable vim mode
    fish_vi_key_bindings

    # Since TMP is having trouble running from tmux config, just do it here
    bash "$HOME/.tmux/plugins/tpm/tpm"

    # Initialize starship
    starship init fish | source

    # Run fastfetch on each new terminal
    fastfetch
end

