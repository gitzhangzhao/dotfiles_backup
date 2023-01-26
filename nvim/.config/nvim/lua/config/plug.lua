local install_path = '~/.local/share/nvim/site/autoload/plug.vim'

-- if not install vim-plug
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd [[
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  ]]
end
