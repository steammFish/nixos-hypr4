{ pkgs, config, ... }:
let

  plug = {
    url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
    sha256 = "0n9x4av3vk3zb7jzjhb9s1h48chyg13d62cas31c666hv06ggmv6";
  };

  neovim-config =
    ''
      syntax on
      filetype plugin indent on

      set expandtab
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set autoindent
      set smartindent
      set fillchars=eob:\ 
      set encoding=utf-8
      set mouse=


      call plug#begin('~/.local/share/nvim/plugged')

      Plug 'jiangmiao/auto-pairs'

      Plug 'gruvbox-community/gruvbox'
      Plug 'kaicataldo/material.vim'
      Plug 'dracula/vim'
      Plug 'sickill/vim-monokai'

      " Plug 'vim-airline/vim-airline'
      " Plug 'vim-airline/vim-airline-themes'
      Plug 'itchyny/lightline.vim'


      Plug 'voldikss/vim-translate-me'
      Plug 'lilydjwg/colorizer'
      Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } 
      " Plug 'jistr/vim-nerdtree-tabs'

      call plug#end()

      
      " space key as leader 
      let mapleader = " "

      " copy to clipboard
      nnoremap <Leader>y "+y
      vnoremap <Leader>y "+y

      """ translate-me
      " Echo translation in the cmdline
      nmap <silent> <Leader>t <Plug>Translate
      vmap <silent> <Leader>t <Plug>TranslateV
      " Display translation in a window
      nmap <silent> <Leader>w <Plug>TranslateW
      vmap <silent> <Leader>w <Plug>TranslateWV
      " Replace the text with translation
      nmap <silent> <Leader>r <Plug>TranslateR
      vmap <silent> <Leader>r <Plug>TranslateRV
      " Translate the text in clipboard
      nmap <silent> <Leader>x <Plug>TranslateX

      nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>



    '';
in

{

  xdg.dataFile."nvim/site/autoload/plug.vim".source = pkgs.fetchurl {
    url = plug.url;
    sha256 = plug.sha256;
  };

  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };

  programs.neovim.enable = true;
  programs.neovim = {
    viAlias = true;
    extraConfig = neovim-config;
  };

}

# git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
