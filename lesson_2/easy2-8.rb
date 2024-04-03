def max_by(array)
	max = [nil,nil]
	array.each{|val| max = [val,yield(val)] if !max[1] || yield(val)> max[1]}
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([]) { |value| value + 5 } == nil
