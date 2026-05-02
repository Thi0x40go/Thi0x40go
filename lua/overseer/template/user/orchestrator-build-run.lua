-- lua/overseer/template/orchestrator-build-run.lua
return {
  name = "Build Then Run",
  builder = function()
    return {
      strategy = {
        "orchestrator",
        tasks = {
          {
            name = "Build Project",
            cmd = { "make" },
          },
          {
            name = "Run Project",
            cmd = { "make", "run" },
          },
        },
      },
      components = {
        { "on_output_quickfix", open = true },
        "default",
      },
    }
  end,
}
