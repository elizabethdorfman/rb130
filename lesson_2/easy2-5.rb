def drop_while(array)
	drop_index = -1
	array.each_with_index{|val, index| drop_index = index if !yield(val)}
	return [] if drop_index == -1
	p array[drop_index..array.size-1]
end

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
