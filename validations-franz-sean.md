<!-- 👤 Challenge: Company Contacts
As a developer, I have been tasked with creating a Rails application to store account information for a company. I want to ensure that only valid data can be saved in the database. -->
<!-- All tasks should have accompanying model specs. -->

<!-- ✔️ Acceptance Criteria -->

<!-- The application data should be managed by a PostgreSQL database in a Rails application. -->
rails new Validations -d postgresql -T
cd Validations
rails db:create

<!-- The model should be called Account with username, password, and email attributes. -->
rails g model Account username:string password:string email:string
rails db:migrate

<!-- Every account should require entries for username, password, and email. -->
bundle add rspec-rails
rails g rspec:install
rails generate rspec:model Account

in spec/models/account_spec.rb
    RSpec.describe Account, type: :model do
        it 'is not valid without an entry for username' do
            sean = Account.create(
            username: nil,
            password: 'password',
            email: 'sb@email.com'
        )
            expect(sean.errors[:username]).to_not be_empty
        end
    end

in models/account.rb
    validates :username, presence: true


<!-- Every username should be at least five (5) characters long. -->

in spec/models/account_spec.rb
    it 'is not valid unless username is at least 5 characters long' do
        sean = Account.create(
            username: 'sean',
            password: 'password',
            email: 'sb@email.com'
        )
        expect(sean.errors[:username]).to_not be_empty
    end

in models/account.rb
    validates :username, length: { minimum: 5 }

<!-- Every username should be unique. -->

in spec/models/account_spec.rb
  it 'is not valid unless the username is unique' do
    franz = Account.create(
      username: 'batman',
      password: 'password',
      email: 'fmarte@email.com'
    )
    sean = Account.create(
      username: 'batman',
      password: '123456',
      email: 'sb@email.com'
    )
     expect(sean.errors[:username]).to_not be_empty
  end

in models/account.rb
    validates :username, uniqueness: true


<!-- Every password should be at least six (6) characters long. -->

in spec/models/account_spec.rb
  it 'is not valid unless the password is at least 6 characters long' do
    franz = Account.create(
      username: 'franz',
      password: '12345',
      email: 'fmarte@email.com'
    )
     expect(franz.errors[:password]).to_not be_empty
  end

in models/account.rb
    validates :password, length: { minimum: 6 }

<!-- Every password should be unique. -->

in spec/models/account_spec.rb
  it 'is not valid unless the password is unique' do
    franz = Account.create(
      username: 'franz',
      password: '12345',
      email: 'fmarte@email.com'
    )
    sean = Account.create(
      username: 'swbriski',
      password: '12345',
      email: 'sb@email.com'
    )
     expect(sean.errors[:password]).to_not be_empty
  end

in models/account.rb
    validates :password, uniqueness: true

<!-- The Account model has an associated model called Addresses where an account can have many addresses. -->
<!-- The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers. -->

rails g model Address street_number:integer street_name: string city:string state:string zip:integer
rails db:migrate

in address.rb
    belongs_to :account

in account.rb
    has_many :addresses

rails g migration add_column_to_address account_id:integer
rails db:migrate


<!-- Every address should require entries for street_number, street_name, city, state, and zip. -->

in address_spec.rb
    RSpec.describe Address, type: :model do
        it 'is not valid without an entry for street number' do
            home = Address.create(
            street_number: nil,
            street_name: 'Falcon Dr',
            city: 'Las Vegas',
            state: 'NV',
            zip: 89134
            )
            expect(home.errors[:street_number]).to_not be_empty
        end
        it 'is not valid without an entry for street name' do
            home = Address.create(
            street_number: 42,
            street_name: nil,
            city: 'Las Vegas',
            state: 'NV',
            zip: 89134
            )
            expect(home.errors[:street_name]).to_not be_empty
        end
        it 'is not valid without an entry for city' do
            home = Address.create(
            street_number: 42,
            street_name: 'Falcon Dr',
            city: nil,
            state: 'NV',
            zip: 89134
            )
            expect(home.errors[:city]).to_not be_empty
        end
        it 'is not valid without an entry for state' do
            home = Address.create(
            street_number: 42,
            street_name: 'Falcon Dr',
            city: 'Las Vegas',
            state: nil,
            zip: 89134
            )
            expect(home.errors[:state]).to_not be_empty
        end
        it 'is not valid without an entry for zip' do
            home = Address.create(
            street_number: 42,
            street_name: 'Falcon Dr',
            city: 'Las Vegas',
            state: 'NV',
            zip: nil
            )
            expect(home.errors[:zip]).to_not be_empty
        end
    end

in address.rb
    validates :street_number, :street_name, :city, :state, :zip, presence: true

<!-- 🏔 Stretch Goals -->
<!-- Every account password should have at least one number.
HINT: Read about custom validations in the Active Record validation docs. -->
in account.rb
  it 'is not valid unless the password contains a number' do
    franz = Account.create(
      username: 'franz',
      password: 'password',
      email: 'fmarte@email.com'
    )
     expect(franz.errors[:password]).to_not be_empty
  end

in account.rb
    class PasswordValidator < ActiveModel::Validator

        def validate(record)
            unless record.password.match?(/\d/)
                record.errors.add :password
            end
        end
    end

    in class Account
        validates_with PasswordValidator

<!-- Every street_number, street_name, and zip on the address model should be unique within an account.
HINT: Read about :scope in the Active Record validation docs. -->



Every street_number and zip should be integers.
HINT: Read about numericality in the Active Record validation docs.
If the street_number or zip code are not numbers there should be a custom error message that says "Please input numbers only."
HINT: Read about message in the validation docs.