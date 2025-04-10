-- vim.cmd("colorscheme catppuccin-macchiato") -- set color theme
function Transparent(color)
    -- color = color or "tokyonight"
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end
Transparent()

vim.opt.termguicolors = true -- bufferline
