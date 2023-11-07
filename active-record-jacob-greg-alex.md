
<!-- ALL THE CORRECT COMMANDS ARE COMMENTED OUT. HOPEFULLY I'LL BE BACK IN TIME TO HELP Y'ALL FINISH! GOODLUCK!  -->
<!-- rails new active-record -d postgresql -T -->
<!-- rails db:create

rails generate model  People first_name:string last_name:string  phone_attribute:string -->

[WARNING] The model name 'People' was recognized as a plural, using the singular 'Person' instead. Override with --force-plural or setup custom inflection rules for this noun before running the generator.

<!-- 

rails db:migrate 
rails c 

-->


The rolodex application data should be managed by a PostgreSQL database in a Rails application.



The model should be called Person with first_name, last_name, and phone attributes. All data types should be strings.

<!--

 rails generate People first_name: last_name: phone_attribute: 

-->

Add five friends and family members to the people table using the Rails console.
<!-- 
Person.create(first_name: "Alex",  last_name: "Abebe",  phone_attribute: "Iphone")

Person.create(first_name: "Jacob",  last_name:" Amezola",  phone_attribute: "Iphone")

Person.create(first_name: "Gregory",  last_name:"Encalada",  phone_attribute: "Samsung")

Person.create(first_name: "Riri",  last_name:"Rihanna",  phone_attribute: "Teslacon")
 
Person.create(first_name: "Elon",  last_name:"Musk",  phone_attribute: "Nokia") 

-->

Retrieve all the people in the database.

<!-- Person.all -->

Retrieve the third person in the database.

<!-- Person.find(3) -->

Retrieve only the first name of the first person in the database.
<!-- Person.first.first_name -->


Remove the last person from the database.
<!-- Person.last.destroy -->


Add yourself to the people table.
 <!-- 
 
 Person.create(first_name: "Anikin", last_name:"Skywalker", phone_attribute:"comlink") 
 
 -->


Retrieve all the people that have the same last name as you.
<!-- Person.where(last_name:"Skywalker") -->


Retrieve only the first person from the list of people that have the same last name as you.
  <!-- Person.where(last_name:"Skywalker").first -->


Update the phone number of the second person in the database.
<!-- phone_number.update(phone_attribute:"Iphone: (xxx) xxx - xxxx") -->


Retrieve the last name of the third person in the database.
 <!-- Person.find(3).last_name -->


🏔 Stretch Goals
Update all the family members with the same last name as you to have the same phone number as you.

<!-- 
new_last_name = Person.find(1)
new_last_name.update(last_name:"Rihanna")
Person.all
married_phone_number1 = Person.find(4)
married_phone_number1.update(phone_attribute:"Teslacon: (626) 123 - 6969")
married_phone_number2 = Person.find(1)
married_phone_number2.update(phone_attribute:"Teslacon: (626) 123 - 6969")
Person.all -->


Remove all family members that do not have your last name. -->
<!--idea one :        Person.destroy([2,3,6])        DID NOT TRY-->



<!-- 

idea two :        Person.where(id: [2,3,6]).destroy_all   🎊🐈THIS ONE WORKED🐈‍⬛🎊 

-->