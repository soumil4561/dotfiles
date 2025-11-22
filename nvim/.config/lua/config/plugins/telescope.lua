return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
      require("config.keybinds").setup()  -- Call the setup function
    end
  }
  