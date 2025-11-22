return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java", "javascript", "html", "css"},
        highlight = { enable = true },
        indent = { enable = true }, -- Enables automatic indentation
      })
    end,
  }
