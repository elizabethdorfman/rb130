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
			puts "---- #{@title} ----"
			@todos.each{|todo|puts todo}
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
		select|todo| todo == string}.first.done!
	end

	def mark_all_done
		@todos.each{|todo| todo.done!}
	end

	def mark_all_undone
		@todos.each{|todo| todo.undone!}
	end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                    # raises TypeError with message "Can only add Todo objects"

# ---- Interrogating the list -----

# size
puts list.size                       # returns 3

# first
puts list.first                      # returns todo1, which is the first item in the list

# last
puts list.last                       # returns todo3, which is the last item in the list

#to_a
puts list.to_a                      # returns an array of all items in the list

#done?
puts list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
#list.item_at                    # raises ArgumentError
puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# puts list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

list.to_s

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect