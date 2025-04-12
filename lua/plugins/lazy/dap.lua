return {
    { "nvim-neotest/nvim-nio" },
	-- DAP core
	{
		"mfussenegger/nvim-dap",
		config = function()
		  require("plugins.lazy.config.dap.config")  -- this loads your custom config
		end,
	},
    -- Fancy UI for DAP (optional but highly recommended)
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
    -- Install adapters automatically (optional but cool)
    { "jay-babu/mason-nvim-dap.nvim", dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" } },
}