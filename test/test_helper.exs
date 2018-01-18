ExUnit.start()

defmodule VectorHelper do
  # I am certainy this is undult complicated, but it work for me.
  def from_hex(s),
    do:
      s |> String.split(~r/\s+/i, trim: true) |> Enum.map(fn n -> Integer.parse(n, 16) end)
      |> Enum.reduce(<<>>, fn {i, ""}, acc -> acc <> <<i>> end)
end
