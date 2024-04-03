def zip(array1, array2)
	a = []
	array1.each_with_index do |_, index|
		a << [array1[index], array2[index]]
	end
	a
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
