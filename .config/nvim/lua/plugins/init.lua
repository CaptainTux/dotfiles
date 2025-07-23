return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_mappings_enabled = 1
      vim.g.vimtex_indent_enabled = 1

      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_context_pdf_viewer = "zathura"

      vim.opt.spell = true
      vim.opt.spelllang = "en_us"
    end,
  },

  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = { "rust" },
    config = function(_, _)
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {},
        -- LSP configuration
        server = {
          on_attach = function(_, bufnr)
            -- you can also put keymaps in here
            vim.keymap.set("n", "<leader>a", require("actions-preview").code_actions, { buffer = bufnr })
            -- function()
            -- vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
            -- or vim.lsp.buf.codeAction() if you don't want grouping.
            -- end, { silent = true, buffer = bufnr })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
            vim.keymap.set(
              "n",
              "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
              function()
                -- vim.lsp.buf.hover({ border = 'single' })
                vim.cmd.RustLsp { "hover", "actions" }
              end,
              { silent = true, buffer = bufnr }
            )
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
              cachePriming = { enabled = false },
            },
          },
        },
        -- DAP configuration
        dap = {},
      }
    end,
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "LspAttach",
  --   dependencies = {
  --     {
  --       "garymjr/nvim-snippets",
  --       opts = {
  --         friendly_snippets = true,
  --       },
  --       dependencies = { "rafamadriz/friendly-snippets" },
  --     },
  --   },
  --   opts = function()
  --     local cmp = require "nvchad.configs.cmp"
  --     cmp.mapping["<CR>"] = nil
  --     return cmp
  --   end,
  -- },
  -- {
  --   "Fildo7525/pretty_hover",
  --   event = "LspAttach",
  --   opts = {},
  -- },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      lazy = false,
      branch = 'master',
      build = ":TSUpdate",
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css"
  		},
  	},
  },
}
