class TextAnalyzer
  def process
		if !block_given?
      raise StandardError.new("No block given.")
		end

		file = File.open('sample_text.txt', 'r')

		yield(file.read)

		file.close

  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }
