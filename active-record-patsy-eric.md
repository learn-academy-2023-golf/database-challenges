The rolodex application data should be managed by a PostgreSQL database in a Rails application.
`rails new active-record -d postgresql -T`

The model should be called Person with first_name, last_name, and phone attributes. All data types should be strings.
`rails g model Person first_name:string last_name:string phone:string`

Add five friends and family members to the people table using the Rails console.
`Person.create(first_name: "Jane", last_name: "Doe", phone: "777-777-7777")`
`Person.create(first_name: "John", last_name: "Doe", phone: "777-777-7770")`
`Person.create(first_name: "Jill", last_name: "Doe", phone: "777-777-7771")`
`Person.create(first_name: "Jack", last_name: "Doe", phone: "777-777-7772")`
`Person.create(first_name: "Joe", last_name: "Doe", phone: "777-777-7773")`

Retrieve all the people in the database.
`Person.all`

Retrieve the third person in the database.
`Person.find(3)`

Retrieve only the first name of the first person in the database.
`Person.first.first_name`

Remove the last person from the database.
`last_person = Person.last`
`last_person.destroy`

Add yourself to the people table.
`Person.create(first_name: "Jeffery", last_name: "Lebowski",phone: "555-THE-DUDE")`

Retrieve all the people that have the same last name as you.
`Person.where(last_name: "Doe")`

Retrieve only the first person from the list of people that have the same last name as you.
`Person.where(:last_name == "Doe").first`

Update the phone number of the second person in the database.
`second_person = Person.find(2)`
`second_person.update(phone: "555-555-5555")`

Retrieve the last name of the third person in the database.
`third_person = Person.find(3)`
`third_person.last_name`

Update all the family members with the same last name as you to have the same phone number as you.
`does = Person.where(last_name: "Doe")`
`does.update(phone: "777-777-7777")`

Remove all family members that do not have your last name.
`Person.all`
`jeff = Person.find(6)`
`jeff.destroy`
