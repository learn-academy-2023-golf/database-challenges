<!-- 💳 Challenge: Banking Application
As a developer, I have been tasked with creating a database to store information for a bank that issues credit cards. The account owner must fill out a bank application that includes their name and address. Then account owners can be issued one or more credit cards. Credit cards must belong to an account owner.


✔️ Acceptance Criteria
The banking application data should be managed by a PostgreSQL database in a Rails application.
    rails new associations -d postgresql -T
    rails db:create   

An account owner should have a name and an address.
    rails generate model Owner name:string, address:string

There should be at least three owners in the database.
    Owner.create name:"John", address:"132 West Street"
    Owner.create name:"Bob", address:"322 South Street"
    Owner.create name:"Kris", address:"123 Malibu St"

A credit card has a number and an expiration date.
    - Remember! Credit cards CANNOT exist without an account owner.
    - Think about the purpose of each data type and what characters are necessary in each column. (Example: 02/2023 vs 02-02-2023)

    john = Owner.find(1)
    john.update credit_card:"1234 1222 1111 9999"

Each account owner should have at least one credit card.
    john = Owner.find(1).update exp_date:"02/2030"
    bob = Owner.find(2).update exp_date:"03/2025"
    kris = Owner.find(3).update exp_date:"04/2032"

At least one account owner should have three credit cards.
john.credit_cards.create number:"3333 4444 3333 0000", exp_date:"04
/2034"

john.credit_cards

[#<CreditCard:0x000000011141d130
  id: 1,
  number: "1121 1111 2222 3333",
  exp_date: "02/2030",
  created_at: Wed, 08 Nov 2023 23:49:53.240058000 UTC +00:00,
  updated_at: Wed, 08 Nov 2023 23:49:53.240058000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x00000001118b5dc8
  id: 4,
  number: "3333 4444 3333 0000",
  exp_date: "04/2034",
  created_at: Wed, 08 Nov 2023 23:53:42.746500000 UTC +00:00,
  updated_at: Wed, 08 Nov 2023 23:53:42.746500000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x0000000111894c40
  id: 5,
  number: "3333 2222 3333 5555",
  exp_date: "06/2032",
  created_at: Wed, 08 Nov 2023 23:54:09.508042000 UTC +00:00,
  updated_at: Wed, 08 Nov 2023 23:54:09.508042000 UTC +00:00,
  owner_id: 1>] 

🏔 Stretch Goals

Add a credit limit to each card.
    rails generate model add_credit_limit
    rails db:migrate

    card_one = CreditCard.find(1)
    card_one.update creditlimit:"250"

Find the total credit extended to an owner who has multiple credit cards. -->

<!-- john.credit_cards -->