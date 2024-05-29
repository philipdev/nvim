return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			prompt_save_on_select_new_entry = false,
			cleanup_delay_ms = 2000,
			lsp_file_methods = {
				autosave_changes = true,
			},
			experimental_watch_for_changes = true,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-q>"] = "actions.close",
				["<C-c>"] = "actions.refresh",
				["<BS>"] = "actions.parent",
				["\\"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			-- Set to false to disable all of the above keymaps
			use_default_keymaps = false,

			git = {
				-- Return true to automatically git add/mv/rm files
				add = function(path)
					return true
				end,
				mv = function(src_path, dest_path)
					return true
				end,
				rm = function(path)
					return true
				end,
			},
		})

		vim.keymap.set("n", "\\", function()
			-- vim.api.nvim_set_current_dir(vim.fn.stdpath("config") )
			require("oil").open()
		end, { desc = "Resize" })
	end,
}
