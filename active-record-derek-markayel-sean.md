<!-- The rolodex application data should be managed by a PostgreSQL database in a Rails application. -->
rails new active-record -d postgresql -T
rails db:create 
<!-- The model should be called Person with first_name, last_name, and phone attributes. All data types should be strings. -->

rails generate model Person first_name:string last_name:string phone:string

rails db:migrate

<!-- Add five friends and family members to the people table using the Rails console. -->
Person.create(first_name:"Josh", last_name:"Drake", phone:"678-345-4667")

Person.create(first_name:"Bosh", last_name:"Drako", phone:"678-345-4117")

Person.create(first_name:"Sean", last_name:"Briski", phone:"878-345-4117")

Person.create(first_name:"Markayel", last_name:"Orelus", phone:"878-345-1117")

Person.create(first_name:"Petty", last_name:"Oreos", phone:"878-345-1227")
<!-- 
Retrieve all the people in the database. -->

Person.all

<!-- Retrieve the third person in the database. -->
Person.third
Person.find(3)

<!-- Retrieve only the first name of the first person in the database. -->
Person.first.first_name

<!-- Remove the last person from the database. -->
Person.last.destroy

<!-- Add yourself to the people table. -->
Person.create(first_name:"Derek", last_name:"Maly", phone:"717-345-1117")

<!-- Retrieve all the people that have the same last name as you. -->
Person.where(last_name:"Maly")

<!-- Retrieve only the first person from the list of people that have the same last name as you. -->
Person.where(last_name:"Maly").first

<!-- Update the phone number of the second person in the database. -->
Person.second.update(phone:"515-283-2343")

<!-- Retrieve the last name of the third person in the database. -->
Person.third.last_name

🏔 Stretch Goals
<!-- Update all the family members with the same last name as you to have the same phone number as you. -->

Person.where(last_name:"Maly").update(phone:Person.where(first_name:"Derek").phone)

<!-- Remove all family members that do not have your last name. -->
Person.where.not(last_name:"Maly").destroy_all