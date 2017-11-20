# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


contact = Contact.new(first_name: "Jeff", last_name: "Jackson", email: "JJ23@yahoo.com", phone_number: "(543)234-2741")
contact.save
contact = Contact.new(first_name: "Henry", last_name: "Kinsler", email: "henry3123413@aol.com", phone_number: "(652)124-1234")
contact.save

