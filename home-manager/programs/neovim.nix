# look at 
#   https://github.com/NixNeovim/NixNeovimPlugins
#   https://gist.github.com/nat-418/d76586da7a5d113ab90578ed56069509
{ config, pkgs, ...}:
{
  enable = true;
  defaultEditor = true;
  plugins = with pkgs.vimPlugins; [
    auto-save-nvim                # https://github.com/pocco81/auto-save.nvim/
    gitsigns-nvim                 # https://github.com/lewis6991/gitsigns.nvim/
    indent-blankline-nvim         # https://github.com/lukas-reineke/indent-blankline.nvim/
    mini-nvim                     # https://github.com/echasnovski/mini.nvim/
    nvim-cmp                      # https://github.com/hrsh7th/nvim-cmp/
    nvim-lspconfig                # https://github.com/neovim/nvim-lspconfig/
    nvim-treesitter               # https://github.com/nvim-treesitter/nvim-treesitter/
    telescope-nvim                # https://github.com/nvim-telescope/telescope.nvim/
    vim-sleuth                    # https://github.com/tpope/vim-sleuth/
    which-key-nvim                # https://github.com/folke/which-key.nvim/

    # themes
    catppuccin-nvim
    gruvbox-nvim
    iceberg-vim
    kanagawa-nvim
    material-nvim
    nord-nvim
    onedark-vim
    papercolor-theme
    tender-nvim
    tokyonight-nvim

  ];
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
}
