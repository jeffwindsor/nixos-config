require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''}, --{ left = '', right = ''},
    section_separators = { left = '', right = ''}, --{ left = '', right = ''},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch','diff', 'diagnostics'},
    lualine_c = {{'filename', file_status = true, path = 1, shorting_target = 100, }},
    lualine_x = {},
    lualine_y = {'encoding'},
    lualine_z = {'location'}
  },
  tabline = {
    lualine_a = {{'buffers', mode = 0}},          --{{'tabs', mode = 0}},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},                               --{{'filename', file_status = true, path = 3, shorting_target = 100, }},
    lualine_z = {{'tabs', mode = 0}},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
