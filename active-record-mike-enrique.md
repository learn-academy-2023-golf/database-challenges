<!-- 📇 Challenge: Rolodex
Note: A rolodex is a collection of paper cards that contain people's names and contact information. They were a common household and office item in the pre-digital age.

As a developer, I have been tasked with creating a database model to store friends and family contact information. I want to ensure the database behaves as expected and the necessary information can be retrieved, added, updated, and deleted.

All tasks should be performed in order as listed below.



✔️ Acceptance Criteria
The rolodex application data should be managed by a PostgreSQL database in a Rails application.

The model should be called Person with first_name, last_name, and phone attributes. All data types should be strings.

Person first_name:string last_name:string phone_number:string

Add five friends and family members to the people table using the Rails console.

3.2.0 :001 > Person.create(first_name: 'Mike', last_name: 'Jones', phone_number:
'281-330-8004')
  TRANSACTION (0.2ms)  BEGIN
  Person Create (2.5ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Mike"], ["last_name", "Jones"], ["phone_number", "281-330-8004"], ["created_at", "2023-11-07 21:13:23.969064"], ["updated_at", "2023-11-07 21:13:23.969064"]]
  TRANSACTION (0.9ms)  COMMIT
 => 
#<Person:0x000000011057c2e8
 id: 1,
 first_name: "Mike",
 last_name: "Jones",
 phone_number: "281-330-8004",
 created_at: Tue, 07 Nov 2023 21:13:23.969064000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:13:23.969064000 UTC +00:00> 
3.2.0 :002 > Person.create(first_name: 'Donald', last_name: 'Trump', phone_numbe
r:'917-756-8000')
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.5ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Donald"], ["last_name", "Trump"], ["phone_number", "917-756-8000"], ["created_at", "2023-11-07 21:14:45.572990"], ["updated_at", "2023-11-07 21:14:45.572990"]]
  TRANSACTION (0.8ms)  COMMIT
 => 
#<Person:0x000000011099b2c0
 id: 2,
 first_name: "Donald",
 last_name: "Trump",
 phone_number: "917-756-8000",
 created_at: Tue, 07 Nov 2023 21:14:45.572990000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:14:45.572990000 UTC +00:00> 
3.2.0 :003 > Person.create(first_name: 'Rihanna', last_name: 'Fenty', phone_numb
er:'661-601-1676')
  TRANSACTION (0.3ms)  BEGIN
  Person Create (0.4ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Rihanna"], ["last_name", "Fenty"], ["phone_number", "661-601-1676"], ["created_at", "2023-11-07 21:16:11.950994"], ["updated_at", "2023-11-07 21:16:11.950994"]]
  TRANSACTION (0.9ms)  COMMIT
 => 
#<Person:0x00000001109767e0
 id: 3,
 first_name: "Rihanna",
 last_name: "Reyes",
 phone_number: "661-601-1676",
 created_at: Tue, 07 Nov 2023 21:16:11.950994000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:16:11.950994000 UTC +00:00> 
3.2.0 :004 > Person.create(first_name: 'Mark', last_name: 'Zucky', phone_number:
'650-543-4800')
  TRANSACTION (1.7ms)  BEGIN
  Person Create (0.6ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Mark"], ["last_name", "Zucky"], ["phone_number", "650-543-4800"], ["created_at", "2023-11-07 21:16:56.721815"], ["updated_at", "2023-11-07 21:16:56.721815"]]
  TRANSACTION (0.9ms)  COMMIT
 => 
#<Person:0x00000001109771e0
 id: 4,
 first_name: "Mark",
 last_name: "Zucky",
 phone_number: "650-543-4800",
 created_at: Tue, 07 Nov 2023 21:16:56.721815000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:16:56.721815000 UTC +00:00> 
3.2.0 :005 > Person.create(first_name: 'Cardi', last_name: 'B', phone_number:'70
7-562-7774')
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.6ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Cardi"], ["last_name", "B"], ["phone_number", "707-562-7774"], ["created_at", "2023-11-07 21:17:53.003329"], ["updated_at", "2023-11-07 21:17:53.003329"]]
  TRANSACTION (1.2ms)  COMMIT

Retrieve all the people in the database.

 => 
#<Person:0x0000000110a1f7a0
 id: 5,
 first_name: "Cardi",
 last_name: "B",
 phone_number: "707-562-7774",
 created_at: Tue, 07 Nov 2023 21:17:53.003329000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:17:53.003329000 UTC +00:00> 
3.2.0 :006 > Person.all
  Person Load (1.1ms)  SELECT "people".* FROM "people"
 => 
[#<Person:0x0000000110afb908
  id: 1,
  first_name: "Mike",
  last_name: "Jones",
  phone_number: "281-330-8004",
  created_at: Tue, 07 Nov 2023 21:13:23.969064000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 21:13:23.969064000 UTC +00:00>,
 #<Person:0x0000000110afb7c8
  id: 2,
  first_name: "Donald",
  last_name: "Trump",
  phone_number: "917-756-8000",
  created_at: Tue, 07 Nov 2023 21:14:45.572990000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 21:14:45.572990000 UTC +00:00>,
 #<Person:0x0000000110afb688
  id: 3,
  first_name: "Rihanna",
  last_name: "Fenty",
  phone_number: "661-601-1676",
  created_at: Tue, 07 Nov 2023 21:16:11.950994000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 21:16:11.950994000 UTC +00:00>,
 #<Person:0x0000000110afb548
  id: 4,
  first_name: "Mark",
  last_name: "Zucky",
  phone_number: "650-543-4800",
  created_at: Tue, 07 Nov 2023 21:16:56.721815000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 21:16:56.721815000 UTC +00:00>,
 #<Person:0x0000000110afb408
  id: 5,
  first_name: "Cardi",
  last_name: "B",
  phone_number: "707-562-7774",
  created_at: Tue, 07 Nov 2023 21:17:53.003329000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 21:17:53.003329000 UTC +00:00>] 
3.2.0 :007 > 

Retrieve the third person in the database.

3.2.0 :007 > Person.third
  Person Load (0.4ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1 OFFSET $2  [["LIMIT", 1], ["OFFSET", 2]]
 => 
#<Person:0x0000000110adec40
 id: 3,
 first_name: "Rihanna",
 last_name: "Fenty",
 phone_number: "661-601-1676",
 created_at: Tue, 07 Nov 2023 21:16:11.950994000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:16:11.950994000 UTC +00:00> 
3.2.0 :008 > 


Retrieve only the first name of the first person in the database.

3.2.0 :018 > Person.first.first_name
  Person Load (0.5ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1  [["LIMIT", 1]]
 => "Mike" 
3.2.0 :019 > 

Remove the last person from the database.

3.2.0 :019 > Person.last.destroy
  Person Load (0.3ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" DESC LIMIT $1  [["LIMIT", 1]]
  TRANSACTION (0.2ms)  BEGIN
  Person Destroy (1.9ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 5]]
  TRANSACTION (0.5ms)  COMMIT
 => 
#<Person:0x0000000110af5c88
 id: 5,
 first_name: "Cardi",
 last_name: "B",
 phone_number: "707-562-7774",
 created_at: Tue, 07 Nov 2023 21:17:53.003329000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:17:53.003329000 UTC +00:00> 
3.2.0 :020 > 

Add yourself to the people table.

3.2.0 :020 > Person.create(first_name: 'Michael', last_name: 'Reyes', phone_numb
er:'904-881-0602')
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.4ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Michael"], ["last_name", "Reyes"], ["phone_number", "904-881-0602"], ["created_at", "2023-11-07 21:30:51.747564"], ["updated_at", "2023-11-07 21:30:51.747564"]]
  TRANSACTION (0.7ms)  COMMIT
 => 
#<Person:0x0000000110af76c8
 id: 6,
 first_name: "Michael",
 last_name: "Reyes",
 phone_number: "904-881-0602",
 created_at: Tue, 07 Nov 2023 21:30:51.747564000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:30:51.747564000 UTC +00:00> 
3.2.0 :021 > 



Retrieve all the people that have the same last name as you.

3.2.0 :022 > Person.where(last_name: 'Reyes')
  Person Load (0.9ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1  [["last_name", "Reyes"]]
 => 
[#<Person:0x000000011139f000
  id: 6,
  first_name: "Michael",
  last_name: "Reyes",
  phone_number: "904-881-0602",
  created_at: Tue, 07 Nov 2023 21:30:51.747564000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 21:30:51.747564000 UTC +00:00>] 
3.2.0 :023 > 


Retrieve only the first person from the list of people that have the same last name as you.

3.2.0 :025 > Person.where(last_name: 'Reyes')
  Person Load (0.4ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1  [["last_name", "Reyes"]]
 => 
[#<Person:0x00000001113d6910
  id: 6,
  first_name: "Michael",
  last_name: "Reyes",
  phone_number: "904-881-0602",
  created_at: Tue, 07 Nov 2023 21:30:51.747564000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 21:30:51.747564000 UTC +00:00>] 
3.2.0 :026 > 

Update the phone number of the second person in the database.

3.2.0 :027 > Updatephone.update(phone_number: "214-444-0000")
  TRANSACTION (0.4ms)  BEGIN
  Person Update (2.2ms)  UPDATE "people" SET "phone_number" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone_number", "214-444-0000"], ["updated_at", "2023-11-07 21:41:00.381267"], ["id", 2]]
  TRANSACTION (1.3ms)  COMMIT
 => true 
3.2.0 :028 > person.find(2)
(irb):28:in `<main>': undefined local variable or method `person' for main:Object (NameError)

person.find(2)
^^^^^^
3.2.0 :029 > Person.second
  Person Load (0.5ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1 OFFSET $2  [["LIMIT", 1], ["OFFSET", 1]]
 => 
#<Person:0x000000011139eec0
 id: 2,
 first_name: "Donald",
 last_name: "Trump",
 phone_number: "214-444-0000",
 created_at: Tue, 07 Nov 2023 21:14:45.572990000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:41:00.381267000 UTC +00:00> 
3.2.0 :030 > 

Retrieve the last name of the third person in the database.

3.2.0 :030 > Person.third.last_name
  Person Load (11.3ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1 OFFSET $2  [["LIMIT", 1], ["OFFSET", 2]]
 => "Reyes" 
3.2.0 :031 > 

🏔 Stretch Goals

Update all the family members with the same last name as you to have the same phone number as you.]

3.2.0 :034 > update_num = Person.find(3)
  Person Load (0.7ms)  SELECT "people".* FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
 => 
#<Person:0x00000001109d5790
... 
3.2.0 :035 > update_num.update(phone_number: "214-881-0602")
  TRANSACTION (0.2ms)  BEGIN
  Person Update (7.1ms)  UPDATE "people" SET "phone_number" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone_number", "214-881-0602"], ["updated_at", "2023-11-07 21:49:05.679062"], ["id", 3]]
  TRANSACTION (0.6ms)  COMMIT
 => true 
3.2.0 :036 > 


Remove all family members that do not have your last name. -->

<!-- deleting one person 
3.2.0 :036 > Mike = Person.find(1)
  Person Load (14.3ms)  SELECT "people".* FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
 => 
#<Person:0x00000001109d3ad0
... 
3.2.0 :037 > Mike.destroy
  TRANSACTION (0.2ms)  BEGIN
  Person Destroy (0.3ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 1]]
  TRANSACTION (0.9ms)  COMMIT
 => 
#<Person:0x00000001109d3ad0
 id: 1,
 first_name: "Mike",
 last_name: "Jones",
 phone_number: "281-330-8004",
 created_at: Tue, 07 Nov 2023 21:13:23.969064000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:13:23.969064000 UTC +00:00> 
3.2.0 :038 >  -->

<!-- 3.2.0 :038 > Mike = Person.find(2)
  Person Load (0.4ms)  SELECT "people".* FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
(irb):38: warning: already initialized constant Mike
(irb):36: warning: previous definition of Mike was here
 => 
#<Person:0x00000001109dd850
... 
3.2.0 :039 > Mike.destroy
  TRANSACTION (16.0ms)  BEGIN
  Person Destroy (0.4ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 2]]
  TRANSACTION (0.7ms)  COMMIT
 => 
#<Person:0x00000001109dd850
 id: 2,
 first_name: "Donald",
 last_name: "Trump",
 phone_number: "214-444-0000",
 created_at: Tue, 07 Nov 2023 21:14:45.572990000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 21:41:00.381267000 UTC +00:00> 
3.2.0 :040 >  -->

