def each_with_object(array, object)
	array.each do |val|
		yield(val,object)
	end
	object
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
puts result == [1, 9, 25]