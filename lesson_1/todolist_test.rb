require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)

		@todo4 = Todo.new("Bonus")
  end

	def test_to_a
		assert_equal(@todos, @list.to_a)
	end

	def test_size
		assert_equal(3, @list.size)
	end

	def test_first
		assert_equal(@todo1, @list.first)
	end

	def test_last
		assert_equal(@todo3, @list.last)
	end

	def test_shift
		shifted = @list.shift
		assert_equal(@todo1, shifted)
		assert_equal([@todo2, @todo3], @list.to_a)
	end

	def test_pop
		popped = @list.pop
		assert_equal(@todo3, popped)
		assert_equal([@todo1, @todo2], @list.to_a)
	end

	def test_done?
		assert_equal(false, @list.done?)
	end

	def test_TypeError
		assert_raises(TypeError) do
			@list.add(1)
		 end
		end

	def test_shovel
		@todos << @todo4
		@list << @todo4
		assert_equal(@todos, @list.to_a)
	end

	def test_alias
		@list.add(@todo4)
 	 	@todos << @todo4

  	assert_equal(@todos, @list.to_a)
	end

	def test_item_at
		assert_raises(ArgumentError) do
			@list.item_at()
		 end
		 assert_raises(IndexError) do
			@list.item_at(10)
		 end
		 assert_equal(@todo1, @list.item_at(0))
	end

	def test_mark_done
		assert_raises(ArgumentError) do
			@list.mark_done_at()
		 end
		 assert_raises(IndexError) do
			@list.mark_done_at(10)
		 end
		 @list.mark_done_at(1)
		 assert_equal(false, @todo1.done?)
		 assert_equal(true, @todo2.done?)
		 assert_equal(false, @todo3.done?)
	end

	def test_mark_undone
		assert_raises(ArgumentError) do
			@list.mark_undone_at()
		 end
		 assert_raises(IndexError) do
			@list.mark_undone_at(10)
		 end
		 @list.mark_all_done
		 @list.mark_undone_at(1)
		 assert_equal(true, @todo1.done?)
		 assert_equal(false, @todo2.done?)
		 assert_equal(true, @todo3.done?)
	end

	def test_done!
		@list.done!
		assert_equal(true, @todo1.done?)
		assert_equal(true, @todo2.done?)
		assert_equal(true, @todo3.done?)
		assert_equal(true, @list.done?)
	end

	def test_remove_at
			assert_raises(IndexError) { @list.remove_at(100) }
			@list.remove_at(1)
			assert_equal([@todo1, @todo3], @list.to_a)
	end

	def test_to_s
		output = <<~OUTPUT.chomp
		---- Today's Todos ----
		[ ] Buy milk
		[ ] Clean room
		[ ] Go to gym
		OUTPUT

		assert_equal(output, @list.to_s)
	end

	def test_to_s_2
		output = <<~OUTPUT.chomp
		---- Today's Todos ----
		[ ] Buy milk
		[X] Clean room
		[ ] Go to gym
		OUTPUT

		@list.mark_done_at(1)
		assert_equal(output, @list.to_s)
	end

	def test_to_s_3
		output = <<~OUTPUT.chomp
		---- Today's Todos ----
		[X] Buy milk
		[X] Clean room
		[X] Go to gym
		OUTPUT

		@list.mark_all_done
		assert_equal(output, @list.to_s)
	end

	def test_each
		result = []
  	@list.each { |todo| result << todo }
  	assert_equal([@todo1, @todo2, @todo3], result)
	end

	def test_each_2
  	assert_equal(@list, @list.each{|todo| nil })
	end

	def test_select
		@todo1.done!
		list = TodoList.new(@list.title)
		list.add(@todo1)

		assert_equal(list.title, @list.title)
		assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
	end

end