#!/usr/bin/env elixir

defmodule Day4a do
	def main([filename]) do
		{:ok, content} = File.read(filename)

		content
		|> String.split("\n")
		|> Enum.filter(&(String.length(&1) > 0))
		|> Enum.map(&String.to_integer/1)

		# convert List to Map to speed up random access
		|> Enum.with_index(0)
		|> Enum.map(fn {k,v} -> {v,k} end) 
		|> Map.new
		
		|> jump_till_outside
		|> IO.puts
	end

	defp jump_till_outside(instructions), do: _jump_till_outside(instructions, 0, 0)
	
	defp _jump_till_outside(instructions, i, cnt) when i >= map_size(instructions) or i < 0, do: cnt
	defp _jump_till_outside(instructions, i, cnt) do
		jmp = instructions[i]

		diff = if jmp >= 3 do -1 else 1 end
		instructions = put_in instructions[i], jmp+diff
		
		_jump_till_outside(instructions, i+jmp, cnt+1)
	end
end

Day4a.main(System.argv)
