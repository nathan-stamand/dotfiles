require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  view = {
    width = 40,
  },
  renderer = {
    highlight_opened_files = 'name',
    group_empty = true,
    icons = {
      show = {
        folder_arrow = true,
      },
      glyphs = {
        git = {
          unstaged = "◌",
          untracked = "󰐕",
          ignored = "󱙄",
        },
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    custom = {
      "^\\.git$",
    },
  },
})

vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { silent = true })
