function nixd --wraps='nix develop -c fish' --description 'alias nixd nix develop -c fish'
  nix develop -c fish $argv
end
