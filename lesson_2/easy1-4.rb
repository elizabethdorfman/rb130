def divisors(num)
	num = num
	divisor = 1
	divisors = []
	while divisor <= num
		if num % divisor == 0
			divisors << divisor
		end
		divisor += 1
	end
	divisors
end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute