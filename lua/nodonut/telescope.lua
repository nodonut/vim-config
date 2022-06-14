local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		path_display = function(opts, path)
			local tail = require("telescope.utils").path_tail(path)
			return string.format("%s (%s)", tail, path)
		end,
		file_ignore_patterns = { "node_modules" },
		mappings = {
			i = {
				["<C-u>"] = false,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")

local M = {}

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<cr>", actions.git_switch_branch)
			map("n", "<cr>", actions.git_switch_branch)
			return true
		end,
	})
end

M.git_status = function()
	require("telescope.builtin").git_status()
end

M.git_commits = function()
	require("telescope.builtin").git_commits()
end

return M
