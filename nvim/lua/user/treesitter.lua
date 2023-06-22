local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
    {
      "jwalton512/vim-blade",
      event = "VeryLazy",
    },
  },
}

function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

  parser_config.erb = {
    install_info = {
      url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
      files = { "src/parser.c" },
    },
    filetype = "erb",
  }

  configs.setup {
    ensure_installed = {
      "bash",
      "dockerfile",
      "gitignore",
      "html",
      "javascript",
      "json",
      "json5",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "ruby",
      "scss",
      "typescript",
      "vue",
      "yaml",
    },
    -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" },                                                       -- List of parsers to ignore installing
    sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = {}, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = {} },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M
