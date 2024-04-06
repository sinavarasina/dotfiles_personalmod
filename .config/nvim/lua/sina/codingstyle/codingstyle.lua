-- sina.codingstyle.codingstyle
local S = {}

function S.link()
local api = vim.api

-- FoldMethod
api.nvim_exec([[
  autocmd FileType c,cpp,rust setlocal foldmethod=expr
  autocmd FileType c,cpp,rust setlocal foldexpr=nvim_treesitter#foldexpr()
]], false)

end

return S
