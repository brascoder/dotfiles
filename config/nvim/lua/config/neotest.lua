require("neotest").setup({
  adapters = {
    require("neotest-elixir"),
    require("neotest-jest")({
      jestCommand = "npx jest",
    }),
  },
})
