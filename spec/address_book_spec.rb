require 'rspec'
require 'Contact'

describe Contact do
  describe 'initialize' do
    it 'initializes a contact with a name' do
      test_contact = Contact.new('John Smith')
      expect(test_contact).to be_an_instance_of Contact
    end
  end
  describe 'save' do
    it 'adds a contact to the array of saved contacts' do
      test_contact = Contact.new('John Smith')
      test_contact.save
      expect(Contact.all).to eq [test_contact]
    end
  end
  describe 'add information' do
    it 'adds an email address to a contact' do
      test_contact = Contact.new('John Smith')
      test_contact.add_email("email@email.com")
      test_contact.save
      expect(test_contact.email).to eq ["email@email.com"]
    end
  end
end
