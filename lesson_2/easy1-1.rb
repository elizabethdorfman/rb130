#Takes sorted array of integers
#Returns array of missing integers in order
def missing(array)
	#takes first two integers
	#checks if integers are missing
	a = []
	array.each_cons(2) do |first, second|
		new = ((first + 1).. (second-1)).to_a
		new.each {|num| a << num}
	end
	a
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []