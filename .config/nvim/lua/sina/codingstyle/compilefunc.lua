local S = {}

function S.compile()
 local filetype = vim.bo.filetype
  if filetype == 'c' or filetype == 'cpp' then
    local compilers = { 'clang', 'g++' }
    local actions = { 'Compile and Save', 'Compile and Run' }

    -- Select compiler
    vim.ui.select(compilers, {
      prompt = 'Select Compiler:',
      format_item = function(item) return item end,
    }, function(compiler_choice)
      if not compiler_choice then return end

      -- Select action
      vim.ui.select(actions, {
        prompt = 'Select Action:',
        format_item = function(item) return item end,
      }, function(action_choice)
        if not action_choice then return end

        local command
        if action_choice == 'Compile and Save' then
          command = string.format('!%s %% -o %%:r', compiler_choice)
          vim.api.nvim_exec(command, true)
         elseif action_choice == 'Compile and Run' then
          command = string.format('TermExec cmd="%s %% -o %%:r && %%:r"', compiler_choice)
          vim.api.nvim_exec(command, true)
        end
      end)
    end)
  else
    print('Not a C or C++ file.')
  end
end
 
return S


