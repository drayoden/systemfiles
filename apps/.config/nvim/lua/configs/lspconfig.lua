require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "tailwindcss", "typescript" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
