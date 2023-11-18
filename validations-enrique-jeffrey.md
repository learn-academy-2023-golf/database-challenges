<!-- 👤 Challenge: Company Contacts
As a developer, I have been tasked with creating a Rails application to store account information for a company. I want to ensure that only valid data can be saved in the database.

All tasks should have accompanying model specs.

✔️ Acceptance Criteria
The application data should be managed by a PostgreSQL database in a Rails application.


The model should be called Account with username, password, and email attributes.

rails g model Account user_name:string password:string email:string

Every account should require entries for username, password, and email.

on app/models/account: 
    validates :user_name, :password, :email, presence: true

on /spec/models/accounts_spec:
    it 'is not valid without user_name, password, or email' do
    bruce = Account.create(
      user_name: nil, ##'Bruce Wayne'
      password: nil,
      email: nil
    )
    expect(bruce.errors[:user_name]).to_not be_empty
    expect(bruce.errors[:password]).to_not be_empty
    expect(bruce.errors[:email]).to_not be_empty

Every username should be at least five (5) characters long.

on app/models/account: 
    validates :user_name, length: { minimum: 5 }

on /spec/models/accounts_spec:
    it 'is not valid without atleast 5 characters' do
    bruce = Account.create(
      user_name:'noe',
      password: 'NotMyPassword',
      email: 'wayneenterprise@hotmail.com'
    )
expect(bruce.errors[:user_name]).to_not be_empty
    
Every username should be unique.

on app/models/account: 
    validates :user_name, uniqueness: true

on /spec/models/accounts_spec:
    it 'is not valid if user_name not unique' do
    Account.create(
      user_name:'Bruce Wayne',
      password: 'NotMyPassword',
      email: 'wayneenterprise@hotmail.com'  
    )
    bruce = Account.create(
      user_name:'Bruce Wayne',
      password: 'NotMyPassword',
      email: 'wayneenterprise@hotmail.com'
    )
    expect(bruce.errors[:user_name]).to_not be_empty
  end

Every password should be at least six (6) characters long.
on app/models/account:
    validates :password, length: { minimum: 6 }

on /spec/models/accounts_spec:
    it 'is not valid without atleast 5 characters' do
    bruce = Account.create(
      user_name:'Bruce Wayne',
      password: 'NotM',
      email: 'wayneenterprise@hotmail.com'
    )
    expect(bruce.errors[:password]).to_not be_empty
  end

Every password should be unique.
on /spec/models/accounts_spec:
    validates :user_name, :password, uniqueness: true
on /spec/models/accounts_spec:
    it 'is not valid if user_name not unique' do
    Account.create(
      user_name:'Bruce Wayne',
      password: 'NotMyPassword',
      email: 'wayneenterprise@hotmail.com'  
    )
    bruce = Account.create(
      user_name:'Bruce Wayne',
      password: 'NotMyPassword',
      email: 'wayneenterprise@hotmail.com'
    )
    expect(bruce.errors[:user_name]).to_not be_empty
    expect(bruce.errors[:password]).to_not be_empty

The Account model has an associated model called Addresses where an account can have many addresses.

on address.rb: belongs_to :account

on account.rb: has_many :addresses

The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

rails g model Address street_number: integer street_name:string city:string state:string zip:integer account_id:integer

rails db:migrate

Every address should require entries for street_number, street_name, city, state, and zip.

     belongs_to :account
    validates :street_number, :street_name, :city, :state, :zip, presence: true

     it 'is not valid without user_name, password, or email' do
    bruce = Address.create(
      street_number: nil,
      street_name: nil,
      city: nil,
      state: nil,
      zip: nil
    )
    expect(bruce.errors[:street_number]).to_not be_empty
    expect(bruce.errors[:street_name]).to_not be_empty
    expect(bruce.errors[:city]).to_not be_empty
    expect(bruce.errors[:state]).to_not be_empty
    expect(bruce.errors[:zip]).to_not be_empty
  end

🏔 Stretch Goals
Every account password should have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
Every street_number, street_name, and zip on the address model should be unique within an account.
HINT: Read about :scope in the Active Record validation docs.
Every street_number and zip should be integers.
HINT: Read about numericality in the Active Record validation docs.
If the street_number or zip code are not numbers there should be a custom error message that says "Please input numbers only."
HINT: Read about message in the validation docs. -->