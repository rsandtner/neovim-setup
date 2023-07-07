
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.keymap.set

-- map space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  n -> normal mode
--  i -> insert mode
--  v -> visual mode
--  x -> visual block mode
--  t -> term mode
--  c -> command mode

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)                    -- select left window
keymap("n", "<C-j>", "<C-w>j", opts)                    -- upper window
keymap("n", "<C-k>", "<C-w>k", opts)                    -- select lower window
keymap("n", "<C-l>", "<C-w>l", opts)                    -- select right window

-- resize window
keymap("n", "<M-j>", ":resize -2<cr>", opts)            -- option-j for horizontal decrease
keymap("n", "<M-k>", ":resize +2<cr>", opts)            -- option-k horizontal increase
keymap("n", "<M-h>", ":vertical resize +2<cr>", opts)   -- option-h vertical increase
keymap("n", "<M-l>", ":vertical resize -2<cr>", opts)   -- option-l vertical decrease

-- open Lex
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- move line up/down
keymap("n", "<M-Up>", ":m .-2<cr>==", opts)
keymap("n", "<M-Down>", ":m .+1<cr>==", opts)
keymap("v", "<M-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<M-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
