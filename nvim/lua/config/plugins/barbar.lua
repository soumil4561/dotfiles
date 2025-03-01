return {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false -- Disable automatic setup to allow manual configuration
    end,
    config = function()
      require("barbar").setup({
        -- You can customize settings here
        animation = true,
        auto_hide = false,
        insert_at_end = true,
        maximum_padding = 2,
      })
    end,
    version = "^1.0.0", -- Only update when a new 1.x version is released
  }
  