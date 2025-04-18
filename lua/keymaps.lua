-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local function setKeybindN(key, cmd, desc)
  vim.keymap.set('n', key, cmd, { desc = desc })
end

local function setKeybindV(key, cmd, desc)
  vim.keymap.set('V', key, cmd, { desc = desc })
end

local function setKeybindT(key, cmd, desc)
  vim.keymap.set('t', key, cmd, { desc = desc })
end

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
setKeybindN('<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
setKeybindN('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
setKeybindT('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode')

-- set keybinds to open [t]erminal, [g]it, [y]azi
-- vim.keymap.set('n', '<leader>tg', '<cmd> Term gitui <CR>', { desc = 'Open popup [T]erminal with [G]itUI' })
setKeybindN('<leader>tg', '<cmd> Term gitui <CR>', 'Open popup [T]erminal with [G]itUI')
-- vim.keymap.set('n', '<leader>tt', '<cmd> Term <CR>', { desc = 'Open popup [T]erminal' })
setKeybindN('<leader>tt', '<cmd> Term <CR>', 'Open popup [T]erminal')
-- vim.keymap.set('n', '<leader>ty', '<cmd> Term yazi <CR>', { desc = 'Open popup [T]erminal with [Y]azi' })
setKeybindN('<leader>ty', '<cmd> Term yazi <CR>', 'Open popup [T]erminal with [Y]azi')

-- set a keybind to go back to the file tree
-- NOTE: i might want to find a new one, or
-- keep using yazi and telescope

-- vim.keymap.set('n', '<leader>bf', '<cmd> Ex <CR>', { desc = 'Go [B]ack to [F]ile tree' })
setKeybindN('<leader>bf', '<cmd> Ex <CR>', 'Go [B]ack to [F]ile tree')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

setKeybindN('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
setKeybindN('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
setKeybindN('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
setKeybindN('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
