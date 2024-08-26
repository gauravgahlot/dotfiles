local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save this file

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- color schemes
	use("folke/tokyonight.nvim")
	use("patstockwell/vim-monokai-tasty")
	use("ellisonleao/gruvbox.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigaton
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("numToStr/Comment.nvim") -- commenting with gc
	use("nvim-tree/nvim-tree.lua") -- file explorer

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	use("nvim-lualine/lualine.nvim") -- status line
	use("nvim-tree/nvim-web-devicons") -- vs-code like icons
	use("onsails/lspkind.nvim") -- icons for autocompletion

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion framework
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	-- use("L3MON4D3/LuaSnip") -- snippet engine
	-- use("saadparwaiz1/cmp_luasnip") -- for autocompletion

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	-- use("simrat39/rust-tools.nvim") -- tools to automatically setup lspconfig for rust-analyzer
	use("hrsh7th/cmp-nvim-lsp") -- LSP completion source

	-- formatting & linting
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("nvimtools/none-ls.nvim")
	-- use("jose-elias-alvarez/null-ls.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- rust language
	use({
		"rust-lang/rust.vim",
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			-- vim.g.rust_clip_command = "wl-copy"
		end,
	})

	-- markdown
	use({
		"plasticboy/vim-markdown",
		ft = { "markdown" },
		dependencies = {
			"godlygeek/tabular",
		},
		config = function()
			-- never ever fold!
			vim.g.vim_markdown_folding_disabled = 1
			-- support front-matter in .md files
			vim.g.vim_markdown_frontmatter = 1
			-- 'o' on a list item should insert at same level
			vim.g.vim_markdown_new_list_item_indent = 0
			-- don't add bullets when wrapping:
			-- https://github.com/preservim/vim-markdown/issues/232
			vim.g.vim_markdown_auto_insert_bullets = 0
		end,
	})

	-- autopair plugin
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- floating terminal
	use("voldikss/vim-floaterm")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
