require("nathan")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options

require("lazy").setup({
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        }
    },
    {
        'EdenEast/nightfox.nvim',
        priority = 1000,
        lazy = false,
        config = function() 
            vim.cmd('colorscheme nightfox')
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }        
        }
    },
    {
        'tpope/vim-commentary',
        config = function()
            -- Maintain cursor position
            vim.keymap.set('n', 'gcap', 'my<cmd>norm vip<bar>gc<cr>`y')
        end
    },
    {
        -- Add, change, and delete surrounding text.
        'tpope/vim-surround'
    },
    {
        -- Pairs of handy bracket mappings, like [b and ]b.
        'tpope/vim-unimpaired'
    },
    {
        -- Automatically adjusts 'shiftwidth' and 'expandtab' based on the 
        -- current file, or in the case that a file is new or otherwise vague,
        -- it checks other same-typed files in the directory / parent directories
        'tpope/vim-sleuth'
    },
    {
        -- Remaps . command in such a way that plugins can use it
        'tpope/vim-repeat'
    },
    {
        -- Provides mappings consistent w/ tmux navigation for vim.
        -- ex: ctrl + l moves to left pane, as ctrl + {tmux leader} + l does
        -- the same for tmux panes
        'christoomey/vim-tmux-navigator'
    },
    {
        -- Opens files at last location you had them
        'farmergreg/vim-lastplace'
    },
    {
        -- select text visually then hit * to search the document for it
        'bronson/vim-visual-star-search',
    },
    {
        -- create non-existent directories when creating nested files
        -- :e nonexistent/file/path/to/file.txt will create every non-existent
        -- directory before saving the file
        'jessarcher/vim-heritage',
    },
    {
        -- gives us the 'x' object for manipulating XML/HTML properties as a 
        -- whole unit. For example: you can delete the class of a div and its
        -- contents in one fell swoop with 'dax', or replace it and leave a 
        -- space with 'cix'
        'whatyouhide/vim-textobj-xmlattr',
        dependencies = { 
            'kana/vim-textobj-user',
        }
    },
    {
        'airblade/vim-rooter',
        lazy = false,
        init = function()
            -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
            vim.g.rooter_manual_only = 1
            vim.g.rooter_patterns = {'.git', 'composer.json'}
        end,
        config = function()
            vim.cmd('Rooter')
        end,
    },
    {
        -- Automatically add closing brackets, quotes, etc.
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    },
    {
        -- Add smooth scrolling to avoid jarring jumps
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end,
    },
    {
        -- Automatically fix indentation when pasting code.
        'sickill/vim-pasta',
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end,
    },
    {
        -- A Status line.
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'arkav/lualine-lsp-progress',
            'kyazdani42/nvim-web-devicons',
        },
    },
    {
        -- Display buffers as tabs.
        'akinsho/bufferline.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
    },
    {
        -- Display indentation lines.
        'lukas-reineke/indent-blankline.nvim',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = '⢕' },
                    change = { text = '⢕' },
                },
            })
            vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
            vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
            vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
            vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
            vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
            vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
        end,
    },
    {
        'tpope/vim-fugitive',
        dependencies = {'tpope/vim-rhubarb'},
    },
    {
        'voldikss/vim-floaterm'
    },
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({
                user_default_options = {
                    names = false,
                }
            })
        end,
    },
    {
        -- Improved syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/playground',
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'b0o/schemastore.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'jayp0521/mason-null-ls.nvim',
        },
    },
    {
        -- Completion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            -- 'hrsh7th/cmp-copilot',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
    },
    {
        -- All closing buffers without closing the split window.
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
            vim.keymap.set('n', '<Leader>Q', ':bufdo Bdelete<CR>')
        end,
    }
})
