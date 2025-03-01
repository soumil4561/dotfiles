local M = {}

function M.setup()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Telescope keybindings
    map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
    map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

    -- NvimTree keybindings
    map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
    map("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
    map("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- LSP keybindings
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)       -- Go to definition
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)      -- Go to declaration
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)       -- Show references
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)   -- Go to implementation
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)             -- Hover documentation
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Code actions
    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)   -- Rename variable
    map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)     -- Previous diagnostic
    map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)     -- Next diagnostic
    map("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)      -- Show diagnostics in Telescope

    -- LSP: Ctrl + Click to go to definition
    map("n", "<C-LeftMouse>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- map("n", "<Mouse4>", ":b#<CR>", opts) -- Mouse4 (Back Button) = Go to previous buffer
    map("n", "<M-LeftMouse>", ":b#<CR>", opts) -- Mouse4 (back button) to switch to the previous buffer

    vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste in insert mode" })
    vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
    vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
    vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
    vim.keymap.set("n", "<C-S-v>", '"+P', { desc = "Paste before cursor" })
    vim.keymap.set("c", "<C-v>", "<C-r>+", { desc = "Paste in command mode" })
    vim.keymap.set("t", "<C-v>", "<C-r>+", { desc = "Paste in terminal mode" })

    -- Save
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })

-- Quit
vim.keymap.set("n", "<C-q>", ":q<CR>", { desc = "Quit Neovim" })
vim.keymap.set("n", "<C-S-q>", ":q!<CR>", { desc = "Force Quit Neovim" })

-- Undo & Redo
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<C-z>", "<Esc>u", { desc = "Undo in insert mode" })
vim.keymap.set("n", "<C-y>", "<C-r>", { desc = "Redo" })
vim.keymap.set("i", "<C-y>", "<Esc><C-r>a", { desc = "Redo in insert mode" })

-- Select All (Like Ctrl+A in other editors)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all text" })

-- Close Buffer (Like closing a tab)
vim.keymap.set("n", "<C-w>", ":bd<CR>", { desc = "Close buffer" })

-- Save & Quit all
vim.keymap.set("n", "<C-S-s>", ":wa<CR>", { desc = "Save all files" })
vim.keymap.set("n", "<C-S-q>", ":qa<CR>", { desc = "Quit all files" })

-- Open File Explorer
vim.keymap.set("n", "<C-e>", ":Ex<CR>", { desc = "Open file explorer (netrw)" })

-- Delete selected text using Backspace
vim.api.nvim_set_keymap("v", "<BS>", "d", { noremap = true, silent = true })

end

return M
