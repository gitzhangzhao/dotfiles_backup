local Plug = vim.fn['plug#']

-- plugin deployment
vim.call('plug#begin', '~/.local/share/nvim/plugged')
-- indent line
Plug 'lukas-reineke/indent-blankline.nvim'
-- surroud
Plug 'tpope/vim-surround'
-- C-a/x
Plug 'tpope/vim-speeddating'
-- more repeat
Plug 'tpope/vim-repeat'
-- pairs
Plug 'jiangmiao/auto-pairs'
-- quickly move
Plug 'karb94/neoscroll.nvim'
Plug 'phaazon/hop.nvim'
-- git state
Plug 'airblade/vim-gitgutter'
-- format with a common character
Plug 'junegunn/vim-easy-align'
-- multiline selected
Plug('mg979/vim-visual-multi', { ['branch'] = 'master' })
-- input state
Plug 'h-hg/fcitx.nvim'
-- number
Plug 'myusuf3/numbers.vim'
-- show the context of the current buffer contents
-- Plug 'wellle/context.vim'
-- statistics startup time
-- Plug 'dstein64/vim-startuptime'
-- status line
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
-- header
Plug 'alpertuna/vim-header'
-- snippets
Plug 'honza/vim-snippets'
-- text objects
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'glts/vim-textobj-comment'
Plug 'tommcdo/vim-exchange'
-- themes
-- Plug 'NLKNguyen/papercolor-theme'
-- Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
-- Plug 'jacoborus/tender.vim'
-- Plug 'cocopon/iceberg.vim'
-- Plug 'junegunn/seoul256.vim'
-- lastplace
Plug 'farmergreg/vim-lastplace'
-- undotree
Plug ('mbbill/undotree', { ['on'] = 'UndotreeToggle' })
-- sudo
Plug 'lambdalisue/suda.vim'
-- disable search highlighting
Plug 'romainl/vim-cool'
-- command line completion
Plug 'gelguy/wilder.nvim'
-- coc
Plug ('neoclide/coc.nvim', { ['branch'] = 'master', ['do'] = 'yarn install --frozen-lockfile'})
-- markdown-preview
Plug ('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install', ['for'] = 'markdown' })
-- LeaderF
Plug ('Yggdroot/LeaderF', { ['do'] = ':LeaderfInstallCExtension', ['on'] = 'Leaderf' })
-- translate
Plug 'voldikss/vim-translator'
-- treesitter and context
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-treesitter/nvim-treesitter-context'
-- highlight the word under current cursor
Plug 'RRethy/vim-illuminate'
-- highlight sets of matching text
Plug 'andymass/vim-matchup'
-- enhance the fold looks
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
-- better git signs
Plug 'lewis6991/gitsigns.nvim'
-- scroll bar
Plug 'petertriho/nvim-scrollbar'
-- comment
Plug 'numToStr/Comment.nvim'
-- nerd tree
Plug 'nvim-tree/nvim-tree.lua'
vim.call('plug#end')

require('plugins.color')
require('plugins.gitsigns')
require('plugins.hop')
require('plugins.neoscroll')
require('plugins.scrollbar')
require('plugins.suda')
require('plugins.treesitter')
require('plugins.vim-repeat')
require('plugins.vim-header')
require('plugins.wilder')
require('plugins.coc')
