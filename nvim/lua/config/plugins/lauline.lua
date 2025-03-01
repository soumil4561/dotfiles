return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", -- Uses the current colorscheme
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" }, -- Show mode (NORMAL, INSERT, etc.)
          lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch & LSP info
          lualine_c = { "filename" }, -- Show file name
          lualine_x = { "encoding", "fileformat", "filetype" }, -- Encoding info
          lualine_y = { "progress" }, -- Progress in file (e.g., 40%)
          lualine_z = { "location" }, -- Line & Column number
        },
      })
    end,
  }
  