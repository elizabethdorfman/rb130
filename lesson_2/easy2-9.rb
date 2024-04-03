def each_cons(array, num)
	array.each_with_index do |val, index|
		brea if index + num - 1 >= array.size
		yield(*array[index..(index+num-1)])
	end
	nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
puts hash == { 1 => true, 3 => true, 6 => true, 10 => true }