<!-- As a developer, I have been tasked with creating a database to store information for a bank that issues credit cards. The account owner must fill out a bank application that includes their name and address. Then account owners can be issued one or more credit cards. Credit cards must belong to an account owner.

✔️ Acceptance Criteria
The banking application data should be managed by a PostgreSQL database in a Rails application.
An account owner should have a name and an address. -->

rails g model Owner name:string address:string

<!-- There should be at least three owners in the database. -->

Owner.create(name:'Fozzie Bear', address: '3984 Spooner St.')

Owner.create(name:'Oscar Grouch', address: '854 Sesame St.')

Owner.create(name:'Santa Clause', address: '100 North Pole Dr.')

<!-- A credit card has a number and an expiration date. -->

rails g model Card number:integer exp_date:string owner_id:integer

 rails db:migrate

<!-- Remember! Credit cards CANNOT exist without an account owner. -->

Cards.all

<!-- Think about the purpose of each data type and what characters are necessary in each column. (Example: 02/2023 vs 02-02-2023) -->

<!-- Each account owner should have at least one credit card. -->

 first_owner = Owner.find(1)

first_owner.cards.create(number: 1234, exp_date: "23-98")

Owner.all

Card.create(number: 9012, exp_date: "04-98", owner_id: 3)

Card.create(number: 5061, exp_date: "02-12", owner_id: 1)

<!-- At least one account owner should have three credit cards. -->

 Owner.find(1).cards.find(3).update(number: 2484, exp_date: "13-12")

Owner.find(1).cards

<!-- 🏔 Stretch Goals -->

<!-- Add a credit limit to each card. -->

<!-- Find the total credit extended to an owner who has multiple credit cards. -->
