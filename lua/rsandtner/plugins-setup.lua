local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

  use "wbthomason/packer.nvim"       -- Have packer manage itself

--  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- plugins needed to make autocompletion work
  use("hrsh7th/nvim-cmp")             -- The completion plugin

  -- cmp sources
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")

  -- snippets
  use("L3MON4D3/LuaSnip")             -- snippet engine
  use("saadparwaiz1/cmp_luasnip")     -- snippet completions
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- lazy loading plugins sample (see: https://github.com/wbthomason/packer.nvim#quickstart)
  -- use {
  --   "tpope/vim-dispatch",                            -- plugin repo
  --   opt = true,                                      -- makes it lazy loaded
  --   cmd = { "Dispatch", "Make", "Focus", "Start" }   -- loaded on these commands
  -- }

  -- LSP configuration
  use("williamboman/mason.nvim")             -- manage & install lsp servers
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")               -- configure lsp servers

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use "nvim-lua/plenary.nvim"   -- Useful lua functions used by lots of plugins

  -- are these plugins still needed? 
--  use "nvim-lua/popup.nvim"     -- An implementation of the Popup API from vim in Neovim

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
