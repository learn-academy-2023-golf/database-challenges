### 💳 Challenge: Banking Application

As a developer, I have been tasked with creating a database to store information for a bank that issues credit cards. The account owner must fill out a bank application that includes their name and address. Then account owners can be issued one or more credit cards. Credit cards must belong to an account owner.

### ✔️ Acceptance Criteria

- The banking application data should be managed by a PostgreSQL database in a Rails application.
```Ruby
rails db:create
rails generate model Owner name:string address:string
rails db:migrate
```
- An account owner should have a name and an address.
```Ruby
rails c
```
- There should be at least three owners in the database.
```Ruby
Owner.create(name:'John', address:'111 A Street')
Owner.create(name:'Jane', address:'222 B Street')
Owner.create(name:'Steve', address:'333 C Street')
```
- A credit card has a number and an expiration date.
  - Remember! Credit cards CANNOT exist without an account owner.
  - Think about the purpose of each data type and what characters are necessary in each column. (Example: 02/2023 vs 02-02-2023)
```Ruby
rails generate model Card number:integer expiration:date owner_id:integer
rails db:migrate
class Owner < ApplicationRecord
    has_many :cards
end
class Card < ApplicationRecord
    belongs_to :owner
end
```
- Each account owner should have at least one credit card.
```Ruby
john = Owner.find(1)
john.cards.create(number:1111, expiration:'2025-02-27')
jane = Owner.find(2)
jane.cards.create(number:2222, expiration:'2025-08-30')
steve = Owner.find(3)
steve.cards.create(number:3333, expiration:'2025-05-26')
```
- At least one account owner should have three credit cards.
```Ruby
john.cards.create(number:4444, expiration:'2026-01-17')
john.cards.create(number:5555, expiration:'2027-07-23')
```
### 🏔 Stretch Goals

- Add a credit limit to each card.
```Ruby
rails generate migration add_credit_limit_to_card
class AddCreditLimitToCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :limit, :integer
  end
end
rails db:migrate
rails c
setlimit = Card.all
setlimit.update(limit:1000)
```
- Find the total credit extended to an owner who has multiple credit cards.
```Ruby
john.cards.sum(:limit)
```