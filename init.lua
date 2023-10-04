local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:append('/opt/homebrew/opt/fzf')

require('lazy').setup({
  -- Color scheme
  {'morhetz/gruvbox'},
  -- Some small keybindings
  -- Command cs (change surrounding) ds (delete surrounding) to manipulate surrounding delimiters
  {'tpope/vim-surround'},
  -- Press - to open a file list
  {'tpope/vim-vinegar'},

  -- Airline
  {'vim-airline/vim-airline'},
  {'vim-airline/vim-airline-themes'},

  -- Folding
  {'kevinhwang91/nvim-ufo',
    dependencies = {
      {'kevinhwang91/promise-async'},
    }
  },

  -- Git
  {'tpope/vim-fugitive'},
  {'junegunn/gv.vim'},
  {'junegunn/fzf', build=':call fzf#install()'},
  {'junegunn/fzf.vim'},

  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'L3MON4D3/LuaSnip'}
    },
  },
})

vim.cmd.colorscheme('gruvbox')


local o = vim.o -- Global options
local wo = vim.wo -- Window-local options
local bo = vim.bo -- Buffer-local options

-- global options
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.splitbelow = true
o.splitright = true

-- window-local options
wo.number = true 
wo.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.swapfile = false

vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':BLines<CR>', { noremap = true })

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- LSP configs
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({})
require('ts-config')


-- Other functions
require('autocomplete')
require('fzf')
require('git')
require('airline')
require('folding')

