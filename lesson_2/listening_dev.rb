class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

	def listen
		recording = yield if block_given?
		record(recording) if recording
	end

	def play
		@recordings[-1]
	end
end

listener = Device.new
puts listener.listen { "Hello World!" }
puts listener.listen
puts listener.play # Outputs "Hello World!"