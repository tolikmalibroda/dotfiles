function nixdev --wraps='nix develop -c fish'
  nix develop $argv -c fish
end
