<!-- 💳 Challenge: Banking Application
As a developer, I have been tasked with creating a database to store information for a bank that issues credit cards. The account owner must fill out a bank application that includes their name and address. Then account owners can be issued one or more credit cards. Credit cards must belong to an account owner.

✔️ Acceptance Criteria
The banking application data should be managed by a PostgreSQL database in a Rails application.
    completed 👍

An account owner should have a name and an address.
rails g Bank_info name:sting adress:string

There should be at least three owners in the database.
BankInfo.create(name: "Warren Buffet", adress: "123 Billionaire Avenue")
BankInfo.create(name: "Ryan Cohen", adress: "123 Gamestop Avenue")
BankInfo.create(name: "Kimberly Hunter", adress: "1316 Wisconsin Avenue")

A credit card has a number and an expiration date.
rails g model Credit_card number:integer expiration_date:integer

Remember! Credit cards CANNOT exist without an account owner.


Think about the purpose of each data type and what characters are necessary in each column. (Example: 02/2023 vs 02-02-2023)


Each account owner should have at least one credit card.


At least one account owner should have three credit cards.


🏔 Stretch Goals
Add a credit limit to each card.


Find the total credit extended to an owner who has multiple credit cards. -->




Date.new(2025, 01, 01), account_owner:1