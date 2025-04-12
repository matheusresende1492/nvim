local dap = require("dap")
local dapui = require("dapui")

-- Load DAP configurations
require("plugins.lazy.config.dap.cpp")
require("plugins.lazy.config.dap.go")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
