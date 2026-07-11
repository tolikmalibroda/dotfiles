if status is-interactive
  # Commands to run in interactive sessions can go here
  eval "$(/opt/homebrew/bin/brew shellenv)"
  starship init fish | source
  atuin init fish | source
  zoxide init fish | source
  set -gx EDITOR nvim
end



# Added by Antigravity CLI installer
set -gx PATH "/Users/tolikmalibroda/.local/bin" $PATH
