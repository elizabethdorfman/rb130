def count(array)
	count = 0
	array.each{|num|count += 1 if yield(num)}
	count
end