-- Fuzzy find files and grep
vim.api.nvim_create_user_command(
  'Files', 
  'call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)',
  { nargs = '?', complete = "dir", bang=true }
)

vim.api.nvim_create_user_command(
  'Rg',
  [[call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),1,<bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)]],
  { bang = true, nargs = '*' }
)

vim.api.nvim_set_keymap("n", "<leader>e", ":Files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ag", ":Rg<CR>", { noremap = true })

