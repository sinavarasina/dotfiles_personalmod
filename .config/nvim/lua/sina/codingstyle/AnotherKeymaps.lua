-- sina/codingstyle/AnotherKeymaps.lua
local S = {}

function S.link()
  local function map(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts or { silent = true })
  end

  -- Fold Keymaps
  map('n', '<leader>T', function()
    if vim.wo.foldlevel > 0 then
      vim.cmd('set foldlevel=0')
    else
      vim.cmd('set foldlevel=99')
    end
  end)
  map('n', '<leader>t', 'za')

  -- Keymap to Compile
  local compilefunc = require('sina.codingstyle.compilefunc')
  map('n', '<leader>cc', compilefunc.compile)
end

return S

