function fish_prompt --description 'Write out the prompt'
        set -l last_status $status
        set -l normal (set_color normal)
        set -l status_color (set_color brgreen)
        set -l cwd_color (set_color $fish_color_cwd)
        set -l vcs_color (set_color brpurple)
        set -l prompt_status ""
        set -l cwd $PWD
        if test "$PWD" = "$HOME"
                set cwd '~'
        else if string match -q -- "$HOME/*" "$PWD"
                set cwd "~"(string sub --start (math (string length -- $HOME) + 1) -- "$PWD")
        end
        set -l vcs
        if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
                set -l branch (command git symbolic-ref --quiet --short HEAD 2>/dev/null)
                or set branch (command git rev-parse --short HEAD 2>/dev/null)

                if test -n "$branch"
                        set -l dirty
                        set -l git_status (command git status --porcelain --ignore-submodules=dirty 2>/dev/null)
                        if test -n "$git_status"
                                set dirty '*'
                        end

                        set vcs " ($branch$dirty)"
                end
        end
    
        # Since we display the prompt on a new line allow the directory names to be longer.
        set -q fish_prompt_pwd_dir_length
        or set -lx fish_prompt_pwd_dir_length 0
    
        # Color the prompt differently when we're root
        set -l suffix '❯'
        if functions -q fish_is_root_user; and fish_is_root_user
                if set -q fish_color_cwd_root
                        set cwd_color (set_color $fish_color_cwd_root)
                end
                set suffix '#'
        end
    
        # Color the prompt in red on error
        if test $last_status -ne 0
                set status_color (set_color $fish_color_error)
                set prompt_status $status_color "[" $last_status "] " $normal
        end

        if test -n "$vcs"
                set vcs " $vcs"
        end

        echo -s $cwd_color $cwd $normal $vcs_color $vcs $normal
        echo -n -s $status_color $suffix ' ' $normal
end
