class Contact
  @@all_contacts = []

  def initialize(name)
    @name = name
    @address = []
    @email = []
    @phone = []
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

  def Contact.all
    @@all_contacts
  end

  def save
    @@all_contacts << self
  end
end


