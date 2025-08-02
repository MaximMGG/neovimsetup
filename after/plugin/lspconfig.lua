local lspconfig = require("lspconfig")


local function ensure_ols_config()
    local config_path = vim.fn.getcwd() .. "/ols.json"
    if vim.fn.filereadable(config_path) == 0 then
        local config = {
            diagnostics = true,
            completion = true,
            highlighting = true,
            inlayHints = true,
            autoImport = true,
            imports = true,
            suggestSnippets = false
        }
        local file = io.open(config_path, "w")
        file:write(vim.fn.json_encode(config))
        file:close()
     end
end

lspconfig["ols"].setup({
    on_attach = function()
        ensure_ols_config()
        -- vim.api.nvim_create_autocmd("CursorHoldI", {
        --     buffer = buf,
        --     callback = function()
        --         vim.lsp.buf.signature_help()
        --     end,
        -- })
    end,
    init_options = {
        collections = {
            {name = "shared", path = vim.fn.expand('/home/maxim/prog/Odin')}
        }
    }
})


lspconfig["zls"].setup({
    on_attach = function(client, buf)
        vim.api.nvim_create_autocmd("CursorHoldI", {
            buffer = buf,
            callback = function()
                vim.lsp.buf.signature_help()
            end,
        })
        -- vim.api.nvim_create_autocmd("CursorHold", {
        --     buffer = buf,
        --     callback = function()
        --         vim.lsp.buf.hover()
        --     end
        -- })
        -- this is uncomment if need show hover on cursor
    end
})
lspconfig["clangd"].setup({
    cmd = {"clangd"},
    init_options = {
        fallbackFlags = {"-std=c23"},
    },
    root_markers = {".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git"},

})

lspconfig["lua_ls"].setup({})

vim.o.updatetime = 300

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    --vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    --vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
