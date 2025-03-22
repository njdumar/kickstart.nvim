-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Keybind the function keys for some general purposes
-- Don't wrap lines
vim.opt.wrap = false

-- Use syntax highlighting for hex editing
vim.opt.ft = 'xxd'

-- Set the width of tabs
vim.opt.tabstop = 4
--vim.opt.expandtab = true
--

-- Remember the cursor location when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = { '*' },
  callback = function()
    if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
      vim.api.nvim_exec2('normal! g\'"', { output = false })
    end
  end,
})

return {
  'christoomey/vim-tmux-navigator',
  'guns/xterm-color-table.vim',
  'norcalli/nvim-colorizer.lua',
  'aklt/plantuml-syntax',
  'arecarn/vim-crunch',
  'scrooloose/nerdtree',
  'tomtom/tcomment_vim',

  { -- Search all files in project using :Ag
    'xolox/vim-notes',
    dependencies = {
      'xolox/vim-misc',
    },
    --opts = {
    --  notes_directories = { '~/dotfiles/notes' },
    --},
  },
  { -- Search all files in project using :Ag
    'rking/ag.vim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
  },
}
