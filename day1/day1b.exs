#!/usr/bin/env elixir

defmodule Day1b do
	def main([input]), do: solve(input) |> IO.puts
	
	def solve(x) do
		digits = String.graphemes(x)
		shifted = shift(digits, div(length(digits), 2))

		List.zip([digits, shifted]) # build list of pairs {x, y}, where y is the digit halfway around from x
		|> (_solve 0)
	end

	defp _solve([], accu), do: accu
	defp _solve([{x,x} | tail], accu), do: _solve(tail, accu + String.to_integer(x))
	defp _solve([_ | tail], accu), do: _solve(tail, accu)

	defp shift(digits, n), do: Enum.slice(digits ++ digits, n, length(digits))
end

Day1b.main(System.argv)
