class Triangle
	def initialize(side1, side2, side3)
		@side1 = side1
		@side2 = side2
		@side3 = side3
		raise ArgumentError if !valid?
	end
	def kind
		return "equilateral" if equilateral?
		return "isosceles" if isosceles?
		return "scalene" if scalene?
	end

	private
	def valid?
		more_than_zero && sum_lengths
	end
	def more_than_zero
		@side1 > 0 && @side2 > 0 && @side3 > 0
	end
	def sum_lengths
		((@side1 + @side2) > @side3)
		&&	((@side1 + @side3) > @side2)
		&&	((@side2 + @side3) > @side1)
	end
	def equilateral?
		@side1 == @side2 && @side2 == @side3 && @side1 == @side3
	end
	def isosceles?
		!equilateral? &&(@side1 == @side2 || @side2 == @side3 || @side1 == @side3)
	end
	def scalene?
		!equilateral? && !isosceles?
	end
end