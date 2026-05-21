-- lua/overseer/template/user/frontend_dev.lua
return {
  generator = function(opts, cb)
    local tasks = {}
    local package_json = vim.fn.filereadable("package.json") == 1
    
    if package_json then
      local cmd_prefix = "npm"
      if vim.fn.filereadable("pnpm-lock.yaml") == 1 then
        cmd_prefix = "pnpm"
      elseif vim.fn.filereadable("yarn.lock") == 1 then
        cmd_prefix = "yarn"
      elseif vim.fn.filereadable("bun.lockb") == 1 then
        cmd_prefix = "bun"
      end

      table.insert(tasks, {
        name = "Frontend: Dev Server (" .. cmd_prefix .. ")",
        builder = function()
          return {
            cmd = { cmd_prefix, (cmd_prefix == "npm" or cmd_prefix == "bun") and "run" or nil, "dev" },
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })

      table.insert(tasks, {
        name = "Frontend: Build",
        builder = function()
          return {
            cmd = { cmd_prefix, (cmd_prefix == "npm" or cmd_prefix == "bun") and "run" or nil, "build" },
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })
    end

    cb(tasks)
  end,
  condition = {
    callback = function()
      return vim.fn.filereadable("package.json") == 1
    end,
  },
}
