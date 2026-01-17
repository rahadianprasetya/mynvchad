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
  'mrcjkb/rustaceanvim',
   version = '^5', -- Recommended
   lazy = false,
   ft = {"rust"},
   config = function ()
      vim.g.rustaceanvim = {
        dap = {
          autodetect = true,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end----
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end----
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.open()
      end----
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.open()
      end----      
    end----
  },
  { "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,  
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },
{
 'glepnir/lspsaga.nvim',
  branch = 'main',
  config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({
        -- beberapa opsi opsional
      })
    end  
},
{
  "williamboman/mason.nvim",
   opts = {
     ensure_installed = {
       "gopls"
     },
   },
},  

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
