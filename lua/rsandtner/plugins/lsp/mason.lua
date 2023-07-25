local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    vim.notify("could not load mason")
    return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    vim.notify("could not load mason-lspconfig")
    return
end

local servers = {
    "lua_ls",
    "gopls",
    "jsonls",
    "tsserver",
}

local settings = {
	ui = {
		border = "none",
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}


mason.setup(settings)
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local config = require("rsandtner.plugins.lsp.config")
for _, server in pairs(servers) do

    local opts = {
        on_attach = config.on_attach,
        capabilities = config.capabilities,
    }

    local lsp_conf_ok, conf = pcall(require, "rsandtner.plugins.lsp.config." .. server)
    if lsp_conf_ok then
        opts = vim.tbl_deep_extend("force", conf, opts)
    end

    require("lspconfig")[server].setup(opts)
end
