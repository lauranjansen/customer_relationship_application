class Rolodex
	def initialize
		@contacts = []
		@id = 1001
	end

	def contacts
		@contacts
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def modify_contact(contact, attribute, new_value)
		case attribute
		when "f" then contact.first_name = new_value
		when "l" then contact.last_name = new_value
		when "e" then contact.email = new_value
		when "n" then contact.note = new_value
		end
	end

	def remove_contact(id_input)
		contact_delete = display_contact(id_input)
		@contacts.delete(contact_delete)
	end

	def display_contact(id_input)
		@contacts.find { |contact| contact.id == id_input }
	end

	def display_all
		@contacts.each { |contact| contact }
	end

	def display_attribute(attribute)
		case attribute[0].downcase
		when "f" then sorted_contacts = @contacts.sort_by{ |contact| contact.first_name }
		when "l" then sorted_contacts = @contacts.sort_by{ |contact| contact.last_name }
		when "e" then sorted_contacts = @contacts.sort_by{ |contact| contact.email }
		when "n" then sorted_contacts = @contacts.sort_by{ |contact| contact.note }
		else return " Invalid input. Please try again."
		end
		sorted_contacts.each { |contact| contact }
	end
end