=begin
/Problem
Number to roman numeral conversion.
Using I- 1 V- 5, X- 10, L- 50, C-100, D- 500, M- 1000
Up to 3000
/Test cases
1 --> I
2 --> II
3 --> III
4 --> IV IV less than IIII
5 --> V
6 --> VI
9 --> IX less than VIIII
27 --> XXVII by digit
48 --> XL (less than XXXX)VIII
Class named RomanNumeral
to_roman function to convert to roman return roman nuemral string
Constructor: takes integer value


/Data structure
Store each digit into hash with corresponding tens etc.
Store roman numeral in string

/Algorithm
Under 10 function that finds for under 10
Double digit function that finds for double digit
Hundreds function that finds for hundreds
Thousands function that finds for thousands
/Store digits into hash with corresponding ones two three or four
/ invoke corresponding function with each number and append answer into answer string
/Return answer string
=end

class RomanNumeral
	def initialize(int)
		@number = int.to_s
	end

	def to_roman
		roman = ""
		digits = 10**(@number.length - 1)
		0.upto(@number.length - 1) do |i|
			if digits == 1000
				roman << to_thousand(@number[i].to_i)
			elsif digits == 100
				roman << to_hundred(@number[i].to_i)
			elsif digits == 10
				roman << to_ten(@number[i].to_i)
			else
				roman << to_one(@number[i].to_i)
			end
			digits /= 10
		end
		roman
	end

	private
	def to_thousand(int)
		if int == 0
			return ""
		elsif int == 1
			return "M"
		elsif int == 2
			return "MM"
		elsif int == 3
			return "MMM"
		end
	end
	def to_hundred(int)
		if int == 0
			return ""
		elsif int == 1
			return "C"
		elsif int == 2
			return "CC"
		elsif int == 3
			return "CCC"
		elsif int == 4
			return "CD"
		elsif int == 5
			return "D"
		elsif int == 6
			return "DC"
		elsif int == 7
			return "DCC"
		elsif int == 8
			return "DCCC"
		elsif int == 9
			return "CM"
		end
	end
	def to_ten(int)
		if int == 0
			return ""
		elsif int == 1
			return "X"
		elsif int == 2
			return "XX"
		elsif int == 3
			return "XX"
		elsif int == 4
			return "XL"
		elsif int == 5
			return "L"
		elsif int == 6
			return "LX"
		elsif int == 7
			return "LXX"
		elsif int == 8
			return "LXXX"
		elsif int == 9
			return "XC"
		end
	end
	def to_one(int)
		if int == 0
			return ""
		elsif int == 1
			return "I"
		elsif int == 2
			return "II"
		elsif int == 3
			return "III"
		elsif int == 4
			return "IV"
		elsif int == 5
			return "V"
		elsif int == 6
			return "VI"
		elsif int == 7
			return "VII"
		elsif int == 8
			return "VIII"
		elsif int == 9
			return "IX"
		end
	end

end
