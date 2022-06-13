local actions = require('telescope.actions')
require("telescope").setup({
  defaults = {
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
    file_ignore_patterns = {"node_modules"},
    mappings = {
      i = {
        ["<C-u>"] = false
      }
    }
  }
})

require("telescope").load_extension("fzy_native")
