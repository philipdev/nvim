return {
	"chentoast/marks.nvim",
	config = function()
		local marks = require("marks")

		marks.setup({})
		vim.keymap.set({ "n", "i", "v" }, "<M-]>", marks.next, { desc = "<<M-[> Next mark" })
		vim.keymap.set({ "n", "i", "v" }, "<M-[>", marks.prev, { desc = "<M-[> Prev mark" })
		vim.keymap.set({ "n", "i", "v" }, "<M-m>", marks.toggle, { desc = "<M-m> Toggle mark" })
	end,
}
