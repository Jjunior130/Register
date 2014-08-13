class Register
	attr_accessor :line_length, :number_of_products_on_belt, :user, :transaction_speed, :register_id, :scanned_items, :void_items, :scanned_more_than_needed_items, :total, :total_with_tax, :subtotal, :delete_items, :transactions_completed, :time_of_sign_outs, :product_database, :selected_items

	def initialize params
		begin
			@register_id = params[:register_id]
			@amount_in_register = 0
			@line_memento = {}
			@line_length = 0
			@@registers = [].insert @register_id, self
		end
	end

	def Register.fastest_transaction_speed
		begin
			@@registers.each do |register|
				fastest = [].insert register.id, register.transaction_speed
			end
		end
	end

	def id
		begin
			@register_id
		end
	end

	def increase_line_length amount=1
		begin
			@line_length += amount
			@line_memento.unshift "Register #{@register_id} with #{@line_length} customers in line."
		end
	end

	def decrease_line_length amount=1
		begin
			@line_length -= amount
			@line_memento.unshift "Register #{@register_id} with #{@line_length} customers in line."
		end
	end

	def user
		begin
			@user.to_s
		end
	end

	def scan upc
		begin
			@scanned_items << upc
		end
	end
end