items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*set, last|
  puts set.join(", ")
  puts last
end


gather(items) do |first, *second, last|
	puts first
	puts second.join(", ")
	puts last
end

gather(items) do |first, *last|
	puts first
	puts last.join(", ")
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end