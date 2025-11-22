return {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
        require("startup").setup({
            section_1 = {
                type = "text",
                content = {
                    "   ▄████████    ▄███████▄    ▄█    █▄       ",
                    "  ███    ███   ███    ███   ███    ███      ",
                    "  ███    █▀    ███    ███   ███    ███      ",
                    "  ███         ▄███▄▄▄▄██▀   ███    ███      ",
                    "  ███        ▀▀███▀▀▀▀▀     ███    ███      ",
                    "  ███    █▄  ▀███████████   ███    ███      ",
                    "  ███    ███   ███    ███   ███    ███      ",
                    "  ████████▀    ███    ███   ████████▀       ",
                },
                align = "center",
                fold_section = false,
            },
            section_2 = {
                type = "mapping",
                align = "center",
                fold_section = false,
                content = {
                    {"  Find File", "<leader>ff", "Telescope find_files"},
                    {"  Live Grep", "<leader>fg", "Telescope live_grep"},
                    {"  Recent Files", "<leader>fr", "Telescope oldfiles"},
                    {"  Config", "<leader>fc", "edit $MYVIMRC"},
                },
            },
            options = {
                mapping_keys = true,
                cursor_column = 0.5,
                disable_statuslines = true,
                paddings = {1, 2},
            },
            mappings = {
                execute_command = "<CR>",
                open_file = "o",
                open_file_split = "<c-o>",
                open_section = "<TAB>",
                open_help = "?",
            },
            colors = {
                background = "#1f2227",
                folded_section = "#56b6c2",
            },
            parts = {"section_1", "section_2"},
        })
        
    end
  }