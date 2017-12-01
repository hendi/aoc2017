#!/usr/bin/env elixir

defmodule Day1a do
	def main([input]), do: solve(input) |> IO.puts
	
	def solve(x) do
		digits = String.graphemes(x)
		# append last digit to list, so _solve is straight forward
		digits ++ [hd digits]
		|> (_solve 0)
	end

	defp _solve([], accu), do: accu
	defp _solve([x,x | tail], accu), do: _solve([x | tail], accu + String.to_integer(x))
	defp _solve([_ | tail], accu), do: _solve(tail, accu)
end

Day1a.main(System.argv)
