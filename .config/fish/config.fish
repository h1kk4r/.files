#    .o88o.  o8o           oooo
#    888 `"  `"'           `888
#   o888oo  oooo   .oooo.o  888 .oo.
#    888    `888  d88(  "8  888P"Y88b
#    888     888  `"Y88b.   888   888
#    888     888  o.  )88b  888   888
#   o888o   o888o 8""888P' o888o o888o

if status is-interactive
    set -g fish_greeting

    if test -x $HOME/.bin/.conf
        $HOME/.bin/.conf
    end
end
fish_add_path $HOME/.local/bin

# Ensure Cargo binaries are on PATH
fish_add_path $HOME/.cargo/bin

# System PATH
set -gx DOWNLOAD $HOME/Downloads
set -gx PROJECT $HOME/Project
set -gx DESKTOP $HOME/Desktop
set -gx CONF $HOME/.config
set -gx DOTFILE $HOME/.files

# Initialize zoxide (smart directory changer)
if type -q zoxide
    zoxide init fish | source
end

# ls → eza
alias cd z
alias ls eza
alias ll 'eza -l --git --group-directories-first'
alias la 'eza -la --git --group-directories-first'
alias lt 'eza -T -L 2 --group-directories-first'
alias tree 'eza -T --group-directories-first'

# cat/grep/find/du/df/top
alias cat bat
alias grep rg
alias find fd
alias du dust
alias df duf
alias top btm

# wezterm
alias wezterm /Applications/WezTerm.app/Contents/MacOS/wezterm > /dev/null 2>&1
