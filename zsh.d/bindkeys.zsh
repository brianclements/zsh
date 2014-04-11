# Jump separated by / path characters, not just spaces
autoload -U select-word-style
select-word-style bash

# To see the key combo you want to use just do:
# cat > /dev/null
# And press it
bindkey -v   # vi style keybinds 

# Below is a hybrid system for vi and emacs bindings depending on mode.
# My tmux bindings break some of the insert mode bindings so use of the CMD
# mode navigation is encouraged when using tmux. Regular ZSH shell will respond
# as expected though with default emacs bindings.

# VI MODE KEYBINDINGS (ins mode)
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
bindkey -M viins '^k'    kill-line
bindkey -M viins '^r'    history-incremental-pattern-search-backward
bindkey -M viins '^s'    history-incremental-pattern-search-forward
bindkey -M viins '^p'    up-line-or-history
bindkey -M viins '^n'    down-line-or-history
bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins '^u'    backward-kill-line
bindkey -M viins '^h'    backward-delete-char
bindkey -M viins '^?'    backward-delete-char
bindkey -M viins '^z'    undo
bindkey -M viins '^x^r'  redisplay
bindkey -M viins '\eOH'  beginning-of-line                  # Home
bindkey -M viins '\eOF'  end-of-line                        # End
bindkey -M viins '\e[2~' overwrite-mode                     # Insert
bindkey -M viins '^f'    forward-char                       # Ctrl-f
bindkey -M viins '^b'    backward-char                      # Ctrl-b
bindkey -M viins '^d'    delete-char 

# VI MODE KEYBINDINGS (cmd mode)
bindkey -M vicmd 'H'     beginning-of-line
bindkey -M vicmd 'L'     end-of-line
bindkey -M vicmd '^k'    kill-line
bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
bindkey -M vicmd '^p'    up-line-or-history
bindkey -M vicmd '^n'    down-line-or-history
bindkey -M vicmd '^y'    yank
bindkey -M vicmd '^w'    backward-kill-word
bindkey -M vicmd '^u'    backward-kill-line
bindkey -M vicmd '/'     vi-history-search-forward
bindkey -M vicmd '?'     vi-history-search-backward
bindkey -M vicmd '^z'    undo
bindkey -M vicmd 'w'     forward-word      
bindkey -M vicmd 'b'     backward-word      
bindkey -M vicmd 'd'     kill-word 
bindkey -M vicmd '^d'    delete-char 
bindkey -M vicmd '\e[5~' history-beginning-search-backward  # PageUp
bindkey -M vicmd '\e[6~' history-beginning-search-forward   # PageDown
bindkey -M vicmd '\eOH'  beginning-of-line                  # Home
bindkey -M vicmd '\eOF'  end-of-line                        # End
bindkey -M vicmd '\e[2~' overwrite-mode                     # Insert
