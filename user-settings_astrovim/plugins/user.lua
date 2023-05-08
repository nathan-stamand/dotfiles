return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "praem90/nvim-phpcsf",
    opts = {
      nvim_phpcs_config_phpcs_standard = "/home/nathansa/.phpcs.xml",
    },
  },
}
