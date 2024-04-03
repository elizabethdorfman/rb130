# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
	DONE_MARKER = 'X'
	UNDONE_MARKER = ' '

	attr_accessor :title, :description, :done

	def initialize(title, description='')
		@title = title
		@description = description
		@done = false
	end

	def done!
		self.done = true
	end

	def done?
		done
	end

	def undone!
		self.done = false
	end

	def to_s
		"[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
	end

	def ==(otherTodo)
		title == otherTodo.title &&
			description == otherTodo.description &&
			done == otherTodo.done
	end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
	attr_accessor :title

	def initialize(title)
		@title = title
		@todos = []
	end

	def add(todo_item)
		 if todo_item.class == Todo
			@todos.push(todo_item)
		 else
			raise TypeError, "Can only add Todo objects"
		 end
	end

	def << (todo_item)
		if todo_item.class == Todo
			@todos.push(todo_item)
		 else
			raise TypeError, "Can only add Todo objects"
		 end
	end

	def size
			@todos.size
	end

	def first
			@todos[0]
	end

	def last
			@todos[-1]
	end

	def to_a
			@todos
	end

	def done?
			@todos.all?{|todo| todo.done?}
	end

	def item_at(num)
			raise IndexError if num > @todos.size
			@todos[num]
	end

	def mark_done_at(num)
			raise IndexError if num > @todos.size
			@todos[num].done!
	end

	def mark_undone_at(num)
			raise IndexError if num > @todos.size
			@todos[num].undone!
	end

	def done!
			@todos.each{|todo| todo.done!}
	end

	def shift
			@todos.shift
	end

	def pop
			@todos.pop
	end

	def remove_at(num)
			raise IndexError if num > @todos.size
			@todos.delete_at(num)
	end

	def to_s
			text = "---- #{@title} ----"
			@todos.each do |todo|
				text << "\n"
				text << todo.to_s
			end
			text
	end

	def each
		@todos.each{|todo| yield(todo)}
		self
	end

	def select
		selected = TodoList.new(@title)
		@todos_selected = @todos.select{|todo| yield(todo)}
		@todos_selected.each{|todo| selected.add(todo)}
		selected
	end

	def find_by_title(string)
		select{|todo| todo == string}.first
	end

	def all_done
		select{|todo| todo.done?}
	end

	def all_not_done
		select{|todo| !todo.done?}
	end

	def mark_done(string)
		select{|todo| todo == string}.first.done!
	end

	def mark_all_done
		@todos.each{|todo| todo.done!}
	end

	def mark_all_undone
		@todos.each{|todo| todo.undone!}
	end
end
