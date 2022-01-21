lua << EOF
require("telescope").setup({
  defaults = {
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
  },
  fzy_native = {
    override_generic_sorter = false,
    override_file_sorter = true,
  },
})

require("telescope").load_extension("fzy_native")
EOF
