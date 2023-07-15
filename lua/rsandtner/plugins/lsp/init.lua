local ok, _ = pcall(require, "lspconfig")
if not ok then
    vim.notify("could not load lspconfig")
    return
end

require("rsandtner.plugins.lsp.mason")
require("rsandtner.plugins.lsp.config.lsp").configure()

