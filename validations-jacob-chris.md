<!-- The application data should be managed by a PostgreSQL database in a Rails application. -->
<!-- The model should be called Account with username, password, and email attributes. -->

rails g model Account username:string password:string email:string

rails db:migrate

<!-- Every account should require entries for username, password, and email. -->

RSpec.describe Account, type: :model do
  it 'is not valid without a username' do
    acct_info = Account.create(
      username: nil,
      password: 'Boxer123',
      email: 'balboapunches@gmail.com',
    )
    expect(acct_info.errors[:username]).to_not be_empty
  end

  it 'is not valid without a password' do
    acct_info = Account.create(
      username: 'rocky_b',
      password: nil,
      email: 'balboapunches@gmail.com',
    )
    expect(acct_info.errors[:password]).to_not be_empty
  end

  it 'is not valid without an email' do
    acct_info = Account.create(
      username: 'rocky_b',
      password: 'Boxer123',
      email: nil,
    )
    expect(acct_info.errors[:email]).to_not be_empty
  end
end

class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
end

<!-- Every username should be at least five (5) characters long. -->
<!-- Every username should be unique. -->
<!-- Every password should be at least six (6) characters long. -->
<!-- Every password should be unique. -->

class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates_length_of :username, within: 6..20, too_long: 'pick a shorter username', too_short: 'pick a longer username'
    validates :usermame, uniqueness:true
    true
    validates_length_of :password, within: 5..20, too_long: 'pick a shorter password', too_short: 'pick a longer password'
    validates :password, uniqueness:true
end

<!-- The Account model has an associated model called Addresses where an account can have many addresses. -->

<!-- The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers. -->

<!-- Every address should require entries for street_number, street_name, city, state, and zip. -->