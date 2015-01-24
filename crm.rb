require_relative "contact"
require_relative "rolodex"

class CRM

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
		testy = Contact.new("Testy", "McTester", "testy@test.com", "Sweet!")
		@rolodex.add_contact(testy)
		nesty = Contact.new("Nesty", "Nesterson", "nesty@nest.com", "Neat!")
		@rolodex.add_contact(nesty)
		nesty = Contact.new("Besty", "O'Bester", "besty@best.com", "Trippin'!")
		@rolodex.add_contact(nesty)
	end

	def print_main_menu
		puts "\e[H\e[2J"
		puts " Welcome to the #{@name} Customer Relations Management application!\n "

		puts " [1] Add a new contact"
		puts " [2] Modify an existing contact"
		puts " [3] Remove a contact"
		puts " [4] Display a contact"
		puts " [5] Display all the contacts"
		puts " [6] Display an attribute"
		puts " [7] Quit"
		print "\n Select a menu option: "
	end

	def main_menu
		while true
			print_main_menu
			user_selected = gets.chomp
			if (user_selected.to_i == 7 || user_selected == "")
				puts "\n Thanks for using #{@name} CRM!"
				return
			end
			puts "\e[H\e[2J"
			call_option(user_selected.to_i)
		end
	end

	def call_option(option)
		# add_contact if (option.to_i == 1 || option.to_s[0].upcase == "A")
		# modify_contact if (option.to_i == 2 || option.to_s[0].upcase == "M")
		# remove_contact if (option.to_i == 3 || option.to_s[0].upcase == "R")
		# display_contact if (option.to_i == 4 || option.to_s[0].upcase == "D")
		# display_all if (option.to_i == 5 || option.to_s[0].upcase == "C")
		# display_attribute if (option.to_i == 6 || option.to_s[0].upcase == "T")
		# return if (option.to_i == 7 || option.to_s[0].upcase == "Q")
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then remove_contact
		when 4 then display_contact
		when 5 then display_all
		when 6 then display_attribute
		else
			puts "Invalid option, please enter a number."
			gets
		end
	end

	def add_contact
		puts "Provide Contact Details"

		print "First Name: "
		first_name = gets.chomp

		print "Last Name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Note: "
		note = gets.chomp

		puts "Is the above information correct?"
		print "(Yes/No): "
		input = gets.chomp[0].upcase

		if input == "N"
			return
		else
			new_contact = Contact.new(first_name, last_name, email, note)
			@rolodex.add_contact(new_contact)
		end
	end

	def modify_contact
		print "Please enter a user ID: "
		id_input = gets.chomp.to_i
		puts @rolodex.display_contact(id_input)

		puts "Are you sure you want to modify this contact?"
		print "(Yes/No): "
		input = gets.chomp[0].upcase

		if input != "Y"
			return
		else
			contact = @rolodex.display_contact(id_input)
			puts "What do you want to modify?"
			print "(f)irst name, (l)ast name, (e)mail or (n)ote: "
			modify = gets.chomp[0].downcase
			current_value =
			case modify
			when "f" then contact.first_name
			when "l" then contact.last_name
			when "e" then contact.email
			when "n" then contact.note
			else puts "Invalid entry, please try again."
			end
			puts "The current value is: #{current_value}"
			print "Please enter the desired new value: "
			new_value = gets.chomp

			@rolodex.modify_contact(contact, modify, new_value)

		end

	end

	def remove_contact
		print "Please enter a user ID: "
		id_input = gets.chomp.to_i
		puts @rolodex.display_contact(id_input)

		puts "Are you sure you want to remove this contact?"
		print "(Yes/No): "
		input = gets.chomp.upcase

		if input != "YES"
			return
		else
			@rolodex.remove_contact(id_input)
		end
	end

	def display_contact
		print "Please enter a user ID: "
		id_input = gets.chomp.to_i
		puts @rolodex.display_contact(id_input)
	end

	def display_all
		puts @rolodex.display_all
		gets
	end

	def display_attribute
		puts "Select an attribute to display by (e.g. first name, last name, email or note)"
		attr_input = gets.chomp.to_s
		puts @rolodex.display_attribute(attr_input)
	end
end

bitmaker = CRM.new("Bitmaker")
bitmaker.main_menu