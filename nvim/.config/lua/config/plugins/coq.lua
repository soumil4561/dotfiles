return {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- Main COQ plugin
      { "ms-jpq/coq_nvim", branch = "coq" },
  
      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
  
      -- Third-party integrations (Optional)
      { "ms-jpq/coq.thirdparty", branch = "3p" }
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = "shut-up", -- Automatically starts COQ without messages
        keymap = {
          recommended = true, -- Default keybindings for autocomplete
        },
        clients = {
          lsp = {
            enabled = true,
          },
        },
      }
    end,
    config = function()
      -- Load COQ
      local coq = require("coq")
  
      -- Setup LSP with COQ
      local lspconfig = require("lspconfig")
  
      lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({
        on_attach = function(client, bufnr)
          -- LSP Keymaps (optional)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end
      }))
  
      lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({}))
      lspconfig.pyright.setup(coq.lsp_ensure_capabilities({}))
    end,
  }
