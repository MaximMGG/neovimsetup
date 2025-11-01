require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "zig", "odin", "cpp", "nim" },
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
