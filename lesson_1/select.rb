def select(array)
	counter = 0
	a = []
	while counter < array.size
		if yield(array[counter])
			a.push(array[counter])
		end
		counter += 1
	end
	a
end