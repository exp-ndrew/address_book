require './lib/Contact.rb'

@current_contact = nil

def main_menu
  loop do
    puts "Type 'a' to add a new contact."
    puts "Type 'l' to list your contacts."

    puts "Type 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_contact
    elsif main_choice == 'l'
      list_contacts
    elsif main_choice == 'x'
      exit
    else
      puts "\n\nThat is not a valid input\n\n"
    end
  end
end

def add_contact
  puts "\n\nWhat is the new contact's name?\n\n"
  contact_name = gets.chomp
  c = Contact.new(contact_name)

  puts "\n\nContact #{contact_name} added!\n\n"

  puts "\n\nEnter #{contact_name}'s Address:"
  contact_address = gets.chomp
  c.add_address(contact_address)

  puts "\n\nEnter #{contact_name}'s Phone Number:\n\n"
  contact_phone = gets.chomp
  c.add_phone(contact_phone)

  puts "\n\nEnter #{contact_name}'s Email:\n\n"
  contact_email = gets.chomp
  c.add_email(contact_email)

  c.save
end

def list_contacts
  puts "\n\nHere are your contacts:"
  Contact.all.each_with_index do |contact, i|
    puts "#{i+1}. #{contact.name}"
  end
  puts "\n\nType a contact's number to select it."
  puts "Type 'a' to add another contact.\n\n"

  main_choice = gets.chomp
  if main_choice =~ /\d/
    @current_contact = Contact.all[(main_choice.to_i)-1]
    select_contact((main_choice.to_i)-1)

  elsif main_choice == 'a'
    add_contact
  else
    puts "that is not a valid input"
  end
end

def select_contact number
  puts "\n\n"
  puts @current_contact.name
  puts "Address: #{@current_contact.address}"
  puts "Phone: #{@current_contact.phone}"
  puts "Email: #{@current_contact.email}"
  puts "\n\nType 'e' to edit this contact.\n\n"

end


main_menu
