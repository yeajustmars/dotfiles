return {
  { 'github/copilot.vim', lazy=false, },
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
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },


  -- {
  --   'rust-lang/rust.vim',
  --   ft = "rust",
  --   init = function ()
  --     vim.g.rustfmt_autosave = 1
  --   end
  -- },

  {
    'mfussenegger/nvim-dap',
    config = function()
			local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
		end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
			require("dapui").setup()
		end,
  },

  -- {
  --   'saecki/crates.nvim',
  --   ft = {"toml"},
  --   config = function()
  --     require("crates").setup {
  --       completion = {
  --         cmp = {
  --           enabled = true
  --         },
  --       },
  --     }
  --     require('cmp').setup.buffer({
  --       sources = { { name = "crates" }}
  --     })
  --   end
  -- },
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
  {
    "Olical/conjure",
    ft = { "clojure", "fennel" }, -- etc
    lazy = true,
    init = function()
      -- Set configuration options here
      -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
      -- This is VERY helpful when reporting an issue with the project
      -- vim.g["conjure#debug"] = true
      vim.g['conjure#log#hud#anchor'] = "SE"
      vim.g['conjure#log#hud#width'] = 1.0
      vim.g['conjure#log#hud#height'] =0.4
    end,

    -- Optional cmp-conjure integration
    dependencies = { "PaterJason/cmp-conjure" },
  },
  {
    "PaterJason/cmp-conjure",
    lazy = true,
    config = function()
      local cmp = require("cmp")
      local config = cmp.get_config()
      table.insert(config.sources, { name = "conjure" })
      return cmp.setup(config)
    end,
  },

  { 'guns/vim-sexp', ft = 'clojure' },
  { 'tpope/vim-sexp-mappings-for-regular-people', ft = 'clojure' },
  { 'tpope/vim-repeat', ft = 'clojure' },
  { 'tpope/vim-surround', ft = 'clojure' },
  { 'easymotion/vim-easymotion', ft = 'clojure' },

  {
    'dense-analysis/ale',
    ft = {'clojure', 'clojuescript', 'clojurec'},
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_ruby_rubocop_auto_correct_all = 1

        g.ale_linters = {
            ruby = {'rubocop', 'ruby'},
            lua = {'lua_language_server'},
            clojure = {'clj-kondo', 'joker'},
            -- clojure = {'clj-kondo'},
        }
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }
}
