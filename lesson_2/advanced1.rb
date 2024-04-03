#Iterates through infinite list of factorails
#Test by printing first seven factorial values starting with 0.
enum = Enumerator.new do |y|
	n = 0
	a = 1
  loop do
		y << a
		n += 1
		if n == 1
			a = 1
		else
			a *= n
		end
  end
end

puts enum.next # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
puts enum.next
puts enum.next
puts enum.next
puts enum.next
puts enum.next
puts enum.rewind
puts enum.next # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
puts enum.next
puts enum.next
puts enum.next
puts enum.next
puts enum.next