
local jdtls = require('jdtls')
-- Change or delete this if you don't depend on nvim-cmp for completions.
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Change jdtls_path to wherever you have your Eclipse Java development tools (JDT) Language Server downloaded to.
local jdtls_path = 'C:/users/123/appdata/local/nvim-data/mason/packages/jdtls'
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
	  java = {
    signatureHelp = { enabled = true };
    contentProvider = { preferred = 'fernflower' };
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*"
      },
      filteredTypes = {
        "com.sun.*",
        "io.micrometer.shaded.*",
        "java.awt.*",
        "jdk.*",
        "sun.*",
      },
    };
    sources = {
      organizeImports = {
        starThreshold = 9999;
        staticStarThreshold = 9999;
      };
    };
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
      },
      hashCodeEquals = {
        useJava7Objects = true,
      },
      useBlocks = true,
    };
    configuration = {
      runtimes = {
        {
          name = "JavaSE-1.8",
          path = "/usr/lib/jvm/java-8-openjdk/",
        },
        {
          name = "JavaSE-19",
          path = "C:/Program Files/Java/jdk-19/",
        },
      }
    };
  };
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
		"-javaagent:C:/users/123/appdata/local/nvim-data/mason/packages/jdtls/lombok.jar",
		"-configuration", vim.fs.normalize(jdtls_path .. '/' .. get_config_dir()),
		"-data", vim.fn.expand('~/jdtls-workspace/') .. workspace_dir
	},
	settings = {
		['java.format.settings.url'] = vim.fn.expand("~/formatter.xml")
	},
	root_dir = vim.fs.dirname(vim.fs.find({ 'pom.xml', '.git' }, { upward = true })[1]),
	init_options = {
        bundles = bundles,
		-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
		extendedClientCapabilities = jdtls.extendedClientCapabilities,

		-- bundles = vim.tbl_flatten {
		-- 	vim.fn.glob('C:/users/123/appdata/local/nvim-data/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1), 
		-- 	vim.list_extend(bundles, vim.split(vim.fn.glob(
		-- 	'C:/users/123/appdata/local/nvim-data/mason/packages/java-test/extendsion/sever/*.jar'), "\n"
		-- 	)),
  --       },
	},

	on_attach = function(client, bufnr)
		require("jdtls").setup_dap({hotcodereplace = 'auto'})
		require("jdtls").add_commands()

		-- https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L88-L94
		local opts = { silent = true, buffer = bufnr }
		vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
		-- Should 'd' be reserved for debug?
		vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
        vim.keymap.set("n", "<leader>ce", jdtls.extract_variable, opts)
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
		vim.keymap.set('n', "<leader>tc", jdtls.test_class, opts)
		vim.keymap.set('n', "<leader>tm", jdtls.test_nearest_method, opts)


		require('jdtls').setup_dap({hotcodereplace = 'auto'})
	end
}
local jar_patterns = {
  'C:/users/123/appdata/local/nvim-data/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
}
-- npm install broke for me: https://github.com/npm/cli/issues/2508
-- So gather the required jars manually; this is based on the gulpfile.js in the vscode-java-test repo
local plugin_path = '/packages/java-test/extension/server/'
local bundle_list = vim.tbl_map(
  function(x) return require('jdtls.path').join(plugin_path, x) end,
  {
    'org.eclipse.jdt.junit4.runtime_*.jar',
    'org.eclipse.jdt.junit5.runtime_*.jar',
    'org.junit.jupiter.api*.jar',
    'org.junit.jupiter.engine*.jar',
    'org.junit.jupiter.migrationsupport*.jar',
    'org.junit.jupiter.params*.jar',
    'org.junit.vintage.engine*.jar',
    'org.opentest4j*.jar',
    'org.junit.platform.commons*.jar',
    'org.junit.platform.engine*.jar',
    'org.junit.platform.launcher*.jar',
    'org.junit.platform.runner*.jar',
    'org.junit.platform.suite.api*.jar',
    'org.junit.platform.suite-commons*.jar',
    'org.junit.platform.suite-engine*.jar',
    'org.apiguardian*.jar'
  }
)
vim.list_extend(jar_patterns, bundle_list)
local bundles = {}
for _, jar_pattern in ipairs(jar_patterns) do
  for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), '\n')) do
    if not vim.endswith(bundle, 'com.microsoft.java.test.runner-jar-with-dependencies.jar') then
      table.insert(bundles, bundle)
    end
  end
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities;
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true;
config.init_options = {
  bundles = bundles;
  extendedClientCapabilities = extendedClientCapabilities;
}

jdtls.start_or_attach(config)
