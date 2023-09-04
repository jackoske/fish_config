
alias 42Test 'norminette -R CheckForbiddenSourceHeader'
alias 42cc 'cc *.c -Wall -Werror -Wextra -o main'
alias rainbow 'rogauracore rainbow_cycle 1'
alias k1 'rogauracore brightness 3'
alias k0 'rogauracore brightness 0'
alias v 'nvim'
alias python 'python3'
function fish_prompt
    set_color -b blue -o white
    set -l dir (prompt_pwd)
    echo -n $dir " "
    set_color normal

    # Check if the current directory is a Git repository
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1
        # Get the Git branch name
        set -l branch (basename (git symbolic-ref -q HEAD))
        set -l branch (string replace "refs/heads/" "" $branch)  # Remove 'refs/heads/' prefix
	echo -n " $branch"

        # Check Git status
        set -l git_status (git status --porcelain)
        if test -n "$git_status"
            # Git status is not clean
            echo -n "🔄❯ "
        else
            # Git status is clean (no changes to commit)
            echo -n "✅❯ "
        end
    else
        # Not a Git repository, display a regular icon
        echo -n "🛩️ "
    end
echo -ne "\n(☞ﾟヮﾟ)☞ "
end

set -g fish_greeting ''

# Set up Miniconda
set -x PATH $HOME/miniconda3/bin $PATH

function mkcd
    mkdir -p -- $argv[1]
    cd $argv[1]
end

