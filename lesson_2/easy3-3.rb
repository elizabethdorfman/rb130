def map(array)
	a = []
	array.each{|val| a << yield(val)}
	a
end

 puts map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
