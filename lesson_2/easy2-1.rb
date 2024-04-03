def step(start, last, step)
	value = start
	while value <= last
		yield(value)
		value += step
	end
	(start..last)
end

step(1, 10, 3) { |value| puts "value = #{value}" }
