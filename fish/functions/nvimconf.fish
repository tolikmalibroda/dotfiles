function nvimconf --wraps='cd ~/.config/nvim; n; cd -' --description 'alias nvimconf cd ~/.config/nvim; n; cd -'
  cd ~/.config/nvim; n; cd - $argv
end
