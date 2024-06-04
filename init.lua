-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 1000

-- Configure how new splits should be openedvim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

vim.opt.jumpoptions = "stack"

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set({ "n", "v", "i" }, "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set({ "n", "v", "i" }, "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set({ "n", "v", "i" }, "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set({ "n", "v", "i" }, "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set({ "n" }, "<BS>", "<cmd>bprev<CR><Esc>", { desc = "Go to previous buffer" })
vim.keymap.set({ "n" }, "<CR>", "<cmd>bnext<CR><Esc>", { desc = "Go to next buffer" })
vim.keymap.set({ "n", "v", "i" }, "<M-BS>", "<cmd>bprev<CR><Esc>", { desc = "Go to previous buffer" })
vim.keymap.set({ "n", "v", "i" }, "<M-CR>", "<cmd>bnext<CR><Esc>", { desc = "Go to next buffer" })

vim.keymap.set("n", "<M-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<M-|>", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<M-_>", "<C-w>s", { desc = "Split horizontal" })

vim.keymap.set("n", "<M-;>", "<C-w>+", { desc = "Resize " })
vim.keymap.set("n", "<M-'>", "<C-w>-", { desc = "Resize" })
vim.keymap.set("n", "<M-,>", "<C-w><", { desc = "Resize " })
vim.keymap.set("n", "<M-.>", "<C-w>>", { desc = "Resize" })
vim.keymap.set({ "n", "v" }, "<C-z>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<C-x>", "<C-d>zz")

--vim.keymap.del("n", "<C-q>")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-q>", "<cmd>copen<CR>")
vim.keymap.set("n", "<C-Q>", "<cmd>cclose<CR>")

vim.keymap.set("n", "<leader>nc", function()
	local dir = vim.fn.stdpath("config")
	vim.api.nvim_set_current_dir(dir)
	print("cd " .. dir)
end, { desc = "Change Directory to nvim config" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

vim.api.nvim_create_autocmd({ "UIEnter" }, {
	callback = function()
		if vim.fn.has("gui_running") then
			-- vim.cmd("call GuiClipboard()")
			function ToggleFullScreen()
				if 1 == vim.g.GuiWindowFullScreen then
					vim.cmd("call GuiWindowFullScreen(0)")
				else
					vim.cmd("call GuiWindowFullScreen(1)")
				end
			end
			vim.keymap.set({ "n", "v", "i", "x", "c", "o" }, "<F12>", ToggleFullScreen, { desc = "Toggle fullscreen" })
		end
	end,
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
