As a developer, I have been tasked with creating a Rails application to store account information for a company. I want to ensure that only valid data can be saved in the database.

All tasks should have accompanying model specs.

✔️ Acceptance Criteria
The application data should be managed by a PostgreSQL database in a Rails application.
The model should be called Account with username, password, and email attributes.
Every account should require entries for username, password, and email.
<!-- rails g model Account user_name:string password:string email:string -->

Every username should be at least five (5) characters long.
<!-- RSpec.describe Account, type: :model do
 it 'rquires entries for user_name, password, and email' do
 info = Account.create(
  user_name: 'Derek',
  password: 'abcdef',
  email: 'Dmaly25@gmail.com'
 )
 expect(info.errors[:user_name]).to_not be_empty
 end
end -->

Every username should be unique.
Every password should be at least six (6) characters long.
Every password should be unique.
The Account model has an associated model called Addresses where an account can have many addresses.
The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
Every address should require entries for street_number, street_name, city, state, and zip.
require 'rails_helper'
```ruby
<!-- RSpec.describe Account, type: :model do
 it 'rquires entries for user_name,' do
 info = Account.create(
  # user_name: 'Derek',
  password: 'abcdef',
  email: 'Dmaly25@gmail.com'
 )
 expect(info.errors[:user_name]).to_not be_empty
 end

it 'rquires entries for password,' do
  info = Account.create(
   user_name: 'Derek',
  #  password: 'abcdef',
   email: 'Dmaly25@gmail.com'
  )
  expect(info.errors[:password]).to_not be_empty
  end
 
 it 'rquires entries foremail' do
  info = Account.create(
   user_name: 'Derek',
   password: 'abcdef',
  #  email: 'Dmaly25@gmail.com'
  )
  expect(info.errors[:email]).to_not be_empty
  end
 end -->
 
<!-- rails g model Address street_number:integer street_name:string city:string state:string zip_code:integer 

require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'Requires entry for street_number street_name, city, state, zip_code' do 
  addy_info = Address.create(
    # street_number: 123,
    street_name: 'south street',
    city: 'Fort Worth',
    state: 'TX',
    zip_code: 12345
  )
  expect(addy_info.errors[:street_number]).to_not be_empty
  end
  it 'Requires entry for street_number street_name, city, state, zip_code' do 
    addy_info = Address.create(
      street_number: 123,
      # street_name: 'south street',
      city: 'Fort Worth',
      state: 'TX',
      zip_code: 12345
    )
    expect(addy_info.errors[:street_name]).to_not be_empty
  end
  it 'Requires entry for street_number street_name, city, state, zip_code' do 
    addy_info = Address.create(
      street_number: 123,
      street_name: 'south street',
      # city: 'Fort Worth',
      state: 'TX',
      zip_code: 12345
    )
    expect(addy_info.errors[:city]).to_not be_empty
  end
  it 'Requires entry for street_number street_name, city, state, zip_code' do 
    addy_info = Address.create(
      street_number: 123,
      street_name: 'south street',
      city: 'Fort Worth',
      # state: 'TX',
      zip_code: 12345
    )
    expect(addy_info.errors[:state]).to_not be_empty
  end
  it 'Requires entry for street_number street_name, city, state, zip_code' do 
    addy_info = Address.create(
      street_number: 123,
      street_name: 'south street',
      city: 'Fort Worth',
      state: 'TX',
      # zip_code: 12345
    )
    expect(addy_info.errors[:zip_code]).to_not be_empty
  end
end


-->```
🏔 Stretch Goals
Every account password should have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
Every street_number, street_name, and zip on the address model should be unique within an account.
HINT: Read about :scope in the Active Record validation docs.
Every street_number and zip should be integers.
HINT: Read about numericality in the Active Record validation docs.
If the street_number or zip code are not numbers there should be a custom error message that says "Please input numbers only."
HINT: Read about message in the validation docs.