require 'minitest/autorun'

class NoExperienceError < StandardError; end
class Employee
	def hire
		raise NoExperienceError
	end
end

class List
	def process
		self
	end
end

class Testy < Minitest::Test
	def setup
	end
	def test_odd
		value = 3
		assert_equal(true, value.odd?, 'value is not odd')
	end
	def test_xyz
		value = 'xyz'
		assert_equal('xyz', value.downcase)
	end
	def test_nil
		value = nil
		assert_nil value, "Value is not nil."
	end
	def test_empty
		list = []
		assert_empty list
		assert_equal(true, list.empty?)
	end
	def test_xyz_list
		list = ['xyz']
		assert_includes(list, 'xyz')
	end
	def test_employee_exception
		employee = Employee.new
		assert_raises(NoExperienceError) do
			 employee.hire
		end
	end

	def test_numeric
		value = Numeric.new()
		assert_instance_of(Numeric, value)
	end

	def test_numeric_sub
		value = 6
		assert_kind_of Numeric, value
	end

	def test_list_process
		list = List.new()
		assert_equal(list, list.process)
	end
	def test_list_array
		list = ['xyz']
		refute_includes(list, 'xyz')
	end
end