function nixf --wraps='nix-shell --run fish' --description 'alias nixf nix-shell --run fish'
  nix-shell $argv --run fish 
end
