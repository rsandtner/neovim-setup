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

  use "wbthomason/packer.nvim"  -- Have packer manage itself

  -- lazy loading plugins sample (see: https://github.com/wbthomason/packer.nvim#quickstart)
  -- use {
  --   "tpope/vim-dispatch",                            -- plugin repo
  --   opt = true,                                      -- makes it lazy loaded
  --   cmd = { "Dispatch", "Make", "Focus", "Start" }   -- loaded on these commands
  -- }
 

  -- are these plugins still needed? 
--  use "nvim-lua/popup.nvim"     -- An implementation of the Popup API from vim in Neovim
--  use "nvim-lua/plenary.nvim"   -- Useful lua functions used by lots of plugins

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
