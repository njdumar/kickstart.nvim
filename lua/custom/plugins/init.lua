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

vim.keymap.set('n', '<F1>', '<cmd>term<cr>', {})
vim.keymap.set('n', '<F2>', '<cmd>NERDTreeToggle<cr>', { noremap = true })
vim.keymap.set('n', '<F5>', '<cmd>%!xxd<cr>', { noremap = true })
vim.keymap.set('n', '<C-F5>', '<cmd>%!xxd -r<cr>', { noremap = true })
vim.keymap.set('n', '<F8>', '<cmd>tabnew<cr>', { noremap = true })
vim.keymap.set('n', '<F9>', '<cmd>tabclose<cr>', { noremap = true })

-- Remember the cursor location when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = { '*' },
  callback = function()
    if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
      vim.api.nvim_exec2('normal! g\'"', { output = false })
    end
  end,
})

local SymbolKind = vim.lsp.protocol.SymbolKind

return {
  'christoomey/vim-tmux-navigator',
  'guns/xterm-color-table.vim',
  'norcalli/nvim-colorizer.lua',
  'aklt/plantuml-syntax',
  'arecarn/vim-crunch',
  'scrooloose/nerdtree',
  'tomtom/tcomment_vim',

  { -- catppuccin colorscheme
    'catppuccin/nvim',
    name = 'catppuccin',
    --priority = 1000,
  },
  { -- vim-go LSP
    'fatih/vim-go',
    vim.keymap.set('n', '<leader>b', '<cmd>GoBuild<CR>'),
    vim.keymap.set('n', '<leader>i', '<cmd>GoInstall<CR>'),
    vim.keymap.set('n', '<leader>r', '<cmd>GoRun<CR>'),
    opts = {
      go_fmt_autosave = 1,
      go_imports_autosave = 0,
      go_term_mode = 'split',
      go_term_enabled = 1,

      go_highlight_fields = 1,
      go_highlight_functions = 1,
      go_highlight_function_calls = 1,
      go_highlight_extra_types = 1,
      go_highlight_operators = 1,
      go_highlight_types = 1,
    },
    config = function() end,
  },
  { -- Search all files in project using :Ag
    'xolox/vim-notes',
    dependencies = {
      'xolox/vim-misc',
    },
    -- config = function()
    --   opts = {
    --     notes_directories = { '~/dotfiles/notes' },
    --   }
    -- end,
    vim.api.nvim_command "let g:notes_directories = ['~/dotfiles/notes']",
  },
  { -- Search all files in project using :Ag
    'rking/ag.vim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
  },
  {
    'VidocqH/lsp-lens.nvim',
    opts = {
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
        definition = false,
        references = true,
        implements = true,
        git_authors = true,
      },
      ignore_filetype = {
        'prisma',
      },
      -- Target Symbol Kinds to show lens information
      target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
      -- Symbol Kinds that may have target symbol kinds as children
      wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
    },
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
}
