vim.api.nvim_create_user_command('Changetheme', function(opts)
    local color = opts.args or "catppuccin"
    vim.cmd.colorscheme(color)
    -- for _, group in ipairs({ "Normal", "NormalFloat" }) do
    --   vim.api.nvim_set_hl(0, group, { bg = "none" })
    -- end
    
  end, {
    nargs = 1,
    complete = "color",
  })
  
  