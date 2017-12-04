#!/usr/bin/env elixir

defmodule Day3b do
	def main([input]) do
		build_grid(%{}, 0, :right, {0, 0}, String.to_integer(input))
		|> IO.puts
	end

	defp set(grid, {x, y}, val) do
		if grid[x] == nil do
			put_in grid[x], %{y => val}
		else
			put_in grid[x][y], val
		end
	end

	defp get(grid, {x, y}), do:	grid[x][y] || 0

	defp width(n) do
		trunc(Float.ceil(Float.floor(:math.sqrt(n)) / 2))
	end
	
	defp move(i, direction, {x, y}) do
		{new_x, new_y} =
			case direction do
				:right -> {x+1, y}
				:left -> {x-1, y}
				:up -> {x, y-1}
				:down -> {x, y+1}
			end

			if abs(new_x) > width(i+1) or abs(new_y) > width(i+1) do
				new_direction =
					case direction do
						:right -> :up
						:left -> :down
						:up -> :left
						:down -> :right
					end

					move(i, new_direction, {x, y})
				
			else
				{direction, {new_x, new_y}}
			end
	end

	defp sum_neighbours(grid, {x, y}) do
		Enum.sum([get(grid, {x+1, y+1}),
							get(grid, {x+1, y  }),
							get(grid, {x+1, y-1}),
							get(grid, {x  , y+1}),
							get(grid, {x  , y-1}),
							get(grid, {x-1, y+1}),
							get(grid, {x-1, y  }),
							get(grid, {x-1, y-1})
						 ])
	end

	defp build_grid(grid, i, direction, {x, y}, n) do
		val =
		case i do
			0 -> 1
			_ -> sum_neighbours(grid, {x, y})
		end

		if val > n do
			val
		else
			{new_direction, new_x_y} = move(i, direction, {x, y})
			grid = set(grid, {x, y}, val)
			build_grid(grid, i+1, new_direction, new_x_y, n)
		end		
	end
end

Day3b.main(System.argv)
