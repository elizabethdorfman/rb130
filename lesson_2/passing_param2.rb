def remaining(array)
	yield(array)
end
array = %w(raven finch hawk eagle)

remaining(array) do |_, _, *raptors|
	p raptors
end
