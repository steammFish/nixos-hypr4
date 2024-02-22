{ pkgs, lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim.enable = true;

  programs.nixvim = {
    vimAlias = true;

    # Configure neovim options...
    options = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
      incsearch = true;
    };

    # ...mappings...
    # maps = {
    #   normal = {
    #     "<C-s>" = ":w<CR>";
    #     "<esc>" = { action = ":noh<CR>"; silent = true; };
    #   };
    #   visual = {
    #     ">" = ">gv";
    #     "<" = "<gv";
    #   };
    # };

    keymaps = [
      {
        key = ";";
        action = ":";
      }
      {
        mode = "n";
        key = "<leader>m";
        options.silent = true;
        action = "<cmd>!make<CR>";
      }
    ];

    globals.mapleader = ","; # Sets the leader key to comma

    # ...plugins...
    plugins = {
      lightline.enable = true;
      telescope.enable = true;
      harpoon = {
        # Hi Prime :)
        enable = true;
        keymaps.addFile = "<leader>a";
      };

      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            K = "hover";
          };
        };

        servers = {
          bashls.enable = true;
          clangd.enable = true;
          nil_ls.enable = true;
          tsserver.enable = true;
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            # rustcPackage = [];
          };

        };
      };
    };

    # ... and even highlights and autocommands !

    highlight.ExtraWhitespace.bg = "red";
    highlight = {
      Comment.fg = "#ff00ff";
      Comment.bg = "#000000";
      Comment.underline = true;
      Comment.bold = true;
    };

    match.ExtraWhitespace = "\\s\\+$";
    autoCmd = [
      {
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 shiftwidth=2";
      }
    ];

    colorschemes.gruvbox.enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        config = "lua require(\"Comment\").setup()";
      }
      vim-nix
      gruvbox
      # lightline
    ];

    extraConfigLua = ''
      -- Print a little welcome message when nvim is opened!
      print("Hello world!")
    '';

  };


  # programs.neovim.enable = true;
  # programs.neovim = {
  #   viAlias = true;
  #   vimAlias = true;
  # };
}
