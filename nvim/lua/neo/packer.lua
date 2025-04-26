-- :so to source it
-- :PackerSync to sync the file with the installed packages

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',	
	-- or                          , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- (Great) Theme
  use ({
	'navarasu/onedark.nvim',
	as = 'onedark',
	config = function()
		require('onedark').setup {
		    style = 'warmer',
		    transparent = true
		}
		require('onedark').load()
	end
  })

  -- Undo Tree
  use {
	"jiaoshijie/undotree",
	config = function()
	    	require('undotree').setup()
	end,
	requires = {
	    	"nvim-lua/plenary.nvim",
	},
  }
end)

