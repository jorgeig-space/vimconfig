vim.api.nvim_set_keymap('n', '<leader>g', ':G<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>gc', ':BCommits<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>gac', ':Commits<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>gP', ':G push origin<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>gp', ':G pull origin<CR>', {})

vim.o.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

require('gitsigns').setup()
