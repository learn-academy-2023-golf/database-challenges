<!-- 👤 Challenge: Company Contacts
As a developer, I have been tasked with creating a Rails application to store account information for a company. I want to ensure that only valid data can be saved in the database.

All tasks should have accompanying model specs.
✔️ Acceptance Criteria
The application data should be managed by a PostgreSQL database in a Rails application.
    rails new validations-greg-alex -d postgresql -T
    completed 👍

The model should be called Account with username, password, and email attributes.
     rails g model Account username:string password:string email_attributes:string
     completed 👍

Every account should require entries for username, password, and email.
    RSpec.describe Account, type: :model do
    it 'is not valid without a name' do 
        scully  = Account.create(
        password: '1111112',
        email_attributes: 'thatsamiam@gmail.com'
        )
        expect(scully.errors[:username]).to_not be_empty
    end

    it 'is not valid without a password' do 
        scully  = Account.create(
        username: 'samwayne',
        email_attributes: 'thatsamiam@gmail.com'
        )
        expect(scully.errors[:password]).to_not be_empty
    end

    it 'is not valid without a email' do 
        scully  = Account.create(
        username: 'samwayne',
        password: '1111112'
        )
        expect(scully.errors[:email_attributes]).to_not be_empty
    end
    completed👍

Every username should be at least five (5) characters long.
    it 'is not valid if username is less than 5 characters' do 
    scully  = Account.create(
      username: 'sami',
      password: '1111112',
      email_attributes: 'thatsamiam@gmail.com'
    )
    expect(scully.errors[:username]).to_not be_empty
  end
  completed 👍

Every username should be unique.
    it 'does not allow duplicate username' do 
    scullette = Account.create(
      username: 'sammee',
      password: 'theeeee',
      email_attributes: 'thatsamiam@gmail.com'
    )
      scully  = Account.create(
        username: 'sammee',
        password: 'theeeee',
        email_attributes: 'thatsamiam@gmail.com'
      )
      p scully, scullette
      expect(scully.errors[:username]).to_not be_empty
  end
    completed👍

Every password should be at least six (6) characters long.
    it 'is not valid if password is less than 6 characters' do 
    scully  = Account.create(
      username: 'sami',
      password: '111',
      email_attributes: 'thatsamiam@gmail.com'
    )
    expect(scully.errors[:password]).to_not be_empty
  end
  completed 👍

Every password should be unique.
    it 'does not allow duplicate password' do 
    scullette = Account.create(
      username: 'sammee',
      password: 'theeeee',
      email_attributes: 'thatsamiam@gmail.com'
    )
      scully  = Account.create(
        username: 'sammee',
        password: 'theeeee',
        email_attributes: 'thatsamiam@gmail.com'
      )
      p scully, scullette
      expect(scully.errors[:password]).to_not be_empty
  end
end

The Account model has an associated model called Addresses where an account can have many addresses.


The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.


Every address should require entries for street_number, street_name, city, state, and zip.


🏔 Stretch Goals
Every account password should have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
Every street_number, street_name, and zip on the address model should be unique within an account.
HINT: Read about :scope in the Active Record validation docs.
Every street_number and zip should be integers.
HINT: Read about numericality in the Active Record validation docs.
If the street_number or zip code are not numbers there should be a custom error message that says "Please input numbers only."
HINT: Read about message in the validation docs. -->