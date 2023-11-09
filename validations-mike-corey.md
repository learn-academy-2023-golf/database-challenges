### 👤 Challenge: Company Contacts

As a developer, I have been tasked with creating a Rails application to store account information for a company. I want to ensure that only valid data can be saved in the database.

All tasks should have accompanying model specs.

### ✔️ Acceptance Criteria

- The application data should be managed by a PostgreSQL database in a Rails application.

```Ruby 
rails new validations-mike-corey -d postgresql -T
rails db:create
bundle add rspec-rails
rails g rspec:install
```

- The model should be called Account with username, password, and email attributes.

```Ruby
rails g model Account username:string password:string email:string
```

- Every account should require entries for username, password, and email.

```Ruby
class Account < ApplicationRecord
    has_many :addresses 
    validates :username, :password, :email, presence: true
end

RSpec.describe Account, type: :model do
  it 'requires username, password and email.' do
    arnold = Account.create(
      # username:'HeyArnold',
      # password:'FootballHead',
      # email:'myloveHelga@aol.com'
    )
    expect(arnold.errors[:username]).to_not be_empty
    expect(arnold.errors[:password]).to_not be_empty
    expect(arnold.errors[:email]).to_not be_empty
  end
end
```

- Every username should be at least five (5) characters long.

```Ruby
  it 'requires minimum 5 character username' do
    arnold = Account.create(
      username:'Arno',
      # password:'FootballHead',
      # email:'myloveHelga@aol.com'
    )
    expect(arnold.errors[:username]).to_not be_empty
  end

     validates :username, length:{minimum:5}
```

- Every username should be unique.

```Ruby
it 'requires unique username' do
    Account.create(
       username:'HeyArnold',
      password:'FootballHead',
      email:'myloveHelga@aol.com'
    )
    arnold = Account.create(
      username:'HeyArnold',
      password:'FootballHead',
      email:'myloveHelga@aol.com'
    )
    expect(arnold.errors[:username]).to_not be_empty
  end

  validates :username, uniqueness:true
```


- Every password should be at least six (6) characters long.

```Ruby
 it 'requires 6 character password' do
    arnold = Account.create(
      # username:'Arno',
      password:'Foot',
      # email:'myloveHelga@aol.com'
    )
    expect(arnold.errors[:password]).to_not be_empty
  end

  validates :password, length:{minimum:6}
```

- Every password should be unique.

```Ruby
 it 'requires password to be unique' do
    Account.create(
       username:'HeyArnold',
      password:'FootballHead',
      email:'myloveHelga@aol.com'
    )
    arnold = Account.create(
      username:'HeyArnold',
      password:'FootballHead',
      email:'myloveHelga@aol.com'
    )
    expect(arnold.errors[:password]).to_not be_empty
  end

   validates :password, uniqueness:true
```


- The Account model has an associated model called Addresses where an account can have many addresses.

```Ruby
class Address < ApplicationRecord
    belongs_to :account
end

class Account < ApplicationRecord
    has_many :addresses 
end


```

- The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

```Ruby
rails g model Address street_number:interger street_name:string city:string state:string zip:interger account_id:interger
```

- Every address should require entries for street_number, street_name, city, state, and zip.

```Ruby

RSpec.describe Address, type: :model do
  it 'requires entries for street_number, street_name, city, state, and zip' do
  home = Address.create(
    # street_number:
    # street_name:
    # city:
    # state:
    # zip:
    )
    expect(home.errors[:street_number]).to_not be_empty
    expect(home.errors[:street_name]).to_not be_empty
    expect(home.errors[:city]).to_not be_empty
    expect(home.errors[:state]).to_not be_empty
    expect(home.errors[:zip]).to_not be_empty
  end
end

class Address < ApplicationRecord
    belongs_to :account
    validates :street_number, :street_name, :city, :state, :zip, presence:true
end


```


### 🏔 Stretch Goals

- Every account password should have at least one number.

- HINT: Read about [custom validations](https://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations) in the Active Record validation docs.

```Ruby
  it 'requires passwords to have a number' do
    arnold = Account.create(
      # username:'Arno',
      password:'FootballHead',
      # email:'myloveHelga@aol.com'
    )
    expect(arnold.errors[:password]).to_not be_empty
  end

      def password_requires_number
        if password !~ /\d/
            errors.add(:password, 'must contain a number')
        end
    end
```

- Every street_number, street_name, and zip on the address model should be unique within an account.

- HINT: Read about [:scope](https://guides.rubyonrails.org/active_record_validations.html#uniqueness) in the Active Record validation docs.

```Ruby
  it 'requires no duplicate street addresses per account' do
    arnold = Account.create(
      username:'HeyArnold',
      password:'FootballHead',
      email:'myloveHelga@aol.com'
    )
    Address.create(
      street_number: 633,
      street_name: 'Victoria',
      city: 'Abilene',
      state: 'TX',
      zip: 79603,
      account: arnold
    )
    home = Address.create(
      street_number: 633,
      street_name: 'Victoria',
      city: 'Abilene',
      state: 'TX',
      zip: 79603,
      account: arnold
    )
    expect(home.errors[:street_number]).to_not be_empty
    expect(home.errors[:street_name]).to_not be_empty
    expect(home.errors[:zip]).to_not be_empty
  end

      validates :street_number, :street_name, :zip, uniqueness: { scope: :account_id, message: 'accounts cannot have duplicate addresses'}
```

- Every street_number and zip should be integers.

- HINT: Read about [numericality](https://edgeguides.rubyonrails.org/active_record_validations.html#numericality) in the Active Record validation docs.

```Ruby
  it 'requires street_number and zip to be integers' do
    home = Address.create(
      street_number: 'test',
      street_name: 'Victoria',
      city: 'Abilene',
      state: 'TX',
      zip: 'test',
    )
    expect(home.errors[:street_number]).to_not be_empty
    expect(home.errors[:zip]).to_not be_empty
  end

    validates :street_number, :zip, numericality: { only_integer: true }
```

- If the street_number or zip code are not numbers there should be a custom error message that says "Please input numbers only."

- HINT: Read about [message](https://edgeguides.rubyonrails.org/active_record_validations.html#message) in the validation docs.

```Ruby
  it 'requires street_number and zip to be integers' do
    home = Address.create(
      street_number: 'test',
      street_name: 'Victoria',
      city: 'Abilene',
      state: 'TX',
      zip: 'test',
    )
    expect(home.errors[:street_number]).to include('Please input numbers only.')
    expect(home.errors[:zip]).to include('Please input numbers only.')

        validates :street_number, :zip, numericality: { only_integer: true, message: 'Please input numbers only.' }
```