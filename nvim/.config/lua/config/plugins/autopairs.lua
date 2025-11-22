return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
  
      npairs.setup({
        check_ts = true, -- Enable Treesitter integration
        disable_filetype = { "TelescopePrompt", "vim" },
        fast_wrap = {
          map = "<M-e>", -- Wrap existing text with brackets using Alt+E
          chars = { "{", "[", "(", '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })
  
      -- If you use cmp (nvim-cmp), integrate it with autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
  
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  }
  