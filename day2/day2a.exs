#!/usr/bin/env elixir

defmodule Day2a do
	def main([filename]) do
		{:ok, content} = File.read(filename)
		
		content
		|> String.split("\n")
		|> Enum.map(&line_checksum/1)
		|> Enum.sum
		|> IO.puts
	end

	defp line_checksum(""), do: 0
	defp line_checksum(line) do
		line
		|> String.split("\t")
		|> Enum.map(&String.to_integer/1)
		|> Enum.min_max
		|> (fn({min, max}) -> max - min end).()
	end
end

Day2a.main(System.argv)
