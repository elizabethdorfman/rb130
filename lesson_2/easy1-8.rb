def none?(array)
	array.each{|num|false if yield(num)}
	true
end