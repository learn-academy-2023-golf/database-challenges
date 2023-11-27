The banking application data should be managed by a PostgreSQL database in a Rails application.
An account owner should have a name and an address.
<!-- rails g model Owner name:string address:string 
rails db:migrate -->
There should be at least three owners in the database.
<!-- Owner.create(name:'Derek Maly', address: ' 123 South st') 
Owner.create(name:'Franz Marte', address: ' 1234 South st')
Owner.create(name:'John Doe', address: ' 12345 South st') -->
A credit card has a number and an expiration date.
<!-- rails g model credit_card number:integer expiration_date:date owner:references -->
Remember! Credit cards CANNOT exist without an account owner.
Think about the purpose of each data type and what characters are necessary in each column. (Example: 02/2023 vs 02-02-2023)
Each account owner should have at least one credit card.
At least one account owner should have three credit cards.
<!-- Owner.find_by(name: 'John Doe')
owner1.credit_cards.create(number: '1234 5678 9012 3456', expiration_date: Date.new(2023, 2, 1))
owner2 = Owner.find_by(name: 'Derek Maly')
owner2.credit_cards.create(number: '1111 2222 3333 4444', expiration_date: Date.new(2023, 3, 1)) 

owner3 = Owner.find_by(name: 'Franz Marte')
owner3.credit_cards.create(number: '5555 6666 7777 8888', expiration_date: Date.new(2023, 6, 1)) 
owner3.credit_cards.create(number: '9999 0000 1111 2222', expiration_date: Date.new(2023, 7, 1)) 
owner3.credit_cards.create(number: '3333 4444 5555 6666', expiration_date:  -->