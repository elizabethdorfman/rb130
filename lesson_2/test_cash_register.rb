require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'


class CashTest < Minitest::Test
	def setup
		@my_cash = CashRegister.new(50)
		@trans = Transaction.new(50)

	end
	def test_accept_money
		assert_equal(50, @trans.item_cost)
		@trans.amount_paid = 50
		@my_cash.accept_money(@trans)
		assert_equal(100, @my_cash.total_money)
	end
	def test_change
		@trans.amount_paid = 80
		assert_equal(30, @my_cash.change(@trans))
	end
	def test_give_receipt
		assert_output("You've paid $#{@trans.item_cost}.\n") {@my_cash.give_receipt(@trans)}
	end
	def test_prompt_for_payment
    input = StringIO.new('50\n')
		output = StringIO.new()
    @trans.prompt_for_payment(input: input, output: output)
    assert_equal 50, @trans.amount_paid
	end

end