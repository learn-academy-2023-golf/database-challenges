- The model should be called Person with first_name, last_name, and phone attributes. All data types should be strings.

    rails generate model Person first_name:string last_name:string phone:string

    rails db:migrate

- Add five friends and family members to the people table using the Rails console.
    - Person.create(first_name: "Mufasa", last_name: "Lyon", phone: "444-762-5567")
    - Person.create(first_name: "Peter", last_name: "Griffin", phone: "401-555-7772")
    - Person.create(first_name: "Bruce", last_name: "Wayne", phone: "661-213-4567")
    - Person.create(first_name: "Gordon", last_name: "Ramsey", phone: "619-762-3009")
    - Person.create(first_name: "Nick", last_name: "Fury", phone: "212-234-9876")

- Retrieve all the people in the database.

    Person.all

- Retrieve the third person in the database.

    Person.find(3)

- Retrieve only the first name of the first person in the database.

    Person.first.first_name

- Remove the last person from the database.

    nick = Person.last
    nick.destroy

- Add yourself to the people table.

    Person.create(first_name: "Christopher", last_name: "Wayne", phone: "602-987-1234")

- Retrieve all the people that have the same last name as you.

    Person.where(last_name: "Wayne")

- Retrieve only the first person from the list of people that have the same last name as you.

    Person.where(last_name: "Wayne").first

- Update the phone number of the second person in the database.

    number = Person.find(2)
    number.update(phone: "515-678-5432")

- Retrieve the last name of the third person in the database.

    Person.find(3).last_name

- Update all the family members with the same last name as you to have the same phone number as you.

    waynes = Person.where(last_name: "Wayne")
    waynes.update(phone: "111-222-3333")

- Remove all family members that do not have your last name

    Person.where.not(last_name: "Wayne").destroy_all


    !!!TAKING A BREAK!!!