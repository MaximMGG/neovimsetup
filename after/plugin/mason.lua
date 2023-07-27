require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installled = { "lua_ls", "jdtls" }
}
