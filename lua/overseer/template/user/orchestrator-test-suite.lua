-- lua/overseer/template/orchestrator-test-suite.lua
return {
  name = "Run Test Suite",
  params = {
    suite = {
      type = "string",
      name = "Test Suite",
    },
  },
  builder = function(params)
    return {
      strategy = {
        "orchestrator",
        tasks = {
          {
            name = "Unit Tests",
            cmd = { "bash", "-c", "npm test " .. params.suite },
          },
          {
            name = "Integration Tests",
            cmd = { "bash", "-c", "npm test " .. params.suite .. " --integration" },
          },
        },
      },
      components = { "default" },
    }
  end,
}
