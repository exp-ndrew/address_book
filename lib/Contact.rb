class Contact
  @@all_contacts = []

  def initialize(name)
    @name = name
    @address = []
    @email = []
    @phone = []
  end

  def add_information
    puts "\n\nEnter #{@name}'s Address:"
    contact_address = gets.chomp
    self.add_address(contact_address)

    puts "\n\nEnter #{@name}'s Phone Number:\n\n"
    contact_phone = gets.chomp
    self.add_phone(contact_phone)

    puts "\n\nEnter #{@name}'s Email:\n\n"
    contact_email = gets.chomp
    self.add_email(contact_email)

    self.save
  end

  def show
    puts @name
    puts "Address: #{@address}"
    puts "Phone: #{@phone}"
    puts "Email: #{@email}"
  end

  def Contact.all
    @@all_contacts
  end

  def name
    @name
  end

  def address
    @address
  end

  def add_address (address)
    @address << address
  end

  def email
    @email
  end

  def add_email (email)
    @email << email
  end

  def phone
    @phone
  end

  def add_phone (phone)
    @phone << phone
  end

  def save
    @@all_contacts << self
  end
end


