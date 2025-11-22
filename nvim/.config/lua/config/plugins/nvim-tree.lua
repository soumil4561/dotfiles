return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
      require("nvim-web-devicons").setup()
      require("config.keybinds") -- Ensure this matches your folder structure
    end,
  }
  
  