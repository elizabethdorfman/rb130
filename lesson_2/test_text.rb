
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
	def setup
		@file = File.open("sample_text.txt")
		@text = @file.read
		@text_obj = Text.new(@text)
	end
	def test_swap
		actual = @text_obj.swap('a','e')
		expected = @text.gsub('a', 'e')
		assert_equal expected, actual
	end
	def test_word_count
		actual_count = @text_obj.word_count
		expected_count = 126
		assert_equal(expected_count, actual_count)

	end
	def teardown
		@file.close
	end
end