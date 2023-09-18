require('mini.ai').setup()
require('mini.align').setup()
-- require('mini.base16').setup()	      -- supply palette instead of color schemes?
-- require('mini.basics').setup()     	-- leran from these settings or just use?
require('mini.comment').setup()
--require('mini.completion').setup()
require('mini.cursorword').setup()      -- highlight word under cursor matches
--require('mini.indentscope').setup()
require('mini.jump2d').setup()          -- leap like jumps / finds
require('mini.move').setup()
require('mini.surround').setup()        -- surrond object with ({', etc

require('mini.statusline').setup({config = {
  use_icons = true,
  set_vim_settings = true,
}})

require('mini.tabline').setup({config = {
  show_icons = true,
  set_vim_settings = true,
  tabpage_section = 'left'
}})

require('mini.trailspace').setup()      -- highlights trailing whitespace
