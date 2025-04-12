--C/C++ DAP configuration
local dap = require("dap")

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. '/mason/packages/codelldb/extension/adapter/codelldb',
      args = {"--port", "${port}"},
    }
}
  
dap.configurations.cpp = {
    {
      name = "Launch File",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
    -- Raylib debugger Build and Launch
    {
        name = "Build and Launch Raylib File",
        type = "codelldb",
        request = "launch",
        program = function()
          -- 👇 Build your executable before running
          local filename = vim.fn.expand("%:t:r") -- current file name without extension (e.g., 'main')
          local cmd = "g++ -g " .. filename .. ".cpp -o " .. filename .. " -lraylib -lGL -lm -lpthread -ldl -lrt -lX11"
    
          -- Run the build command
          vim.fn.jobstart(cmd, {
            stdout_buffered = true,
            stderr_buffered = true,
            on_stdout = function(_, data)
              if data then
                for _, line in ipairs(data) do
                  print("[Build stdout]: " .. line)
                end
              end
            end,
            on_stderr = function(_, data)
              if data then
                for _, line in ipairs(data) do
                  print("[Build stderr]: " .. line)
                end
              end
            end,
            on_exit = function(_, code)
              if code == 0 then
                print("✅ Build succeeded!")
              else
                print("❌ Build failed with code " .. code)
              end
            end,
          })
    
          -- Return the path to the built executable
          return vim.fn.getcwd() .. "/" .. filename
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
}

-- C can use same config
dap.configurations.c = dap.configurations.cpp