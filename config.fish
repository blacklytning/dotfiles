
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/blacklytning/miniconda3/bin/conda
    eval /home/blacklytning/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/blacklytning/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/blacklytning/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/blacklytning/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

set -g fish_greeting

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
