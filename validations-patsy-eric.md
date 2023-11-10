As a developer, I have been tasked with creating a Rails application to store account information for a company. I want to ensure that only valid data can be saved in the database.

All tasks should have accompanying model specs.

The application data should be managed by a PostgreSQL database in a Rails application.
`rails new account-validation -d postgresql -T `
`rails db:create`
`bundle add rspec-rails`
`rails generate rspec:install`

The model should be called Account with username, password, and email attributes.
`rails g model Account username:string password:string email:string`
`rails db:migrate`

Every account should require entries for username, password, and email.
run rspec -> `rspec spec/models/account_spec.rb -f d`

app/models -> `validates :username, :password, :email, presence: true`

Every username should be at least five (5) characters long.
` validates :username, length: {minimum: 5}`

Every username should be unique.
`validates :username, uniqueness: true`

Every password should be at least six (6) characters long.
` validates :password, length: {minimum: 6}`

Every password should be unique.
`validates :password, uniqueness: true`

The Account model has an associated model called Addresses where an account can have many addresses.
`rails g model Address street_number:integer street_name:string city:string state:string zip:integer account_id:integer`

`rails db:migrate`

The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
`rails g model Address street_number:integer street_name:string city:string state:string zip:integer account_id:integer`

`rails db:migrate`

Every address should require entries for street_number, street_name, city, state, and zip.
`validates :street_number, :street_name, :city, :state, :zip, presence: true`

# Stretch Goals

Every account password should have at least one number.
HINT: Read about custom validations in the Active Record validation docs.

```ruby
def validate(account)
    if account.password.match(/[0-9]/)
    account.errors.add :password, "Provide a number with the password."
    end
end

validates_with MyValidator
```

Every street_number, street_name, and zip on the address model should be unique within an account.
HINT: Read about :scope in the Active Record validation docs.

Every street_number and zip should be integers.
HINT: Read about numericality in the Active Record validation docs.

If the street_number or zip code are not numbers there should be a custom error message that says "Please input numbers only."
HINT: Read about message in the validation docs.
