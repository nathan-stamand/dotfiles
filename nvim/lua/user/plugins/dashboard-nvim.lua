local dashboard = require('dashboard')

dashboard.setup({
  config = {
    header = {
      '',
      " b.             8          .8.    8888888 8888888888 8 8888        8          .8.          b.             8 ",
      " 888o.          8         .888.         8 8888       8 8888        8         .888.         888o.          8 ",
      " Y88888o.       8        :88888.        8 8888       8 8888        8        :88888.        Y88888o.       8 ",
      " .`Y888888o.    8       . `88888.       8 8888       8 8888        8       . `88888.       .`Y888888o.    8 ",
      " 8o. `Y888888o. 8      .8. `88888.      8 8888       8 8888        8      .8. `88888.      8o. `Y888888o. 8 ",
      " 8`Y8o. `Y88888o8     .8`8. `88888.     8 8888       8 8888        8     .8`8. `88888.     8`Y8o. `Y88888o8 ",
      " 8   `Y8o. `Y8888    .8' `8. `88888.    8 8888       8 8888888888888    .8' `8. `88888.    8   `Y8o. `Y8888 ",
      " 8      `Y8o. `Y8   .8'   `8. `88888.   8 8888       8 8888        8   .8'   `8. `88888.   8      `Y8o. `Y8 ",
      " 8         `Y8o.`  .888888888. `88888.  8 8888       8 8888        8  .888888888. `88888.  8         `Y8o.` ",
      " 8            `Yo .8'       `8. `88888. 8 8888       8 8888        8 .8'       `8. `88888. 8            `Yo ",
      '',
   },
    center = {
      { icon = '  ', desc = 'New file', action = 'enew' },
      { icon = '  ', shortcut = 'SPC f', desc = 'Find file', action = 'Telescope find_files' },
      { icon = '  ', shortcut = 'SPC h', desc = 'Recent files', action = 'Telescope oldfiles' },
      { icon = '  ', shortcut = 'SPC g', desc = 'Find Word', action = 'Telescope live_grep' },
    },
    footer = {}
  }
})

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
