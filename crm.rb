require_relative "contact"
require_relative "rolodex"

class CRM

	def initialize(name)
		@name = name
	end

	def print_main_menu
		puts "[1] (A)dd a new contact"
		puts "[2] (M)odify an existing contact"
		puts "[3] (R)emove a contact"
		puts "[4] (D)isplay a contact"
		puts "[5] Display all the (c)ontacts"
		puts "[6] Display an a(t)tribute"
		puts "[7] (Q)uit"
		print "Enter a number or command: "
	end

	def main_menu
		print_main_menu
		user_selected = gets.chomp
		call_option(user_selected)
	end

	def call_option(option)
		add_contact if (option.to_i == 1 || option.to_s[0].upcase == "A")
		modify_contact if (option.to_i == 2 || option.to_s[0].upcase == "M")
		remove_contact if (option.to_i == 3 || option.to_s[0].upcase == "R")
		display_all if (option.to_i == 4 || option.to_s[0].upcase == "D")
		display_all if (option.to_i == 5 || option.to_s[0].upcase == "C")
		display_attribute if (option.to_i == 6 || option.to_s[0].upcase == "T")
		return if (option.to_i == 7 || option.to_s[0].upcase == "Q")
	end
end

# bitmaker = CRM.new("Bitmaker CRM")
# bitmaker.main_menu