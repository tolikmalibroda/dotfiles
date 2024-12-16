if status is-interactive
  # Commands to run in interactive sessions can go here
  eval "$(/opt/homebrew/bin/brew shellenv)"
  starship init fish | source
  nvm use default --silent
  pyenv init - | source
  pyenv virtualenv-init - | source
  set -gx EDITOR nvim
end

