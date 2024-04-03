def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
    	if block_given? && yield(array[index - 1], array[index])
				next
			elsif !block_given? && array[index - 1] <= array[index]
				next
			end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

def bubble_sort2!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
    	if block_given? && yield(array[index - 1]) <= yield(array[index])
				next
			elsif !block_given? && array[index - 1] <= array[index]
				next
			end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
puts array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
puts array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
puts array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
puts array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort2!(array) { |value| value.downcase }
puts array == %w(alice bonnie Kim Pete rachel sue Tyler)