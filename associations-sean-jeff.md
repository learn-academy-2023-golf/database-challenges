<!-- As a developer, I have been tasked with creating a database to store information for a bank that issues credit cards. The account owner must fill out a bank application that includes their name and address. Then account owners can be issued one or more credit cards. Credit cards must belong to an account owner. -->

<!-- The banking application data should be managed by a PostgreSQL database in a Rails application. -->

- rails new associations -d postgresql -T
    - rails db:create

<!-- An account owner should have a name and an address. -->

    - rails g model account_owner name:string address:string
        - rails db:migrate

<!-- There should be at least three owners in the database. -->

    AccountOwner.create name: "Jeffrey", address: "555 Gotham Dr"
    AccountOwner.create name: "Sean", address: "222 Falcon Ct"
    AccountOwner.create name: "Carey", address: "246 Wonderland Ave"

<!-- A credit card has a number and an expiration date.
    - Remember! Credit cards CANNOT exist without an account owner.
    - Think about the purpose of each data type and what characters are necessary in each column. (Example: 02/2023 vs 02-02-2023) -->

    rails g model credit_card card_number:string expiration_date:string account_owner_id:integer
        rails db:migrate

    app/models/acount_owner.rb
    has_many :credit_cards

    app/models/credit_card.rb
    belongs_to :account_owner

<!-- Each account owner should have at least one credit card. -->

    - jeff.credit_cards.create card_number: "235689" expiration_date:"01/2025"
    - sean.credit_cards.create card_number: "109283", expiration_date:"03/2026"
    - carey.credit_cards.create card_number: "098123", expiration_date:"09/2024"

<!-- At least one account owner should have three credit cards. -->
    
    - carey.credit_cards.create card_number: "234567", expiration_date:"04/2029"
    - carey.credit_cards.create card_number: "987654", expiration_date:"03/2025"

<!-- 🏔 Stretch Goals -->

<!-- Add a credit limit to each card. -->
    - rails g migration add_column_credit_limit_to_credit_card

    - inside migration file that was just created
    - add_column :credit_cards, :credit_limit, :integer

    - rails db:migrate

    - inside console
        - CreditCard.find(1).update(credit_limit:11000)
        - CreditCard.find(2).update(credit_limit:8000)
        - CreditCard.find(3).update(credit_limit:7500)
        - CreditCard.find(4).update(credit_limit:750)
        - CreditCard.find(5).update(credit_limit:5000)

<!-- Find the total credit extended to an owner who has multiple credit cards. -->

    - carey.credit_cards.all.sum(:credit_limit)
