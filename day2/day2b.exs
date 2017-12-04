#!/usr/bin/env elixir

defmodule Day2b do
	def main([filename]) do
		{:ok, content} = File.read(filename)
		
		content
		|> String.split("\n")
		|> Enum.map(&handle_line/1)
		|> Enum.sum
		|> IO.puts
	end

	defp handle_line(""), do: 0
	defp handle_line(line) do
		line
		|> String.split("\t")
		|> Enum.map(&String.to_integer/1)
		|> evenly_divisable
	end

	defp evenly_divisable(numbers), do: _evenly_divisable(numbers, numbers, numbers)
	
	defp _evenly_divisable([], [], _), do: 0
	defp _evenly_divisable([x | _xs], [y | _ys], _) when x != y and rem(x, y) == 0, do: div(x, y)
	defp _evenly_divisable(xs, [], all), do: _evenly_divisable(tl(xs), all, all)
	defp _evenly_divisable(xs, ys, all), do: _evenly_divisable(xs, tl(ys), all)
end

Day2b.main(System.argv)
