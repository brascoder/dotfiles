IEx.configure(
  colors: [
    eval_result: [:cyan, :bright]
  ],
  default_prompt: [:yellow, "%prefix", :yellow, "(", :yellow, "%counter", :yellow, ")>", :yellow] |> IO.ANSI.format |> IO.chardata_to_string
)
