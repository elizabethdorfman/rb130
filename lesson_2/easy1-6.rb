def any?(array)
	counter = 0
	any = false
	while !any && counter < array.size
		num = array[counter]
		any = yield(num)
		counter += 1
	end
	any
end

puts any?([1, 3, 5, 6]) { |value| value.even? } == true
puts any?([1, 3, 5, 7]) { |value| value.even? } == false
