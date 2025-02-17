--Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)


    --packer manages itself
    use 'wbthomason/packer.nvim'
    --automatically sync packages if bootstrap isn needed
    if packer_bootstrap then
        require('packer').sync()
    end


    --UI Plugins
    use({
        'projekt0n/github-nvim-theme',
        config = function()
        require('github-theme').setup({
        -- ...
    })
    vim.cmd('colorscheme github_dark_high_contrast')
    end
    })
    use 'nvim-tree/nvim-tree.lua'


    --Synxtax and highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    }

    --LSP and completion
	use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'


    --Miscellaneous
    use {'mistricky/codesnap.nvim', run = 'make'}
    use { 
        "ibhagwan/fzf-lua",
        requires = { "nvim-tree/nvim-web-devicons" }
    }
    -- nvim v0.7.2
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use 'andweeb/presence.nvim'
    use 'tpope/vim-dadbod'
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'
end)


