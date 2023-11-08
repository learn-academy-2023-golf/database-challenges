### 📇 Challenge: Rolodex

Note: A rolodex is a collection of paper cards that contain people's names and contact information. They were a common household and office item in the pre-digital age.

As a developer, I have been tasked with creating a database model to store friends and family contact information. I want to ensure the database behaves as expected and the necessary information can be retrieved, added, updated, and deleted.

All tasks should be performed in order as listed below.

### ✔️ Acceptance Criteria

- The rolodex application data should be managed by a PostgreSQL database in a Rails application.
- The model should be called Person with first_name, last_name, and phone attributes. **All data types should be strings.**
rails generate model Person first_name:string last_name:string phone:string
- Add five friends and family members to the people table using the Rails console.
Person.create(first_name: 'Steve', last_name: 'Jobs', phone:'1234567890')
Person.create(first_name: 'Steve', last_name: 'Wozniak', phone:'2345678901')
Person.create(first_name: 'Bill', last_name: 'Gates', phone: '3456789012')
Person.create(first_name: 'John', last_name: 'Wayne', phone: '4567890123')
Person.create(first_name: 'Jennifer', last_name: 'Mccormack', phone: '567890123
4')
- Retrieve all the people in the database.
Person.all
  Person Load (0.5ms)  SELECT "people".* FROM "people"
 => 
[#<Person:0x00000001064bce48
  id: 1,
  first_name: "Steve",
  last_name: "Jobs",
  phone: "1234567890",
  created_at: Tue, 07 Nov 2023 19:42:08.293928000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:42:08.293928000 UTC +00:00>,
 #<Person:0x00000001064bcd08
  id: 2,
  first_name: "Steve",
  last_name: "Wozniak",
  phone: "2345678901",
  created_at: Tue, 07 Nov 2023 19:44:10.856780000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:44:10.856780000 UTC +00:00>,
 #<Person:0x00000001064bcbc8
  id: 3,
  first_name: "Bill",
  last_name: "Gates",
  phone: "3456789012",
  created_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00>,
 #<Person:0x00000001064bca88
  id: 4,
  first_name: "John",
  last_name: "Wayne",
  phone: "4567890123",
  created_at: Tue, 07 Nov 2023 19:45:28.280989000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:45:28.280989000 UTC +00:00>,
 #<Person:0x00000001064bc948
  id: 5,
  first_name: "Jennifer",
  last_name: "Mccormack",
  phone: "5678901234",
  created_at: Tue, 07 Nov 2023 19:46:05.479344000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:46:05.479344000 UTC +00:00>] 
- Retrieve the third person in the database.
Person.find(3)
  Person Load (0.4ms)  SELECT "people".* FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
 => 
#<Person:0x00000001064b7bc8
 id: 3,
 first_name: "Bill",
 last_name: "Gates",
 phone: "3456789012",
 created_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00> 
- Retrieve only the first name of the first person in the database.
Person.first.first_name
  Person Load (0.3ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1  [["LIMIT", 1]]
 => "Steve" 
- Remove the last person from the database.
jennifer = Person.last
  Person Load (0.3ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" DESC LIMIT $1  [["LIMIT", 1]]
 => 
#<Person:0x00000001064b6cc8
... 
3.2.0 :013 > jennifer
 => 
#<Person:0x00000001064b6cc8
 id: 5,
 first_name: "Jennifer",
 last_name: "Mccormack",
 phone: "5678901234",
 created_at: Tue, 07 Nov 2023 19:46:05.479344000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 19:46:05.479344000 UTC +00:00> 
3.2.0 :014 > jennifer.destroy
  TRANSACTION (0.2ms)  BEGIN
  Person Destroy (1.5ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 5]]
  TRANSACTION (0.5ms)  COMMIT
 => 
#<Person:0x00000001064b6cc8
 id: 5,
 first_name: "Jennifer",
 last_name: "Mccormack",
 phone: "5678901234",
 created_at: Tue, 07 Nov 2023 19:46:05.479344000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 19:46:05.479344000 UTC +00:00> 
- Add yourself to the people table.
Person.create(first_name: 'Corey', last_name: 'Cass', phone: '6789012345')
- Retrieve all the people that have the same last name as you.
Person.where(last_name: 'Cass')
  Person Load (0.3ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1  [["last_name", "Cass"]]
 => 
[#<Person:0x00000001062bf3c0
  id: 6,
  first_name: "Corey",
  last_name: "Cass",
  phone: "6789012345",
  created_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00>] 
- Retrieve only the first person from the list of people that have the same last name as you.
Person.where(last_name: 'Cass').first
  Person Load (0.3ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1 ORDER BY "people"."id" ASC LIMIT $2  [["last_name", "Cass"], ["LIMIT", 1]]
 => 
#<Person:0x0000000106450dd8
 id: 6,
 first_name: "Corey",
 last_name: "Cass",
 phone: "6789012345",
 created_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00> 
- Update the phone number of the second person in the database.
second = Person.second
  Person Load (0.3ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1 OFFSET $2  [["LIMIT", 1], ["OFFSET", 1]]
 => 
#<Person:0x00000001064b7088
... 
3.2.0 :023 > second
 => 
#<Person:0x00000001064b7088
 id: 2,
 first_name: "Steve",
 last_name: "Wozniak",
 phone: "2345678901",
 created_at: Tue, 07 Nov 2023 19:44:10.856780000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 19:44:10.856780000 UTC +00:00> 
3.2.0 :024 > second.update(phone: '890123456789')
  TRANSACTION (0.2ms)  BEGIN
  Person Update (0.3ms)  UPDATE "people" SET "phone" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone", "890123456789"], ["updated_at", "2023-11-07 19:56:58.751583"], ["id", 2]]
  TRANSACTION (0.9ms)  COMMIT
 => true 
3.2.0 :025 > second
 => 
#<Person:0x00000001064b7088
 id: 2,
 first_name: "Steve",
 last_name: "Wozniak",
 phone: "890123456789",
 created_at: Tue, 07 Nov 2023 19:44:10.856780000 UTC +00:00,
 updated_at: Tue, 07 Nov 2023 19:56:58.751583000 UTC +00:00> 
- Retrieve the last name of the third person in the database.
Person.third.last_name
  Person Load (0.7ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1 OFFSET $2  [["LIMIT", 1], ["OFFSET", 2]]
 => "Gates" 


### 🏔 Stretch Goals

- Update all the family members with the same last name as you to have the same phone number as you.
family = Person.where(last_name: 'Cass')
  Person Load (0.5ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1  [["last_name", "Cass"]]
 => 
[#<Person:0x00000001062b6400
... 
3.2.0 :028 > family
 => 
[#<Person:0x00000001062b6400
  id: 6,
  first_name: "Corey",
  last_name: "Cass",
  phone: "6789012345",
  created_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00>,
 #<Person:0x00000001062b62c0
  id: 7,
  first_name: "Jeremy",
  last_name: "Cass",
  phone: "7890123456",
  created_at: Tue, 07 Nov 2023 19:55:40.738447000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:55:40.738447000 UTC +00:00>] 
3.2.0 :029 > family.update(phone: '6789012345')
  TRANSACTION (0.2ms)  BEGIN
  Person Update (0.7ms)  UPDATE "people" SET "phone" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone", "6789012345"], ["updated_at", "2023-11-07 19:58:58.344623"], ["id", 7]]
  TRANSACTION (0.8ms)  COMMIT
 => 
[#<Person:0x00000001062b6400
  id: 6,
  first_name: "Corey",
  last_name: "Cass",
  phone: "6789012345",
  created_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:51:39.975407000 UTC +00:00>,
 #<Person:0x00000001062b62c0
  id: 7,
  first_name: "Jeremy",
  last_name: "Cass",
  phone: "6789012345",
  created_at: Tue, 07 Nov 2023 19:55:40.738447000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:58:58.344623000 UTC +00:00>] 
- Remove all family members that do not have your last name.
not_family = Person.where.not(last_name: 'Cass')
  Person Load (3.1ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" != $1  [["last_name", "Cass"]]
 => 
[#<Person:0x000000010645c458
... 
3.2.0 :031 > not_family
 => 
[#<Person:0x000000010645c458
  id: 1,
  first_name: "Steve",
  last_name: "Jobs",
  phone: "1234567890",
  created_at: Tue, 07 Nov 2023 19:42:08.293928000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:42:08.293928000 UTC +00:00>,
 #<Person:0x000000010645c318
  id: 3,
  first_name: "Bill",
  last_name: "Gates",
  phone: "3456789012",
  created_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00>,
 #<Person:0x000000010645c1d8
  id: 4,
  first_name: "John",
  last_name: "Wayne",
  phone: "4567890123",
  created_at: Tue, 07 Nov 2023 19:45:28.280989000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:45:28.280989000 UTC +00:00>,
 #<Person:0x000000010645c098
  id: 2,
  first_name: "Steve",
  last_name: "Wozniak",
  phone: "890123456789",
  created_at: Tue, 07 Nov 2023 19:44:10.856780000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:56:58.751583000 UTC +00:00>] 
3.2.0 :032 > not_family.destroy
/Users/learnacademy/.rvm/gems/ruby-3.2.0/gems/activerecord-7.0.8/lib/active_record/persistence.rb:447:in `destroy': wrong number of arguments (given 0, expected 1) (ArgumentError)
3.2.0 :033 > not_family.destroy_all
  TRANSACTION (0.2ms)  BEGIN
  Person Destroy (3.1ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 1]]
  TRANSACTION (1.0ms)  COMMIT
  TRANSACTION (0.1ms)  BEGIN
  Person Destroy (0.2ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 3]]
  TRANSACTION (0.2ms)  COMMIT
  TRANSACTION (0.1ms)  BEGIN
  Person Destroy (0.2ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 4]]
  TRANSACTION (0.1ms)  COMMIT
  TRANSACTION (0.1ms)  BEGIN
  Person Destroy (0.2ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 2]]
  TRANSACTION (0.2ms)  COMMIT
 => 
[#<Person:0x000000010645c458
  id: 1,
  first_name: "Steve",
  last_name: "Jobs",
  phone: "1234567890",
  created_at: Tue, 07 Nov 2023 19:42:08.293928000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:42:08.293928000 UTC +00:00>,
 #<Person:0x000000010645c318
  id: 3,
  first_name: "Bill",
  last_name: "Gates",
  phone: "3456789012",
  created_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:44:45.360506000 UTC +00:00>,
 #<Person:0x000000010645c1d8
  id: 4,
  first_name: "John",
  last_name: "Wayne",
  phone: "4567890123",
  created_at: Tue, 07 Nov 2023 19:45:28.280989000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:45:28.280989000 UTC +00:00>,
 #<Person:0x000000010645c098
  id: 2,
  first_name: "Steve",
  last_name: "Wozniak",
  phone: "890123456789",
  created_at: Tue, 07 Nov 2023 19:44:10.856780000 UTC +00:00,
  updated_at: Tue, 07 Nov 2023 19:56:58.751583000 UTC +00:00>] 