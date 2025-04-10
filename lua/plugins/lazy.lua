-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo,
		lazypath
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" },
			{ "\nPress any key to exit..." }
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	require("plugins/lazy/themes"),
	require("plugins/lazy/snacks"),
	require("plugins/lazy/lsp"),
	require("plugins/lazy/style"),
	require("plugins/lazy/qol"),
	require("plugins/lazy/dap"),
})

-- Inside your config
require("mason").setup()
require("mason-nvim-dap").setup({
  ensure_installed = { "codelldb" },
})

require("dapui").setup({
	-- layouts = {
	-- 	{
	-- 	  elements = {
	-- 		{ id = "scopes", size = 0.25 },
    --     	{ id = "breakpoints", size = 0.25 },
    --     	{ id = "stacks", size = 0.25 },
    --     	{ id = "watches", size = 0.25 },
	-- 	  },
	-- 	  size = 50,
	-- 	  position = "left",
	-- 	},
	--   },
})

require("lualine").setup()
require("bufferline").setup()
