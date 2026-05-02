-- lua/overseer/template/user/frontend_dev.lua
return {
  name = "Frontend: Dev Server",
  builder = function()
    local cmd = { "npm", "run", "dev" }
    
    -- Detecta se usa yarn ou pnpm
    if vim.fn.filereadable("pnpm-lock.yaml") == 1 then
      cmd = { "pnpm", "dev" }
    elseif vim.fn.filereadable("yarn.lock") == 1 then
      cmd = { "yarn", "dev" }
    elseif vim.fn.filereadable("bun.lockb") == 1 then
      cmd = { "bun", "run", "dev" }
    end

    return {
      cmd = cmd,
      components = {
        { "on_output_quickfix", open_on_exit = "failure" },
        "default",
      },
    }
  end,
  condition = {
    callback = function()
      return vim.fn.filereadable("package.json") == 1
    end,
  },
}
