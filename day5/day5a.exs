#!/usr/bin/env elixir

defmodule Day4a do
	def main([filename]) do
		{:ok, content} = File.read(filename)

		content
		|> String.split("\n")
		|> Enum.filter(&(String.length(&1) > 0))
		|> Enum.map(&String.to_integer/1)
		|> jump_till_outside
		|> IO.puts
	end

	defp jump_till_outside(instructions), do: _jump_till_outside(instructions, 0, 0)
	
	defp _jump_till_outside(instructions, i, cnt) when i >= length(instructions) or i < 0, do: cnt
	defp _jump_till_outside(instructions, i, cnt) do
		jmp = Enum.at(instructions, i)
		instructions = List.update_at(instructions, i, &(&1 + 1))
		_jump_till_outside(instructions, i+jmp, cnt+1)
	end
end

Day4a.main(System.argv)
