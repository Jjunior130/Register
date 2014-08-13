class Cashier
	attr_reader :name

	def change_name new_name
		begin
			@name = new_name if new_name === String
		rescue Exception => e
			
		end
	end
end