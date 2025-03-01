return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup({
        -- Add your custom configurations here
        attach_navic = true, -- Enable integration with nvim-navic
      })
    end,
  }
  