# Jump separated by / path characters, not just spaces
autoload -U select-word-style
select-word-style bash

# To see the key combo you want to use just do:
# cat > /dev/null
# And press it
bindkey -v   # vi style keybinds 

# Below is a hybrid system for vi and emacs bindings depending on mode.
# My tmux bindings break some of the insert mode bindings so use of the CMD
# mode navigation is encouraged when using tmux. 
#
# Entire list of bindings available here:
# http://bolyai.cs.elte.hu/zsh-manual/zsh_14.html

# VI MODE KEYBINDINGS (ins mode)
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
bindkey -M viins '^u'    kill-whole-line
bindkey -M viins '^r'    history-incremental-pattern-search-backward
bindkey -M viins '^s'    history-incremental-pattern-search-forward
bindkey -M viins '^p'    up-line-or-history
bindkey -M viins '^n'    down-line-or-history
# bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
# bindkey -M viins '^u'    backward-kill-line
# bindkey -M viins '^h'    backward-delete-char
bindkey -M viins '^?'    backward-delete-char
bindkey -M viins '^z'    undo
bindkey -M viins '^x^r'  redisplay
bindkey -M viins '^[[1~' beginning-of-line                  # Home
bindkey -M viins '^[[4~' end-of-line                        # End
bindkey -M viins '^[[3;2~' overwrite-mode                   # Insert
bindkey -M viins '^[[3~' delete-char                        # Delete
# bindkey -M viins '^f'    forward-char                       # Ctrl-f
# bindkey -M viins '^b'    backward-char                      # Ctrl-b
bindkey -M viins '^d'    delete-char 
bindkey -M viins ';j;'   vi-cmd-mode                        # escape

# Courtesy of 
# https://github.com/tomsquest/dotfiles/blob/master/zsh/bindkey.zsh
bindkey -M viins '^[[Z'  reverse-menu-complete # inverse of tab

# alt-s : insert sudo at the start of the line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey '^[s' insert-sudo

# VI MODE KEYBINDINGS (cmd mode)
bindkey -M vicmd 'H'     beginning-of-line
bindkey -M vicmd 'L'     end-of-line
bindkey -M vicmd 'dd'    kill-whole-line
bindkey -M vicmd 'D'     kill-line
bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
bindkey -M vicmd '^p'    up-line-or-history
bindkey -M vicmd '^n'    down-line-or-history
bindkey -M vicmd 'y'     vi-yank
bindkey -M vicmd 'p'     yank
bindkey -M vicmd 'P'     vi-put-after
bindkey -M vicmd '/'     vi-history-search-forward
bindkey -M vicmd '?'     vi-history-search-backward
# bindkey -M vicmd '^z'    undo
bindkey -M vicmd 'w'     forward-word      
bindkey -M vicmd 'b'     backward-word      
bindkey -M vicmd 'dw'    kill-word 
bindkey -M vicmd 'db'    backward-kill-word
bindkey -M vicmd '^d'    delete-char 
bindkey -M vicmd '^[[5~' history-beginning-search-backward      # PageUp
bindkey -M vicmd '^[[6~' history-beginning-search-forward       # PageDown
bindkey -M vicmd '^[[1~'  beginning-of-line                     # Home
bindkey -M vicmd '^[[4~'  end-of-line                           # End
bindkey -M vicmd '^[[3;2~' overwrite-mode                       # Insert
