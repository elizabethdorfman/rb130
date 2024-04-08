

class Anagram
	def initialize(word)
		@word = word.downcase
	end

	def match(array)
		sorted_word = @word.chars.sort.join
		anagrams = array.select do |word_checking|
			word_checking.downcase.chars.sort.join == sorted_word &&
			!(word_checking.downcase == @word.downcase)
		end
	end
end
