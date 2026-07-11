function nix-darwin-rebuild --wraps='darwin-rebuild switch --flake $(readlink -f ~/.config/nix/)' --description 'alias nix-darwin-rebuild darwin-rebuild switch --flake $(readlink -f ~/.config/nix/)'
  sudo darwin-rebuild switch --flake $(readlink -f ~/.config/nix/) $argv
end
