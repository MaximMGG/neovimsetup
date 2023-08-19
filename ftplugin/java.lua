
local jdtls = require('jdtls')
-- Change or delete this if you don't depend on nvim-cmp for completions.
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Change jdtls_path to wherever you have your Eclipse Java development tools (JDT) Language Server downloaded to.
local jdtls_path = 'C:/users/maxim/appdata/local/nvim-data/mason/packages/jdtls'
local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

vim.o.tabstop = 4
vim.o.shiftwidth = 0

-- for completions
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)


local function get_config_dir()
	-- Unlike some other programming languages (e.g. JavaScript)
	-- lua considers 0 truthy!
	if vim.fn.has('linux') == 1 then
		return 'config_linux'
	elseif vim.fn.has('mac') == 1 then
		return 'config_mac'
	else
		return 'config_win'
	end
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	capabilities = capabilities,
	cmd = {
		-- This sample path was tested on Cygwin, a "unix-like" Windows environment.
		-- Please contribute to this Wiki if this doesn't work for another Windows
		-- environment like [Git for Windows](https://gitforwindows.org/) or PowerShell.
		-- JDTLS currently needs Java 17 to work, but you can replace this line with "java"
		-- if Java 17 is on your PATH.
		"C:/Program Files/Java/jdk-19/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens", "java.base/java.util=ALL-UNNAMED",
		"--add-opens", "java.base/java.lang=ALL-UNNAMED",
		"-jar", launcher_jar,
		"-javaagent:C:/users/maxim/appdata/local/nvim-data/mason/packages/jdtls/lombok.jar",
		"-configuration", vim.fs.normalize(jdtls_path .. '/' .. get_config_dir()),
		"-data", vim.fn.expand('~/jdtls-workspace/') .. workspace_dir
	},
	settings = {
		['java.format.settings.url'] = vim.fn.expand("~/formatter.xml")
	},
	root_dir = vim.fs.dirname(vim.fs.find({ 'pom.xml', '.git' , 'gradle.build'}, { upward = true })[1]),
	init_options = {
		-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
		extendedClientCapabilities = jdtls.extendedClientCapabilities,

		bundles = {
			-- vim.fn.glob("c:/users/123/appdata/local/nvim-data/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.47.0.jar", 1)
		},
	},

	on_attach = function(client, bufnr)
		-- https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L88-L94
		local opts = { silent = true, buffer = bufnr }
		vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
		-- Should 'd' be reserved for debug?
		vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
		vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
		vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
		vim.keymap.set('v', '<leader>rm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
		{ desc = 'Extract method', buffer = bufnr })
		vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })

		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		require('jdtls').setup_dap({hotcodereplace = 'auto'})
	end
}

jdtls.start_or_attach(config)
