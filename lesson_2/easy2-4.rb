def count(*args)
	count = 0
	args.each{|arg| count += 1 if yield(arg)}
	count
end

puts count(1, 3, 6) { |value| value.odd? } == 2
