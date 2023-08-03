local utils = require("core.utils")

local keymap = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- move up/down .5 page and center cursor
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- Better escape using jk in insert and terminal mode
keymap("i", "WW", "<ESC>:w<CR>")
keymap("i", "jk", "<ESC>")
keymap("t", "jk", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Navigate vim panes better
keymap("n", "<c-k>", ":wincmd k<CR>", { noremap = false, silent = true })
keymap("n", "<c-j>", ":wincmd j<CR>", { noremap = false, silent = true })
keymap("n", "<c-h>", ":wincmd h<CR>", { noremap = false, silent = true })
keymap("n", "<c-l>", ":wincmd l<CR>", { noremap = false, silent = true })

keymap("n", "<leader>h", ":set hlsearch! hlsearch?<CR>", defaults)

-- Copy/Paste
keymap("n", "yp", ':let @*=expand("%")<CR>', defaults)
keymap("n", "yP", ':let @*=expand("%:p")<CR>', defaults)

-- Yank entire file content
keymap("n", "yY", ":%y+<CR>", defaults)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', defaults)

-- break out of insert mode
keymap("i", "jj", "<ESC>", defaults)

-- toggle line numbers
keymap("n", "mn", ":set number! number?<CR>", defaults)

-- toggle search highlight
keymap("n", "mh", ":set hlsearch! hlsearch?<CR>", defaults)

-- shortcuts for quitting nvim
keymap("n", "mq", ":qall<CR>", defaults)
keymap("n", "mQ", ":qall!<CR>", defaults)

-- shortcuts for writing the file
keymap("n", "mw", ":w<CR>", defaults)
-- don't do this, it creates issues for typing
-- vim.keymap.set('i', 'mw', '<ESC>:w<CR>', { desc = 'Write buffer' })

-- delete all buffers
keymap("n", "mb", ":%bd|e#|bd#<CR>", defaults)

-- check an item
keymap("n", "mx", "r√<CR>", defaults)

-- set appfolio test_launcher
keymap("n", "mtl", ":let test#ruby#rails#executable = 'test_launcher'<CR>", defaults)

-- additional telescope mappings
-- see init.lua for mappings setup as part of kickstarter
keymap("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch [B]uffers" })

-- Rails.vim Alt file
keymap("n", "mA", ":A<CR>", defaults)

-- run a neovim plugin test file
keymap("n", "<leader>Tp", "<Plug>PlenaryTestFile<CR>", { desc = "Test Plugin" })

-- ruby: insert pry debug below cursor
keymap("n", "<leader>rP", 'orequire "pry";binding.pry<ESC>', { desc = "Insert Pry" })

-- use tab to cycle through buffers
keymap("n", "<TAB>", utils.goto_next_buffer, defaults)
-- vim.keymap.set('n', '<TAB>', ':bn<CR>', defaults)

-- use tshift+tab to cycle through tabs
keymap("n", "<S-TAB>", utils.goto_previous_buffer, defaults)
-- vim.keymap.set('n', '<S-TAB>', ':bp<CR>', defaults)

-- source the current file
keymap("n", "<leader>x", ":source %<CR>")

-- close the current buffer
keymap("n", "<M-w>", ":bd<CR>", defaults)

-- close all other buffers
keymap("n", "<M-W>", utils.only_buffer, { desc = "Yank qualified class name" })

keymap("n", "<Leader>cy", NS, defaults)

-- goto tab #
keymap("n", "<M-1>", ":tabnext 1<CR>", defaults)
keymap("n", "<M-2>", ":tabnext 2<CR>", defaults)
keymap("n", "<M-3>", ":tabnext 3<CR>", defaults)
keymap("n", "<M-4>", ":tabnext 4<CR>", defaults)
keymap("n", "<M-5>", ":tabnext 5<CR>", defaults)

-- format sql
-- requires `brew install pgformatter`
keymap("n", "<Leader>fs", ":%!pg_format<CR>", defaults)
keymap("v", "<Leader>fs", ":'<,'>!pg_format<CR>", defaults)

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +2<CR>", defaults)
keymap("n", "<Right>", ":vertical resize -2<CR>", defaults)
keymap("n", "<Up>", ":resize -2<CR>", defaults)
keymap("n", "<Down>", ":resize +2<CR>", defaults)

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
