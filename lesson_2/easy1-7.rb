def all?(array)
	all = true
	array.each{|num| all = false if !yield(num)}
	all
end

puts all?([1, 3, 5, 6]) { |value| value.odd? } == false
