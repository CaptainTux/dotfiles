# Start X at login
if status --is-login
   if test -z "$DISPLAY" -a $XDG_VTNR = 1
      exec startx -- -keeptty
   end
end

fzf_key_bindings

alias ls="exa"

source ~/.config/fish/start_ssh_agent.fish
