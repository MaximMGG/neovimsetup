require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "zig", "odin", "cpp", "nim", "c3", "v" },
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.c3 = {
  install_info = {
    url = "https://github.com/c3lang/tree-sitter-c3", -- local path or git repo
    files = {"src/parser.c", "src/scanner.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
  },
  filetype = "c3", -- if filetype does not match the parser name
}

vim.filetype.add({
  extension = {
    c3 = "c3",
  }
})
