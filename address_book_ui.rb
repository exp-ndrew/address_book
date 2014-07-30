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

  c.add_information
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
  @current_contact.show
  puts "\n\nPress 'e' to edit this contact."
  puts "Press 'l' to return to the list.\n\n"
  main_choice = gets.chomp
  if main_choice == 'e'
    edit_contact
  elsif main_choice == 'l'
    list_contacts
  else
    main_menu
  end

end

def edit_contact
  puts "\n\n"
  puts "Press 'a' to edit addresses for #{@current_contact.name}"
  puts "Press 'p' to edit phone numbers for #{@current_contact.name}"
  puts "Press 'e' to edit emails for #{@current_contact.name}"
  puts "Press 'l' to return to the list"
  main_choice = gets.chomp
  if main_choice == 'a'
    edit_address
  elsif main_choice == 'p'
    edit_phone
  elsif main_choice == 'e'
    edit_email
  elsif main_choice == 'l'
    list_contacts
  else
    puts "That wasn't a valid input"
  end
end

def edit_address
  puts "\n\n"
  puts @current_contact.name
  puts @current_contact.address
  puts "\n\n"
  puts "Press 'a' to add another address."
  puts "Press 'e' to edit an existing address"

end

def edit_phone
  puts "\n\n"
  puts @current_contact.name
  puts @current_contact.phone
  puts "\n\n"
  puts "Press 'a' to add another phone number."
  puts "Press 'e' to edit an existing phone number."

end

def edit_email
  puts "\n\n"
  puts @current_contact.name
  puts @current_contact.email
  puts "\n\n"
  puts "Press 'a' to add another email."
  puts "Press 'e' to edit an existing email."

end

main_menu
