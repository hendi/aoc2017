#!/usr/bin/env elixir

defmodule Day4a do
	def main([filename]) do
		{:ok, content} = File.read(filename)

		content
		|> String.split("\n")
		|> Enum.filter(&is_valid/1)
		|> Enum.count
		|> IO.puts
	end

	defp is_valid(""), do: false
	defp is_valid(passphrase) do
		words = String.split(passphrase, " ")

		MapSet.size(MapSet.new(words)) == length(words)
	end
end

Day4a.main(System.argv)
