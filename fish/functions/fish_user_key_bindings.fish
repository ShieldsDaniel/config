function fish_user_key_bindings
    # Enable vim mode
    fish_vi_key_bindings

    # Bind Ctrl+f to open project selector
    bind -e \cf
    bind -M 'insert' \cf 'project-selector'\r

    # Bind Ctrl-s to open cheatsheet
    bind -e \cs
    bind -M 'insert' \cs 'cheatsheet'\r

    bind -e \ct
    bind -M 'insert' \ct 'run'\r

    # Bind Ctrl-a to complete suggestions
    bind -e \ca
    bind -M 'insert' \ca 'accept-autosuggestion'
end
