def one?(array)
	truthy = 0
	array.each do |num|
		truthy += 1 if yield(num)
		return false if truthy == 2
	end
	return true if truthy == 1
	false
end