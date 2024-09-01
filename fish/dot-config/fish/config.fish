if status is-interactive
  # Commands to run in interactive sessions can go here
  eval "$(/opt/homebrew/bin/brew shellenv)"
  starship init fish | source
  nvm use default --silent
end

