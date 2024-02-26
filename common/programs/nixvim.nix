{ pkgs, lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim.enable = true;

  programs.nixvim = {
    vimAlias = true;
    viAlias = true;

    # Configure neovim options...
    options = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
      incsearch = true;
      mouse = "";
    };

    # ...mappings...
    globals.mapleader = ","; # Sets the leader key to comma
    keymaps = [
      {
        key = ";";
        action = ":";
      }
      {
        # copy to clipboard
        key = "<Space>y";
        action = ''"+y'';
      }
      # {
      #   mode = "n";
      #   key = "<leader>m";
      #   options.silent = true;
      #   action = "<cmd>!make<CR>";
      # }
    ];

    # ... and even highlights and autocommands !

    # highlight.ExtraWhitespace.bg = "red";
    # highlight = {
    #   Comment.fg = "#ff00ff";
    #   Comment.bg = "#000000";
    #   Comment.underline = true;
    #   Comment.bold = true;
    # };
    # match.ExtraWhitespace = "\\s\\+$";

    # autoCmd = [
    #   {
    #     event = "FileType";
    #     pattern = "nix";
    #     command = "setlocal tabstop=2 shiftwidth=2";
    #   }
    # ];

    # extraConfigLua = ''
    #   -- Print a little welcome message when nvim is opened!
    #   print("Hello world!")
    # '';

    # ...plugins...
    # colorschemes.gruvbox.enable = true;
    # colorscheme = "everforest";
    colorscheme = "murphy";

    plugins = {
      lightline.enable = true; # status bar
      telescope.enable = true; # fuzzy finder
      harpoon = {
        # Hi Prime :)
        enable = true;
        keymaps.addFile = "<leader>a";
      };

      # lsp = {
      #   enable = true;

      #   keymaps = {
      #     silent = true;
      #     diagnostic = {
      #       "<leader>k" = "goto_prev";
      #       "<leader>j" = "goto_next";
      #     };

      #     lspBuf = {
      #       gd = "definition";
      #       K = "hover";
      #     };
      #   };

      #   servers = {
      #     bashls.enable = true;
      #     clangd.enable = true;
      #     nil_ls.enable = true;
      #     tsserver.enable = true;
      #     lua-ls = {
      #       enable = true;
      #       settings.telemetry.enable = false;
      #     };
      #     rust-analyzer = {
      #       enable = true;
      #       installCargo = true;
      #       installRustc = true;
      #       # rustcPackage = [];
      #     };

      #   };
      # };

    };

    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        config = "lua require(\"Comment\").setup()";
      }
      vim-nix
      gruvbox
      everforest
      molokai
      base46
      oceanic-material
      gruvbox-material
      material-nvim
      base16-nvim
      dracula-nvim
      onedark-nvim
      onedarkpro-nvim
      jellybeans-nvim
      tokyonight-nvim

      rose-pine
      wombat256
      neovim-ayu
      kanagawa-nvim
      oxocarbon-nvim
      catppuccin-nvim

      # lightline
    ];

  };



}
