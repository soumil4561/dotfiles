return {
  -- Mason for installing LSP servers, formatters, linters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "lua-language-server",
        "json-lsp",
        "clangd", -- C++ LSP
        "jdtls", -- Java LSP
        "python-lsp-server", -- Python LSP
        "clang-format", -- C++ Formatter
        "prettier", -- JS/TS, JSON, HTML, CSS Formatter
        "eslint_d", -- JS/TS Linter
        "black", -- Python Formatter
        "flake8", -- Python Linter
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then p:install() end
      end
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
        severity_sort = true,
      },
      capabilities = {}, -- Will be set dynamically below
      autoformat = true,
      servers = {
        ts_ls = {}, -- JS/TS LSP
        jsonls = {}, -- JSON LSP
        lua_ls = { -- Lua LSP
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
            },
          },
        },
        clangd = {}, -- C++ LSP
        jdtls = {}, -- Java LSP
        pylsp = {}, -- Python LSP
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("coq").lsp_ensure_capabilities(),
        opts.capabilities or {}
      )

      for server, server_opts in pairs(opts.servers) do
        lspconfig[server].setup(vim.tbl_deep_extend("force", { capabilities = capabilities }, server_opts))
      end

      vim.diagnostic.config(opts.diagnostics)
    end,
  },

  -- null-ls for formatting & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          -- Formatters
          null_ls.builtins.formatting.prettier, -- JS/TS, JSON, HTML, CSS
          null_ls.builtins.formatting.stylua, -- Lua
          null_ls.builtins.formatting.clang_format, -- C++
          null_ls.builtins.formatting.black, -- Python

          -- Linters
          null_ls.builtins.diagnostics.eslint_d, -- JS/TS
          null_ls.builtins.diagnostics.flake8, -- Python
        },
      }
    end,
    config = function(_, opts)
      require("null-ls").setup(opts)
    end,
  },

  -- Auto-install formatters & linters
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
    opts = {
      ensure_installed = { "prettier", "stylua", "eslint_d", "clang-format", "black", "flake8" },
      automatic_installation = true,
    },
  },

  -- Keybind to format files
  {
    "folke/which-key.nvim",
    opts = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>f"] = { function() vim.lsp.buf.format({ async = true }) end, "Format File" },
      })
    end,
  }
  
  
}
