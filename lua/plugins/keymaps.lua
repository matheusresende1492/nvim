
-- format code using LSP
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

-- nvim-comment
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")

-- dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>bps', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

-- dap evaluate
vim.keymap.set('n', '<Leader>bpe', function() require('dapui').eval() end, { desc = "DAP Watch" })
-- dap breakpoint clear
vim.keymap.set('n', '<Leader>bpc', function()
  require('dap').clear_breakpoints()
end, { desc = "DAP Clear Breakpoints" })


vim.keymap.set('n', '<Leader>tt', function() vim.cmd("TransparentToggle") end)

-- theme selection drop down
vim.keymap.set('n', '<Leader>ct', function()
  local commands = {
    { name = "Tokyo Night", cmd = function() vim.cmd("Changetheme tokyonight") end },
    { name = "Catppuccin", cmd = function() vim.cmd("Changetheme catppuccin") end },
    { name = "Kanagawa", cmd = function() vim.cmd("Changetheme kanagawa") end },
    { name = "Gruvbox", cmd = function() vim.cmd("Changetheme gruvbox") end },
    { name = "Rose Pine", cmd = function() vim.cmd("Changetheme rose-pine") end },
  }

  vim.ui.select(commands, {
    prompt = "Pick a Theme",
    format_item = function(item) return item.name end,
  }, function(choice)
    if choice then
      choice.cmd()
    end
  end)
end, { desc = "Change color theme (personal)" })


